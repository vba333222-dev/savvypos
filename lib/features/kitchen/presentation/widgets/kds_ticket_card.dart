import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:savvy_pos/features/kitchen/domain/entities/kds_entities.dart';

// ─────────────────────────────────────────────────────────────────────────────
// KDS SLA Color System
//
//  0–10 min  → GREEN   (on track)
// 10–20 min  → AMBER   (approaching limit)
//    >20 min → RED     (overdue, slowly blinks)
// ─────────────────────────────────────────────────────────────────────────────
Color _slaColor(Duration elapsed) {
  final minutes = elapsed.inMinutes;
  if (minutes < 10) return const Color(0xFF00E676); // Green A400
  if (minutes < 20) return const Color(0xFFFFD740); // Amber A400
  return const Color(0xFFFF1744); // Red A400
}

bool _isTicketOverdue(Duration elapsed) => elapsed.inMinutes >= 20;

// ─────────────────────────────────────────────────────────────────────────────
// KdsTicketCard
//
// Features:
//   • Per-card live SLA timer via Ticker (rebuilds ONLY this card's timer text,
//     NOT the whole KDS page — uses AnimatedBuilder + local Ticker)
//   • Swipe LEFT  → Dismiss (bump/complete entire ticket)
//   • Double-tap item row → Mark single item done (60×60px touch target)
//   • High-contrast dark theme for kitchen visibility
//   • Blink effect on overdue (>20 min) using flutter_animate repeat
// ─────────────────────────────────────────────────────────────────────────────
class KdsTicketCard extends StatefulWidget {
  final KDSTicket ticket;

  /// Called when user swipes left to complete the whole ticket.
  final VoidCallback? onBump;

  /// Called when user swipes right to recall a completed ticket.
  final VoidCallback? onRecall;

  /// Called when user double-taps a single item (marks that item done).
  final Function(String itemUuid)? onItemToggle;

  const KdsTicketCard({
    super.key,
    required this.ticket,
    this.onBump,
    this.onRecall,
    this.onItemToggle,
  });

  @override
  State<KdsTicketCard> createState() => _KdsTicketCardState();
}

class _KdsTicketCardState extends State<KdsTicketCard> {
  /// Tracks locally-dismissed items (optimistic UI before backend confirms)
  final Set<String> _doneItems = {};

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Color get _headerColor => _slaColor(widget.ticket.duration);
  bool get _isDone => widget.ticket.status == KDSTicketStatus.ready;
  bool get _isOverdue => _isTicketOverdue(widget.ticket.duration);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(widget.ticket.uuid),
      // ── Swipe LEFT → Complete (Bump) ──────────────────────────────────
      direction: DismissDirection.endToStart,
      confirmDismiss: (_) async {
        HapticFeedback.mediumImpact();
        if (_isDone) {
          widget.onRecall?.call();
        } else {
          widget.onBump?.call();
        }
        // Return false: we manage the list externally via BLoC stream.
        // This prevents the Dismissible from removing the card itself.
        return false;
      },
      background: Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 24),
        color: _isDone ? Colors.blueGrey[800] : const Color(0xFF00C853),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              _isDone ? Icons.undo : Icons.check_circle,
              color: Colors.white,
              size: 40,
            ),
            const SizedBox(height: 4),
            Text(
              _isDone ? 'RECALL' : 'BUMP!',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 13,
                fontWeight: FontWeight.w900,
                letterSpacing: 1.5,
              ),
            ),
          ],
        ),
      ),
      child: _buildCard(),
    );
  }

  Widget _buildCard() {
    return Container(
      margin: const EdgeInsets.all(0),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1A1A), // High-contrast dark background
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: _headerColor.withValues(alpha: _isOverdue ? 0.9 : 0.6),
          width: _isOverdue ? 3 : 2,
        ),
        boxShadow: [
          BoxShadow(
            color: _headerColor.withValues(alpha: 0.25),
            blurRadius: 12,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildHeader(),
          Expanded(child: _buildItemList()),
          _buildFooter(),
        ],
      ),
    );
  }

  // ── Header: Order number + Table + SLA Timer ────────────────────────────
  Widget _buildHeader() {
    return Container(
      decoration: BoxDecoration(
        color: _headerColor.withValues(alpha: 0.15),
        borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Rush badge
          if (widget.ticket.isRush)
            Container(
              margin: const EdgeInsets.only(right: 8),
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(4),
              ),
              child: const Text(
                'RUSH',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 1.5,
                ),
              ),
            ),

          // Delivery Badge (Gojek / Grab)
          if (widget.ticket.tableName != null && widget.ticket.tableName!.toUpperCase().contains('GOJEK'))
             Container(
              margin: const EdgeInsets.only(right: 8),
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(color: Colors.green[800], borderRadius: BorderRadius.circular(4)),
              child: const Text('GOFOOD', style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.w900)),
             )
          else if (widget.ticket.tableName != null && widget.ticket.tableName!.toUpperCase().contains('GRAB'))
             Container(
              margin: const EdgeInsets.only(right: 8),
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(color: Colors.green, borderRadius: BorderRadius.circular(4)),
              child: const Text('GRAB', style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.w900)),
             ),

          // Order number — largest element for visibility at 3+ metres
          Text(
            '#${widget.ticket.orderNumber}',
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w900,
              color: Colors.white,
              letterSpacing: 0.5,
            ),
          ),
          const Spacer(),
          // Live SLA timer (Isolated micro-rebuild)
          KdsTicketTimerWidget(ticket: widget.ticket),
        ],
      ),
    );
  }

  // ── Item List: Double-tap to mark item done ─────────────────────────────
  Widget _buildItemList() {
    final items = widget.ticket.items;
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      physics: const NeverScrollableScrollPhysics(),
      itemCount: items.length,
      separatorBuilder: (_, __) => Divider(
        color: Colors.white.withValues(alpha: 0.08),
        height: 1,
      ),
      itemBuilder: (context, index) {
        final item = items[index];
        final isDone = _doneItems.contains(item.uuid) ||
            item.status == KDSTicketStatus.ready ||
            item.status == KDSTicketStatus.served;

        return _KdsItemRow(
          item: item,
          isDone: isDone,
          onDoubleTap: () {
            HapticFeedback.mediumImpact();
            // Optimistic UI — locally mark done immediately
            setState(() => _doneItems.add(item.uuid));
            // Fire BLoC event asynchronously
            widget.onItemToggle?.call(item.uuid);
          },
        );
      },
    );
  }

  // ── Footer: Table + Server + Action hint ────────────────────────────────
  Widget _buildFooter() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.04),
        borderRadius: const BorderRadius.vertical(bottom: Radius.circular(10)),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      child: Row(
        children: [
          // Table identifier
          Icon(Icons.table_bar,
              size: 14, color: Colors.white.withValues(alpha: 0.5)),
          const SizedBox(width: 4),
          Text(
            widget.ticket.tableName ?? 'Takeout',
            style: TextStyle(
              color: Colors.white.withValues(alpha: 0.7),
              fontSize: 13,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(width: 12),
          Text(
            widget.ticket.serverName ?? '',
            style: TextStyle(
              color: Colors.white.withValues(alpha: 0.4),
              fontSize: 12,
            ),
          ),
          const Spacer(),
          // Swipe hint — small icon
          Icon(
            _isDone ? Icons.undo : Icons.swipe_left,
            size: 16,
            color: _headerColor.withValues(alpha: 0.6),
          ),
          const SizedBox(width: 4),
          Text(
            _isDone ? 'Recall' : 'Swipe to Bump',
            style: TextStyle(
              color: _headerColor.withValues(alpha: 0.6),
              fontSize: 11,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// KdsTicketTimerWidget: Isolated Ticker Widget
// Uses Ticker (tied to screen refresh rate) to tick exactly every 1 second
// while the screen is visible. Pauses automatically in background!
// ─────────────────────────────────────────────────────────────────────────────
class KdsTicketTimerWidget extends StatefulWidget {
  final KDSTicket ticket;
  const KdsTicketTimerWidget({super.key, required this.ticket});

  @override
  State<KdsTicketTimerWidget> createState() => _KdsTicketTimerWidgetState();
}

class _KdsTicketTimerWidgetState extends State<KdsTicketTimerWidget>
    with SingleTickerProviderStateMixin {
  late Ticker _ticker;
  late Duration _elapsed;
  late DateTime _lastTick;

  @override
  void initState() {
    super.initState();
    _elapsed = widget.ticket.duration;
    _lastTick = DateTime.now();

    _ticker = createTicker((_) {
      final now = DateTime.now();
      if (now.difference(_lastTick).inSeconds >= 1) {
        _lastTick = now;
        setState(() {
          _elapsed = widget.ticket.duration;
        });
      }
    });
    _ticker.start();
  }

  @override
  void dispose() {
    _ticker.dispose();
    super.dispose();
  }

  String _formatElapsed(Duration d) {
    final m = d.inMinutes.toString().padLeft(2, '0');
    final s = (d.inSeconds % 60).toString().padLeft(2, '0');
    return '$m:$s';
  }

  @override
  Widget build(BuildContext context) {
    final color = _slaColor(_elapsed);
    final isOverdue = _isTicketOverdue(_elapsed);
    final timeStr = _formatElapsed(_elapsed);

    Widget timerWidget = Text(
      timeStr,
      style: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w900,
        color: color,
        fontFeatures: const [FontFeature.tabularFigures()],
      ),
    );

    if (isOverdue) {
      timerWidget = timerWidget
          .animate(
            onPlay: (c) => c.repeat(reverse: true),
            key: const ValueKey(
                'blink_anim'), // Prevents animation reset every second
          )
          .fadeIn(begin: 0.3, duration: 700.ms)
          .then()
          .fadeOut(begin: 1.0, duration: 700.ms);
    }

    return timerWidget;
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// _KdsItemRow: Single item row inside a ticket card.
//
// Touch target is minimum 64×64px (GestureDetector wraps full row height).
// Double-tap marks this item as done.
// ─────────────────────────────────────────────────────────────────────────────
class _KdsItemRow extends StatefulWidget {
  final KDSItem item;
  final bool isDone;
  final VoidCallback onDoubleTap;

  const _KdsItemRow({
    required this.item,
    required this.isDone,
    required this.onDoubleTap,
  });

  @override
  State<_KdsItemRow> createState() => _KdsItemRowState();
}

class _KdsItemRowState extends State<_KdsItemRow> {
  bool _flashing = false;

  void _handleDoubleTap() async {
    setState(() => _flashing = true);
    widget.onDoubleTap();
    await Future.delayed(const Duration(milliseconds: 300));
    if (mounted) setState(() => _flashing = false);
  }

  @override
  Widget build(BuildContext context) {
    final isDone = widget.isDone;

    return GestureDetector(
      onDoubleTap: isDone ? null : _handleDoubleTap,
      behavior: HitTestBehavior.opaque,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOut,
        // ── Minimum 64px tall touch target ──
        constraints: const BoxConstraints(minHeight: 64),
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 10),
        decoration: BoxDecoration(
          color: _flashing
              ? const Color(0xFF00E676).withValues(alpha: 0.15)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // ── Quantity badge (min 48×48 touch area included in parent) ──
            Container(
              width: 48,
              height: 48,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: isDone
                    ? Colors.white.withValues(alpha: 0.06)
                    : const Color(0xFF00E676).withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: isDone
                      ? Colors.white.withValues(alpha: 0.1)
                      : const Color(0xFF00E676).withValues(alpha: 0.4),
                ),
              ),
              child: Text(
                '×${widget.item.quantity}',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w900,
                  color: isDone
                      ? Colors.white.withValues(alpha: 0.3)
                      : Colors.white,
                ),
              ),
            ),
            const SizedBox(width: 12),

            // ── Item details ──────────────────────────────────────────────
            Expanded(
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 300),
                opacity: isDone ? 0.35 : 1.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.item.name,
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                        decoration: isDone ? TextDecoration.lineThrough : null,
                        decorationColor: Colors.white54,
                        decorationThickness: 2,
                      ),
                    ),
                    if (widget.item.modifiers.isNotEmpty) ...[
                      const SizedBox(height: 2),
                      Wrap(
                        spacing: 4,
                        runSpacing: 2,
                        children: widget.item.modifiers
                            .map((m) => _ModifierChip(label: m))
                            .toList(),
                      ),
                    ],
                    if (widget.item.status == KDSTicketStatus.fired) ...[
                      const SizedBox(height: 3),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(
                          color: Colors.blueAccent.withValues(alpha: 0.2),
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(color: Colors.blueAccent),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(Icons.bolt, size: 12, color: Colors.blueAccent),
                            const SizedBox(width: 3),
                            Text(
                              'FIRED: ${widget.item.course.name.toUpperCase()}',
                              style: const TextStyle(
                                color: Colors.blueAccent,
                                fontSize: 10,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                    if (widget.item.note != null) ...[
                      const SizedBox(height: 3),
                      Row(
                        children: [
                          const Icon(Icons.priority_high,
                              size: 12, color: Color(0xFFFF6D00)),
                          const SizedBox(width: 3),
                          Flexible(
                            child: Text(
                              widget.item.note!,
                              style: const TextStyle(
                                color: Color(0xFFFF6D00),
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ],
                ),
              ),
            ),

            // ── Done indicator ────────────────────────────────────────────
            SizedBox(
              width: 40,
              height: 48,
              child: Center(
                child: isDone
                    ? const Icon(Icons.check_circle,
                        color: Color(0xFF00E676), size: 26)
                    : Icon(
                        Icons.touch_app,
                        color: Colors.white.withValues(alpha: 0.2),
                        size: 20,
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Modifier chip: compact label for item modifications
// ─────────────────────────────────────────────────────────────────────────────
class _ModifierChip extends StatelessWidget {
  final String label;
  const _ModifierChip({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: Colors.white.withValues(alpha: 0.12)),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: Colors.white.withValues(alpha: 0.65),
          fontSize: 11,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
