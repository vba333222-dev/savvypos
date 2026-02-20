import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:savvy_pos/features/kitchen/domain/entities/kds_entities.dart';
import 'package:savvy_pos/features/kitchen/domain/repositories/i_kds_repository.dart';
import 'package:savvy_pos/features/kitchen/presentation/bloc/kitchen_bloc.dart';
import 'package:savvy_pos/features/kitchen/presentation/widgets/kds_expo_view.dart';
import 'package:savvy_pos/features/kitchen/presentation/widgets/kds_ticket_card.dart';
import 'package:savvy_pos/core/di/injection.dart';

// ─────────────────────────────────────────────────────────────────────────────
// KdsPage: High-contrast Kitchen Display System for chef use.
//
// Modes:
//   • CHEF VIEW  — horizontal-scroll masonry columns of KdsTicketCards
//   • EXPO VIEW  — aggregated summary (KdsExpoView)
//
// Layout goal:
//   ┌──────┬──────┬──────┬──────┐
//   │ T#1  │ T#2  │ T#5  │ T#7  │    ← Oldest → Newest (left to right)
//   │ 🔴   │ 🟡   │      │      │
//   │      │ T#4  │ T#6  │ T#8  │
//   │ T#3  │      │      │      │
//   └──────┴──────┴──────┴──────┘
//
// Each column is 320px wide. Columns form a horizontally-scrolling panel.
// Tickets sorted: oldest (most urgent) at top-left.
// ─────────────────────────────────────────────────────────────────────────────

/// Number of rows visible per column. Cards are distributed top-down.
const int _kRowsPerColumn = 2;

/// Fixed visual width of each ticket card column.
const double _kColumnWidth = 340.0;

class KdsPage extends StatefulWidget {
  const KdsPage({super.key});

  @override
  State<KdsPage> createState() => _KdsPageState();
}

class _KdsPageState extends State<KdsPage> {
  final _kdsRepo = getIt<IKDSRepository>();
  bool _isExpoMode = false;

  @override
  Widget build(BuildContext context) {
    // Provide KitchenBloc for the page tree
    return BlocProvider(
      create: (_) => getIt<KitchenBloc>()..add(const KitchenEvent.startListening()),
      child: _KdsPageBody(
        kdsRepo: _kdsRepo,
        isExpoMode: _isExpoMode,
        onToggleMode: (expo) => setState(() => _isExpoMode = expo),
      ),
    );
  }
}

class _KdsPageBody extends StatelessWidget {
  final IKDSRepository kdsRepo;
  final bool isExpoMode;
  final ValueChanged<bool> onToggleMode;

  const _KdsPageBody({
    required this.kdsRepo,
    required this.isExpoMode,
    required this.onToggleMode,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D0D0D), // True-black KDS background
      appBar: _KdsAppBar(
        isExpoMode: isExpoMode,
        onToggle: onToggleMode,
      ),
      body: isExpoMode ? _buildExpoView() : _buildChefView(context),
    );
  }

  Widget _buildChefView(BuildContext context) {
    return StreamBuilder<List<KDSTicket>>(
      stream: kdsRepo.watchActiveTickets(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(color: Color(0xFF00E676)),
          );
        }

        final tickets = snapshot.data!;

        if (tickets.isEmpty) {
          return _AllCaughtUpState();
        }

        return _HorizontalMasonryGrid(
          tickets: tickets,
          kdsRepo: kdsRepo,
        );
      },
    );
  }

  Widget _buildExpoView() {
    return StreamBuilder<KDSExpoSummary>(
      stream: kdsRepo.watchExpoSummary(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(color: Color(0xFF00E676)),
          );
        }
        return KdsExpoView(summary: snapshot.data!);
      },
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// _HorizontalMasonryGrid
//
// Distributes N tickets into columns of _kRowsPerColumn rows each.
// Scrolls horizontally like a chef's KDS "wall of tickets."
// ─────────────────────────────────────────────────────────────────────────────
class _HorizontalMasonryGrid extends StatelessWidget {
  final List<KDSTicket> tickets;
  final IKDSRepository kdsRepo;

  const _HorizontalMasonryGrid({
    required this.tickets,
    required this.kdsRepo,
  });

  @override
  Widget build(BuildContext context) {
    // Distribute tickets into columns: topmost slots first
    // e.g. with _kRowsPerColumn=2 and 5 tickets:
    //   Col 0: [tickets[0], tickets[1]]
    //   Col 1: [tickets[2], tickets[3]]
    //   Col 2: [tickets[4]]
    final columnCount = (tickets.length / _kRowsPerColumn).ceil();

    return ListView.builder(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
      itemCount: columnCount,
      itemBuilder: (context, colIndex) {
        final startIndex = colIndex * _kRowsPerColumn;
        final endIndex = (startIndex + _kRowsPerColumn).clamp(0, tickets.length);
        final columnTickets = tickets.sublist(startIndex, endIndex);

        return SizedBox(
          width: _kColumnWidth,
          child: Padding(
            padding: const EdgeInsets.only(right: 12),
            child: Column(
              children: [
                for (int rowIdx = 0; rowIdx < columnTickets.length; rowIdx++)
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(
                        bottom: rowIdx < columnTickets.length - 1 ? 12 : 0,
                      ),
                      child: _AnimatedTicketEntry(
                        key: ValueKey(columnTickets[rowIdx].uuid),
                        delayMs: colIndex * 60,
                        child: KdsTicketCard(
                          ticket: columnTickets[rowIdx],
                          onBump: () {
                            HapticFeedback.heavyImpact();
                            kdsRepo.bumpTicket(columnTickets[rowIdx].uuid);
                            // Also fire BLoC event to sync via WebSocket
                            context.read<KitchenBloc>().add(
                                  KitchenEvent.markAsDone(columnTickets[rowIdx].orderUuid),
                                );
                          },
                          onRecall: () {
                            HapticFeedback.mediumImpact();
                            kdsRepo.recallTicket(columnTickets[rowIdx].uuid);
                          },
                          onItemToggle: (itemUuid) {
                            // Fire BLoC event: markItemDone → repository → WebSocket
                            context.read<KitchenBloc>().add(
                                  KitchenEvent.markItemDone(itemUuid),
                                );
                            // Also update KDS repository directly
                            final item = columnTickets[rowIdx].items
                                .firstWhere((i) => i.uuid == itemUuid);
                            final nextStatus = item.status == KDSTicketStatus.ready
                                ? KDSTicketStatus.prep
                                : KDSTicketStatus.ready;
                            kdsRepo.updateItemStatus(itemUuid, nextStatus);
                          },
                        ),
                      ),
                    ),
                  ),
                // If column has only 1 ticket, fill remaining space
                if (columnTickets.length < _kRowsPerColumn)
                  const Expanded(child: SizedBox.shrink()),
              ],
            ),
          ),
        );
      },
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// _AnimatedTicketEntry: Slides in from right when new ticket appears
// ─────────────────────────────────────────────────────────────────────────────
class _AnimatedTicketEntry extends StatelessWidget {
  final Widget child;
  final int delayMs;

  const _AnimatedTicketEntry({
    super.key,
    required this.child,
    required this.delayMs,
  });

  @override
  Widget build(BuildContext context) {
    return child
        .animate(delay: Duration(milliseconds: delayMs))
        .slideX(begin: 0.15, end: 0, duration: 350.ms, curve: Curves.easeOutCubic)
        .fadeIn(duration: 300.ms);
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// _AllCaughtUpState: Shown when no active tickets exist
// ─────────────────────────────────────────────────────────────────────────────
class _AllCaughtUpState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.check_circle_outline, size: 96, color: Colors.green.shade700)
              .animate(onPlay: (c) => c.repeat(reverse: true))
              .scale(begin: const Offset(0.95, 0.95), end: const Offset(1.05, 1.05), duration: 1500.ms),
          const SizedBox(height: 20),
          const Text(
            'ALL CAUGHT UP!',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w900,
              color: Colors.white,
              letterSpacing: 3,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'No pending kitchen tickets',
            style: TextStyle(
              fontSize: 15,
              color: Colors.white.withValues(alpha: 0.4),
              letterSpacing: 1,
            ),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// _KdsAppBar: High-contrast app bar with CHEF/EXPO toggle
// ─────────────────────────────────────────────────────────────────────────────
class _KdsAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool isExpoMode;
  final ValueChanged<bool> onToggle;

  const _KdsAppBar({required this.isExpoMode, required this.onToggle});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xFF141414),
      elevation: 0,
      title: Row(
        children: [
          Container(
            width: 10,
            height: 10,
            margin: const EdgeInsets.only(right: 10),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFF00E676),
              boxShadow: [
                BoxShadow(color: Color(0xFF00E676), blurRadius: 8, spreadRadius: 1),
              ],
            ),
          )
              .animate(onPlay: (c) => c.repeat(reverse: true))
              .fadeIn(begin: 0.3, duration: 1000.ms),
          const Text(
            'KITCHEN DISPLAY',
            style: TextStyle(
              fontWeight: FontWeight.w900,
              letterSpacing: 2.5,
              fontSize: 16,
              color: Colors.white,
            ),
          ),
        ],
      ),
      actions: [
        // Ticket count badge
        BlocBuilder<KitchenBloc, KitchenState>(
          builder: (context, state) {
            final count = state.maybeWhen(
              loaded: (orders) => orders.length,
              orElse: () => 0,
            );
            if (count == 0) return const SizedBox.shrink();
            return Center(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  color: count >= 10 ? Colors.red : const Color(0xFF00E676),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  '$count TICKET${count > 1 ? 'S' : ''}',
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w900,
                    fontSize: 13,
                    letterSpacing: 1,
                  ),
                ),
              ),
            );
          },
        ),

        // CHEF / EXPO toggle
        Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: SegmentedButton<bool>(
            style: SegmentedButton.styleFrom(
              backgroundColor: const Color(0xFF1E1E1E),
              selectedBackgroundColor: const Color(0xFF00E676),
              selectedForegroundColor: Colors.black,
              foregroundColor: Colors.white60,
              side: const BorderSide(color: Color(0xFF333333)),
            ),
            showSelectedIcon: false,
            segments: const [
              ButtonSegment<bool>(
                value: false,
                label: Text('CHEF', style: TextStyle(fontWeight: FontWeight.w800, fontSize: 12)),
                icon: Icon(Icons.grid_view, size: 16),
              ),
              ButtonSegment<bool>(
                value: true,
                label: Text('EXPO', style: TextStyle(fontWeight: FontWeight.w800, fontSize: 12)),
                icon: Icon(Icons.list_alt, size: 16),
              ),
            ],
            selected: {isExpoMode},
            onSelectionChanged: (s) {
              HapticFeedback.selectionClick();
              onToggle(s.first);
            },
          ),
        ),
      ],
    );
  }
}
