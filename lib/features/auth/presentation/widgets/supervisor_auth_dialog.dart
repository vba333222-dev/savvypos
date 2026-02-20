import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get_it/get_it.dart';
import 'package:drift/drift.dart' as drift;
import 'package:savvy_pos/core/config/theme/savvy_theme.dart';
import 'package:savvy_pos/core/database/database.dart';
import 'package:savvy_pos/core/presentation/widgets/savvy_numpad.dart';
import 'package:savvy_pos/core/presentation/widgets/savvy_text.dart';
import 'package:savvy_pos/features/auth/domain/enums/user_role.dart';
import 'package:savvy_pos/features/auth/data/datasources/audit_log_table.dart';

// ─────────────────────────────────────────────────────────────────────────────
// SupervisorAuthDialog
//
// A fast, seamless overlay for supervisor PIN authorization.
//
// Design principles:
//   • showDialog() — no route push, no navigation stack pollution.
//   • SavvyNumpad for input — no keyboard popup, works in gloves, tablet-first.
//   • AUTO-VERIFY at 4 digits — no AUTHORIZE button tap needed (1 less step
//     for cashier under pressure). Can configure maxPinLength if needed.
//   • Shake animation on wrong PIN for instant tactile feedback.
//   • On success: records to AuditLogTable automatically before returning.
//
// Usage:
//   See SupervisorGuard.require() for the preferred call site.
// ─────────────────────────────────────────────────────────────────────────────

const int _kPinLength = 4; // Auto-verify at this length

class SupervisorAuthResult {
  final bool authorized;
  final String? supervisorId;
  final String? supervisorName;
  final String? supervisorRole;

  const SupervisorAuthResult({
    required this.authorized,
    this.supervisorId,
    this.supervisorName,
    this.supervisorRole,
  });

  static const denied = SupervisorAuthResult(authorized: false);
}

class SupervisorAuthDialog extends StatefulWidget {
  final String title;
  final String reason;
  final AuditAction action;
  final String? orderUuid;
  final String? orderItemUuid;
  final String? detail;

  const SupervisorAuthDialog({
    super.key,
    this.title = 'Manager Approval Required',
    this.reason = 'This action requires supervisor authorization.',
    this.action = AuditAction.supervisorLogin,
    this.orderUuid,
    this.orderItemUuid,
    this.detail,
  });

  // ── Primary API: returns SupervisorAuthResult ───────────────────────────
  static Future<SupervisorAuthResult> show(
    BuildContext context, {
    String title = 'Manager Approval Required',
    String reason = 'This action requires supervisor authorization.',
    AuditAction action = AuditAction.supervisorLogin,
    String? orderUuid,
    String? orderItemUuid,
    String? detail,
  }) async {
    final result = await showDialog<SupervisorAuthResult>(
      context: context,
      barrierDismissible: false,
      // Semi-transparent barrier — feels like overlay, not full navigation
      barrierColor: Colors.black.withValues(alpha: 0.72),
      builder: (_) => SupervisorAuthDialog(
        title: title,
        reason: reason,
        action: action,
        orderUuid: orderUuid,
        orderItemUuid: orderItemUuid,
        detail: detail,
      ),
    );
    return result ?? SupervisorAuthResult.denied;
  }

  @override
  State<SupervisorAuthDialog> createState() => _SupervisorAuthDialogState();
}

class _SupervisorAuthDialogState extends State<SupervisorAuthDialog>
    with SingleTickerProviderStateMixin {
  String _pin = '';
  bool _isVerifying = false;
  String? _error;
  int _shakeTrigger = 0;

  // ── PIN input via SavvyNumpad ───────────────────────────────────────────
  void _onInput(String digit) {
    if (_pin.length >= _kPinLength || _isVerifying) return;
    setState(() {
      _pin += digit;
      _error = null;
    });
    // Auto-verify as soon as PIN is full length — zero extra taps
    if (_pin.length == _kPinLength) {
      _verifyPin();
    }
  }

  void _onBackspace() {
    if (_pin.isEmpty) return;
    setState(() => _pin = _pin.substring(0, _pin.length - 1));
  }

  void _onClear() {
    setState(() {
      _pin = '';
      _error = null;
    });
  }

  // ── Core PIN verification ───────────────────────────────────────────────
  Future<void> _verifyPin() async {
    if (_isVerifying) return;
    setState(() => _isVerifying = true);

    try {
      final db = GetIt.I<AppDatabase>();

      final employee = await (db.select(db.employeeTable)
            ..where((t) => t.pin.equals(_pin)))
          .getSingleOrNull();

      if (employee != null) {
        final role = UserRole.fromString(employee.role);
        if (RolePermissions.canPerformManagerOverride(role)) {
          // ── SUCCESS: write audit log before popping ──────────────────
          await _writeAuditLog(db, employee);
          HapticFeedback.heavyImpact();
          if (mounted) {
            Navigator.pop(
              context,
              SupervisorAuthResult(
                authorized: true,
                supervisorId: employee.uuid,
                supervisorName: employee.name,
                supervisorRole: employee.role,
              ),
            );
          }
          return;
        }
        _showError('Insufficient Privileges');
      } else {
        _showError('Invalid PIN');
      }
    } catch (e) {
      _showError('Authorization error');
    }
  }

  void _showError(String message) {
    HapticFeedback.heavyImpact();
    setState(() {
      _isVerifying = false;
      _error = message;
      _pin = '';
      _shakeTrigger++;
    });
  }

  // ── Append-only audit log entry ─────────────────────────────────────────
  Future<void> _writeAuditLog(
      AppDatabase db, EmployeeTableData supervisor) async {
    // Attempt to get current open shift for context (graceful fallback if none)
    String? shiftUuid;
    try {
      final shift = await (db.select(db.shiftSessionTable)
            ..where((t) => t.isClosed.equals(false))
            ..limit(1))
          .getSingleOrNull();
      shiftUuid = shift?.uuid;
    } catch (_) {
      // Non-critical — proceed without shift context
    }

    await db.into(db.auditLogTable).insert(AuditLogTableCompanion.insert(
          timestamp: DateTime.now(),
          // Cashier context: in a real app, read from AuthBloc/session.
          // For now, label as 'POS Terminal' to avoid hard dependency on AuthBloc here.
          cashierId: 'terminal',
          cashierName: 'POS Terminal',
          supervisorId: supervisor.uuid,
          supervisorName: supervisor.name,
          supervisorRole: supervisor.role,
          action: widget.action.name,
          orderUuid: drift.Value(widget.orderUuid),
          orderItemUuid: drift.Value(widget.orderItemUuid),
          detail: widget.detail ?? widget.reason,
          shiftSessionUuid: drift.Value(shiftUuid),
        ));
  }

  // ── Build ───────────────────────────────────────────────────────────────
  @override
  Widget build(BuildContext context) {
    final theme = context.savvy;

    return PopScope(
      canPop: false, // Prevents Android physical back button & swipe back
      child: Focus(
        autofocus: true, // Physical keyboard ready instantly
        onKeyEvent: (FocusNode node, KeyEvent event) {
          if (event is KeyDownEvent) {
            final key = event.logicalKey;
            // Catch 0-9 digits from physical keyboard
            if (key.keyLabel.length == 1 &&
                int.tryParse(key.keyLabel) != null) {
              _onInput(key.keyLabel);
              return KeyEventResult.handled;
            } else if (key == LogicalKeyboardKey.backspace) {
              _onBackspace();
              return KeyEventResult.handled;
            } else if (key == LogicalKeyboardKey.escape) {
              Navigator.pop(context, SupervisorAuthResult.denied);
              return KeyEventResult.handled;
            }
          }
          return KeyEventResult.ignored;
        },
        child: Dialog(
          backgroundColor: Colors.transparent,
          elevation: 0,
          insetPadding:
              const EdgeInsets.symmetric(horizontal: 32, vertical: 48),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 420),
              child: Material(
                borderRadius: BorderRadius.circular(20),
                color: theme.colors.bgSurface,
                elevation: 24,
                shadowColor: Colors.black.withValues(alpha: 0.6),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _buildHeader(theme),
                      _buildPinDots(theme),
                      if (_error != null) _buildErrorBanner(theme),
                      _buildNumpad(),
                      _buildFooter(theme),
                    ],
                  ),
                ),
              )
                  .animate(
                      target: _shakeTrigger > 0 ? 1 : 0,
                      onPlay: (c) => c.forward(from: 0))
                  .shakeX(
                      amount: 8, duration: 400.ms, curve: Curves.elasticOut),
            ),
          ),
        ),
      ),
    );
  }

  // ── Header: Shield icon + title + reason ────────────────────────────────
  Widget _buildHeader(SavvyTheme theme) {
    return Container(
      padding: const EdgeInsets.fromLTRB(24, 24, 24, 16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            const Color(0xFFE65100).withValues(alpha: 0.12),
            theme.colors.bgSurface,
          ],
        ),
      ),
      child: Column(
        children: [
          // Lock icon with soft glow
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: const Color(0xFFE65100).withValues(alpha: 0.12),
            ),
            child: const Icon(
              Icons.admin_panel_settings_rounded,
              size: 36,
              color: Color(0xFFE65100),
            ),
          ).animate(onPlay: (c) => c.repeat(reverse: true)).scaleXY(
              begin: 0.97,
              end: 1.03,
              duration: 1800.ms,
              curve: Curves.easeInOut),
          const SizedBox(height: 12),
          SavvyText(
            widget.title,
            style: SavvyTextStyle.h3,
            color: theme.colors.textPrimary,
          ),
          const SizedBox(height: 6),
          SavvyText(
            widget.reason,
            style: SavvyTextStyle.bodySmall,
            color: theme.colors.textSecondary,
            align: TextAlign.center,
          ),
        ],
      ),
    );
  }

  // ── PIN dot indicators ───────────────────────────────────────────────────
  Widget _buildPinDots(SavvyTheme theme) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(_kPinLength, (i) {
          final filled = i < _pin.length;
          return AnimatedContainer(
            duration: const Duration(milliseconds: 150),
            curve: Curves.easeOutBack,
            margin: const EdgeInsets.symmetric(horizontal: 10),
            width: filled ? 20 : 16,
            height: filled ? 20 : 16,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: filled
                  ? (_error != null
                      ? theme.colors.stateError
                      : const Color(0xFFE65100))
                  : theme.colors.borderDefault,
              boxShadow: filled
                  ? [
                      BoxShadow(
                        color: const Color(0xFFE65100).withValues(alpha: 0.4),
                        blurRadius: 8,
                        spreadRadius: 1,
                      ),
                    ]
                  : [],
            ),
          );
        }),
      ),
    );
  }

  // ── Error feedback bar ───────────────────────────────────────────────────
  Widget _buildErrorBanner(SavvyTheme theme) {
    return Container(
      margin: const EdgeInsets.fromLTRB(24, 0, 24, 12),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: theme.colors.stateError.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(10),
        border:
            Border.all(color: theme.colors.stateError.withValues(alpha: 0.3)),
      ),
      child: Row(
        children: [
          Icon(Icons.error_outline, size: 16, color: theme.colors.stateError),
          const SizedBox(width: 8),
          SavvyText(
            _error!,
            style: SavvyTextStyle.labelMedium,
            color: theme.colors.stateError,
          ),
        ],
      ),
    )
        .animate()
        .fadeIn(duration: 200.ms)
        .moveY(begin: -4, end: 0, duration: 200.ms);
  }

  // ── SavvyNumpad ──────────────────────────────────────────────────────────
  Widget _buildNumpad() {
    return _isVerifying
        ? const Padding(
            padding: EdgeInsets.symmetric(vertical: 48),
            child: CircularProgressIndicator(),
          )
        : SavvyNumpad(
            onInput: _onInput,
            onBackspace: _onBackspace,
            onClear: _onClear,
          );
  }

  // ── Cancel footer ────────────────────────────────────────────────────────
  Widget _buildFooter(SavvyTheme theme) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 8, 24, 24),
      child: GestureDetector(
        onTap: () => Navigator.pop(context, SupervisorAuthResult.denied),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: SavvyText(
            'CANCEL',
            style: SavvyTextStyle.labelMedium,
            color: theme.colors.textMuted,
          ),
        ),
      ),
    );
  }
}
