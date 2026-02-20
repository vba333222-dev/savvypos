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

class StockTransfersPage extends StatelessWidget {
  const StockTransfersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => GetIt.I<AdvancedInventoryBloc>()
        ..add(const AdvancedInventoryEvent.loadWarehouses())
        ..add(const AdvancedInventoryEvent.loadTransfers()),
      child: const _TransfersContent(),
    );
  }
}

class _TransfersContent extends StatefulWidget {
  const _TransfersContent();

  @override
  State<_TransfersContent> createState() => _TransfersContentState();
}

class _TransfersContentState extends State<_TransfersContent> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
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
            Icon(Icons.swap_horiz, color: theme.colors.brandPrimary),
            const SizedBox(width: 8),
            const Text('Stock Transfers'),
          ],
        ),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Pending'),
            Tab(text: 'In Transit'),
            Tab(text: 'Completed'),
          ],
          indicatorColor: theme.colors.brandPrimary,
          labelColor: theme.colors.brandPrimary,
          unselectedLabelColor: theme.colors.textSecondary,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              HapticFeedback.mediumImpact();
              context.read<AdvancedInventoryBloc>().add(const AdvancedInventoryEvent.loadTransfers());
            },
          ),
        ],
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _TransfersList(statuses: const [TransferStatus.draft, TransferStatus.pendingApproval, TransferStatus.approved]),
          _TransfersList(statuses: const [TransferStatus.inTransit, TransferStatus.partiallyReceived]),
          _TransfersList(statuses: const [TransferStatus.completed, TransferStatus.cancelled]),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _showCreateTransferSheet(context),
        icon: const Icon(Icons.add),
        label: const Text('New Transfer'),
        backgroundColor: theme.colors.brandPrimary,
      ),
    );
  }

  void _showCreateTransferSheet(BuildContext context) {
    final theme = context.savvy;
    
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: theme.colors.bgSurface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.9,
        minChildSize: 0.5,
        maxChildSize: 0.95,
        expand: false,
        builder: (context, scrollController) => _CreateTransferSheet(scrollController: scrollController),
      ),
    );
  }
}

class _TransfersList extends StatelessWidget {
  final List<TransferStatus> statuses;

  const _TransfersList({required this.statuses});

  @override
  Widget build(BuildContext context) {
    final theme = context.savvy;

    return BlocBuilder<AdvancedInventoryBloc, AdvancedInventoryState>(
      builder: (context, state) {
        if (state.isLoadingTransfers) {
          return const Center(child: CircularProgressIndicator());
        }

        final filtered = state.transfers.where((t) => statuses.contains(t.status)).toList();

        if (filtered.isEmpty) {
          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.swap_horiz, size: 64, color: theme.colors.textSecondary),
                const SizedBox(height: 16),
                Text('No transfers', style: TextStyle(color: theme.colors.textSecondary)),
              ],
            ),
          );
        }

        return ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: filtered.length,
          itemBuilder: (context, index) {
            return _TransferCard(transfer: filtered[index])
                .animate()
                .fadeIn(duration: 200.ms, delay: (index * 50).ms)
                .slideX(begin: 0.05, end: 0);
          },
        );
      },
    );
  }
}

class _TransferCard extends StatelessWidget {
  final AdvancedStockTransfer transfer;

  const _TransferCard({required this.transfer});

  @override
  Widget build(BuildContext context) {
    final theme = context.savvy;
    
    final statusColor = _getStatusColor(transfer.status);
    final statusIcon = _getStatusIcon(transfer.status);

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: theme.colors.bgSurface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: theme.colors.border),
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () => _showTransferDetail(context),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: statusColor.withValues(alpha: 0.15),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(statusIcon, color: statusColor, size: 24),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            transfer.transferNumber,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: theme.colors.textPrimary,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                            decoration: BoxDecoration(
                              color: statusColor.withValues(alpha: 0.15),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              _getStatusLabel(transfer.status),
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w600,
                                color: statusColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          '\$${transfer.totalValue.toStringAsFixed(2)}',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: theme.colors.textPrimary,
                          ),
                        ),
                        Text(
                          '${transfer.totalItems} items',
                          style: TextStyle(fontSize: 12, color: theme.colors.textSecondary),
                        ),
                      ],
                    ),
                  ],
                ),

                const SizedBox(height: 16),

                // From -> To
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: theme.colors.bgCanvas,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Icon(Icons.outbox, color: Colors.orange, size: 20),
                            const SizedBox(height: 4),
                            Text(
                              'From',
                              style: TextStyle(fontSize: 10, color: theme.colors.textSecondary),
                            ),
                            Text(
                              transfer.sourceWarehouseName,
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                color: theme.colors.textPrimary,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                      Icon(Icons.arrow_forward, color: theme.colors.textSecondary),
                      Expanded(
                        child: Column(
                          children: [
                            Icon(Icons.inbox, color: Colors.green, size: 20),
                            const SizedBox(height: 4),
                            Text(
                              'To',
                              style: TextStyle(fontSize: 10, color: theme.colors.textSecondary),
                            ),
                            Text(
                              transfer.targetWarehouseName,
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                color: theme.colors.textPrimary,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                // Footer
                const SizedBox(height: 12),
                Row(
                  children: [
                    Icon(Icons.person, size: 14, color: theme.colors.textSecondary),
                    const SizedBox(width: 4),
                    Text(
                      transfer.createdByName,
                      style: TextStyle(fontSize: 12, color: theme.colors.textSecondary),
                    ),
                    const Spacer(),
                    if (transfer.createdAt != null)
                      Text(
                        DateFormat('MMM d, h:mm a').format(transfer.createdAt!),
                        style: TextStyle(fontSize: 12, color: theme.colors.textSecondary),
                      ),
                  ],
                ),

                // Actions
                if (_canTakeAction(transfer.status)) ...[
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      if (transfer.status == TransferStatus.pendingApproval)
                        Expanded(
                          child: FilledButton(
                            onPressed: () {
                              HapticFeedback.mediumImpact();
                              context.read<AdvancedInventoryBloc>().add(
                                AdvancedInventoryEvent.approveTransfer(transfer.uuid),
                              );
                            },
                            child: const Text('Approve'),
                          ),
                        ),
                      if (transfer.status == TransferStatus.inTransit) ...[
                        Expanded(
                          child: FilledButton(
                            onPressed: () {
                              HapticFeedback.mediumImpact();
                              context.read<AdvancedInventoryBloc>().add(
                                AdvancedInventoryEvent.receiveTransfer(transfer.uuid, transfer.items),
                              );
                            },
                            child: const Text('Receive'),
                          ),
                        ),
                      ],
                    ],
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool _canTakeAction(TransferStatus status) {
    return status == TransferStatus.pendingApproval || status == TransferStatus.inTransit;
  }

  Color _getStatusColor(TransferStatus status) {
    switch (status) {
      case TransferStatus.draft: return Colors.grey;
      case TransferStatus.pendingApproval: return Colors.orange;
      case TransferStatus.approved: return Colors.blue;
      case TransferStatus.inTransit: return Colors.purple;
      case TransferStatus.partiallyReceived: return Colors.teal;
      case TransferStatus.completed: return Colors.green;
      case TransferStatus.cancelled: return Colors.red;
    }
  }

  IconData _getStatusIcon(TransferStatus status) {
    switch (status) {
      case TransferStatus.draft: return Icons.edit;
      case TransferStatus.pendingApproval: return Icons.pending;
      case TransferStatus.approved: return Icons.check_circle;
      case TransferStatus.inTransit: return Icons.local_shipping;
      case TransferStatus.partiallyReceived: return Icons.call_split;
      case TransferStatus.completed: return Icons.done_all;
      case TransferStatus.cancelled: return Icons.cancel;
    }
  }

  String _getStatusLabel(TransferStatus status) {
    switch (status) {
      case TransferStatus.draft: return 'Draft';
      case TransferStatus.pendingApproval: return 'Pending Approval';
      case TransferStatus.approved: return 'Approved';
      case TransferStatus.inTransit: return 'In Transit';
      case TransferStatus.partiallyReceived: return 'Partially Received';
      case TransferStatus.completed: return 'Completed';
      case TransferStatus.cancelled: return 'Cancelled';
    }
  }

  void _showTransferDetail(BuildContext context) {
    HapticFeedback.lightImpact();
    // Show transfer detail modal
  }
}

class _CreateTransferSheet extends StatefulWidget {
  final ScrollController scrollController;

  const _CreateTransferSheet({required this.scrollController});

  @override
  State<_CreateTransferSheet> createState() => _CreateTransferSheetState();
}

class _CreateTransferSheetState extends State<_CreateTransferSheet> {
  String? _sourceWarehouse;
  String? _targetWarehouse;
  final _notesController = TextEditingController();

  @override
  void dispose() {
    _notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.savvy;

    return BlocBuilder<AdvancedInventoryBloc, AdvancedInventoryState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(24),
          child: ListView(
            controller: widget.scrollController,
            children: [
              // Handle
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: theme.colors.textSecondary,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Title
              const SavvyText.h3('Create Stock Transfer'),
              const SizedBox(height: 24),

              // Source Warehouse
              const SavvyText.label('FROM WAREHOUSE'),
              const SizedBox(height: 8),
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Select source warehouse',
                ),
                items: state.warehouses.map((w) => DropdownMenuItem(
                  value: w.uuid,
                  child: Text(w.name),
                )).toList(),
                onChanged: (value) => setState(() => _sourceWarehouse = value),
              ),
              const SizedBox(height: 16),

              // Target Warehouse
              const SavvyText.label('TO WAREHOUSE'),
              const SizedBox(height: 8),
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Select destination warehouse',
                ),
                items: state.warehouses
                    .where((w) => w.uuid != _sourceWarehouse)
                    .map((w) => DropdownMenuItem(
                  value: w.uuid,
                  child: Text(w.name),
                )).toList(),
                onChanged: (value) => setState(() => _targetWarehouse = value),
              ),
              const SizedBox(height: 16),

              // Notes
              const SavvyText.label('NOTES (OPTIONAL)'),
              const SizedBox(height: 8),
              TextField(
                controller: _notesController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Add notes about this transfer',
                ),
                maxLines: 3,
              ),
              const SizedBox(height: 24),

              // Items section placeholder
              Container(
                padding: const EdgeInsets.all(40),
                decoration: BoxDecoration(
                  color: theme.colors.bgCanvas,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: theme.colors.border, style: BorderStyle.solid),
                ),
                child: Column(
                  children: [
                    Icon(Icons.add_shopping_cart, size: 48, color: theme.colors.textSecondary),
                    const SizedBox(height: 12),
                    Text(
                      'Add Items to Transfer',
                      style: TextStyle(color: theme.colors.textSecondary),
                    ),
                    const SizedBox(height: 12),
                    OutlinedButton.icon(
                      onPressed: () {
                        HapticFeedback.mediumImpact();
                        // Add items
                      },
                      icon: const Icon(Icons.add),
                      label: const Text('Add Products'),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // Create Button
              SizedBox(
                width: double.infinity,
                height: 56,
                child: FilledButton(
                  onPressed: _sourceWarehouse != null && _targetWarehouse != null
                      ? () {
                          HapticFeedback.mediumImpact();
                          // Create transfer
                          Navigator.pop(context);
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Transfer created')),
                          );
                        }
                      : null,
                  child: const Text('Create Transfer', style: TextStyle(fontSize: 16)),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
