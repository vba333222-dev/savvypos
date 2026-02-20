import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:savvy_pos/core/config/theme/savvy_theme.dart';
import 'package:savvy_pos/core/presentation/widgets/savvy_text.dart';
import 'package:savvy_pos/features/inventory/domain/entities/advanced_inventory_entities.dart';
import 'package:savvy_pos/features/inventory/presentation/bloc/advanced_inventory_bloc.dart';

class StockMovementPage extends StatelessWidget {
  const StockMovementPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => GetIt.I<AdvancedInventoryBloc>()..add(const AdvancedInventoryEvent.loadMovements()),
      child: const _StockMovementContent(),
    );
  }
}

class _StockMovementContent extends StatefulWidget {
  const _StockMovementContent();

  @override
  State<_StockMovementContent> createState() => _StockMovementContentState();
}

class _StockMovementContentState extends State<_StockMovementContent> {
  MovementType? _selectedType;
  DateTime? _startDate;
  DateTime? _endDate;

  void _applyFilters() {
    context.read<AdvancedInventoryBloc>().add(AdvancedInventoryEvent.loadMovements(
      startDate: _startDate,
      endDate: _endDate,
    ));
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.savvy;

    return Scaffold(
      backgroundColor: theme.colors.bgCanvas,
      appBar: AppBar(
        backgroundColor: theme.colors.bgSurface,
        title: Row(
          children: [
            Icon(Icons.history, color: theme.colors.brandPrimary),
            const SizedBox(width: 8),
            const Text('Stock Movements'),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () => _showFilterSheet(context),
          ),
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              HapticFeedback.mediumImpact();
              _applyFilters();
            },
          ),
        ],
      ),
      body: BlocBuilder<AdvancedInventoryBloc, AdvancedInventoryState>(
        builder: (context, state) {
          if (state.isLoadingMovements) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state.movements.isEmpty) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.history, size: 64, color: theme.colors.textSecondary),
                  const SizedBox(height: 16),
                  Text('No movements recorded', style: TextStyle(color: theme.colors.textSecondary)),
                ],
              ),
            );
          }

          // Group movements by date
          final grouped = <String, List<StockMovement>>{};
          for (final movement in state.movements) {
            final dateKey = DateFormat('yyyy-MM-dd').format(movement.timestamp);
            grouped.putIfAbsent(dateKey, () => []).add(movement);
          }

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: grouped.length,
            itemBuilder: (context, index) {
              final dateKey = grouped.keys.elementAt(index);
              final movements = grouped[dateKey]!;
              final date = DateTime.parse(dateKey);

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Date Header
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: theme.colors.brandPrimary.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            _formatDateHeader(date),
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: theme.colors.brandPrimary,
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          '${movements.length} movements',
                          style: TextStyle(fontSize: 12, color: theme.colors.textSecondary),
                        ),
                      ],
                    ),
                  ),

                  // Timeline
                  ...movements.asMap().entries.map((entry) {
                    final i = entry.key;
                    final movement = entry.value;
                    return _MovementTimelineTile(
                      movement: movement,
                      isFirst: i == 0,
                      isLast: i == movements.length - 1,
                    ).animate().fadeIn(duration: 200.ms, delay: (i * 50).ms);
                  }),

                  const SizedBox(height: 16),
                ],
              );
            },
          );
        },
      ),
    );
  }

  String _formatDateHeader(DateTime date) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = today.subtract(const Duration(days: 1));
    final dateOnly = DateTime(date.year, date.month, date.day);

    if (dateOnly == today) return 'Today';
    if (dateOnly == yesterday) return 'Yesterday';
    return DateFormat('MMM d, yyyy').format(date);
  }

  void _showFilterSheet(BuildContext context) {
    final theme = context.savvy;
    
    showModalBottomSheet(
      context: context,
      backgroundColor: theme.colors.bgSurface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SavvyText.h4('Filter Movements'),
            const SizedBox(height: 16),
            
            // Movement Type Filter
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: MovementType.values.map((type) {
                final isSelected = _selectedType == type;
                return FilterChip(
                  label: Text(_getTypeName(type)),
                  selected: isSelected,
                  onSelected: (selected) {
                    setState(() {
                      _selectedType = selected ? type : null;
                    });
                    Navigator.pop(context);
                    _applyFilters();
                  },
                );
              }).toList(),
            ),
            
            const SizedBox(height: 16),
            
            // Date Range
            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () async {
                      final date = await showDatePicker(
                        context: context,
                        initialDate: _startDate ?? DateTime.now().subtract(const Duration(days: 7)),
                        firstDate: DateTime.now().subtract(const Duration(days: 365)),
                        lastDate: DateTime.now(),
                      );
                      if (date != null) {
                        setState(() => _startDate = date);
                      }
                    },
                    icon: const Icon(Icons.calendar_today, size: 16),
                    label: Text(_startDate != null ? DateFormat('MMM d').format(_startDate!) : 'Start Date'),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Text('to'),
                ),
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () async {
                      final date = await showDatePicker(
                        context: context,
                        initialDate: _endDate ?? DateTime.now(),
                        firstDate: _startDate ?? DateTime.now().subtract(const Duration(days: 365)),
                        lastDate: DateTime.now(),
                      );
                      if (date != null) {
                        setState(() => _endDate = date);
                      }
                    },
                    icon: const Icon(Icons.calendar_today, size: 16),
                    label: Text(_endDate != null ? DateFormat('MMM d').format(_endDate!) : 'End Date'),
                  ),
                ),
              ],
            ),
            
            const SizedBox(height: 20),
            
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: () {
                  Navigator.pop(context);
                  _applyFilters();
                },
                child: const Text('Apply Filters'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _getTypeName(MovementType type) {
    switch (type) {
      case MovementType.sale: return 'Sale';
      case MovementType.purchase: return 'Purchase';
      case MovementType.adjustment: return 'Adjustment';
      case MovementType.transferIn: return 'Transfer In';
      case MovementType.transferOut: return 'Transfer Out';
      case MovementType.waste: return 'Waste';
      case MovementType.countVariance: return 'Count Variance';
      case MovementType.returnStock: return 'Return';
    }
  }
}

class _MovementTimelineTile extends StatelessWidget {
  final StockMovement movement;
  final bool isFirst;
  final bool isLast;

  const _MovementTimelineTile({
    required this.movement,
    required this.isFirst,
    required this.isLast,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.savvy;
    
    final isPositive = movement.quantityChange > 0;
    final typeColor = _getTypeColor(movement.movementType);
    final typeIcon = _getTypeIcon(movement.movementType);

    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Timeline Line
          SizedBox(
            width: 40,
            child: Column(
              children: [
                if (!isFirst)
                  Container(width: 2, height: 8, color: theme.colors.border),
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: typeColor.withValues(alpha: 0.15),
                    shape: BoxShape.circle,
                    border: Border.all(color: typeColor, width: 2),
                  ),
                  child: Icon(typeIcon, color: typeColor, size: 16),
                ),
                if (!isLast)
                  Expanded(
                    child: Container(width: 2, color: theme.colors.border),
                  ),
              ],
            ),
          ),

          // Content
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(left: 8, bottom: 12),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: theme.colors.bgSurface,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: theme.colors.border),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          movement.productName,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: theme.colors.textPrimary,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: isPositive ? Colors.green.withValues(alpha: 0.15) : Colors.red.withValues(alpha: 0.15),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          '${isPositive ? '+' : ''}${movement.quantityChange.toStringAsFixed(0)}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: isPositive ? Colors.green : Colors.red,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(
                          color: typeColor.withValues(alpha: 0.15),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          _getTypeName(movement.movementType),
                          style: TextStyle(fontSize: 10, color: typeColor, fontWeight: FontWeight.w600),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        DateFormat('h:mm a').format(movement.timestamp),
                        style: TextStyle(fontSize: 12, color: theme.colors.textSecondary),
                      ),
                    ],
                  ),
                  if (movement.notes != null && movement.notes!.isNotEmpty) ...[
                    const SizedBox(height: 8),
                    Text(
                      movement.notes!,
                      style: TextStyle(fontSize: 12, color: theme.colors.textSecondary),
                    ),
                  ],
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.person, size: 12, color: theme.colors.textSecondary),
                      const SizedBox(width: 4),
                      Text(
                        movement.performedByName,
                        style: TextStyle(fontSize: 11, color: theme.colors.textSecondary),
                      ),
                      const Spacer(),
                      Text(
                        '${movement.balanceBefore.toStringAsFixed(0)} → ${movement.balanceAfter.toStringAsFixed(0)}',
                        style: TextStyle(fontSize: 11, color: theme.colors.textSecondary),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Color _getTypeColor(MovementType type) {
    switch (type) {
      case MovementType.sale: return Colors.blue;
      case MovementType.purchase: return Colors.green;
      case MovementType.adjustment: return Colors.orange;
      case MovementType.transferIn: return Colors.teal;
      case MovementType.transferOut: return Colors.purple;
      case MovementType.waste: return Colors.red;
      case MovementType.countVariance: return Colors.amber;
      case MovementType.returnStock: return Colors.indigo;
    }
  }

  IconData _getTypeIcon(MovementType type) {
    switch (type) {
      case MovementType.sale: return Icons.shopping_cart;
      case MovementType.purchase: return Icons.add_shopping_cart;
      case MovementType.adjustment: return Icons.tune;
      case MovementType.transferIn: return Icons.call_received;
      case MovementType.transferOut: return Icons.call_made;
      case MovementType.waste: return Icons.delete;
      case MovementType.countVariance: return Icons.calculate;
      case MovementType.returnStock: return Icons.keyboard_return;
    }
  }

  String _getTypeName(MovementType type) {
    switch (type) {
      case MovementType.sale: return 'Sale';
      case MovementType.purchase: return 'Purchase';
      case MovementType.adjustment: return 'Adjustment';
      case MovementType.transferIn: return 'Transfer In';
      case MovementType.transferOut: return 'Transfer Out';
      case MovementType.waste: return 'Waste';
      case MovementType.countVariance: return 'Count Variance';
      case MovementType.returnStock: return 'Return';
    }
  }
}
