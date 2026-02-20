import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:savvy_pos/features/customers/domain/entities/customer_profile.dart';
import 'package:savvy_pos/features/customers/domain/repositories/i_customer_crm_repository.dart';

class CustomerCrmPage extends StatefulWidget {
  const CustomerCrmPage({super.key});

  @override
  State<CustomerCrmPage> createState() => _CustomerCrmPageState();
}

class _CustomerCrmPageState extends State<CustomerCrmPage> {
  final _repo = GetIt.I<ICustomerCrmRepository>();
  final _searchController = TextEditingController();
  
  List<CustomerProfile> _customers = [];
  CustomerInsights? _insights;
  CustomerSegment? _selectedSegment;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Future<void> _loadData() async {
    setState(() => _isLoading = true);
    try {
      final customers = await _repo.getAllCustomers(segment: _selectedSegment, searchQuery: _searchController.text);
      final insights = await _repo.getInsights();
      
      if (mounted) {
        setState(() {
          _customers = customers;
          _insights = insights;
          _isLoading = false;
        });
      }
    } catch (e) {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  Color _segmentColor(CustomerSegment segment) {
    switch (segment) {
      case CustomerSegment.newGuest: return Colors.blue;
      case CustomerSegment.returning: return Colors.green;
      case CustomerSegment.regular: return Colors.orange;
      case CustomerSegment.vip: return Colors.purple;
      case CustomerSegment.lapsed: return Colors.red;
    }
  }

  String _segmentLabel(CustomerSegment? segment) {
    if (segment == null) return 'All';
    switch (segment) {
      case CustomerSegment.newGuest: return 'New';
      case CustomerSegment.returning: return 'Returning';
      case CustomerSegment.regular: return 'Regular';
      case CustomerSegment.vip: return 'VIP';
      case CustomerSegment.lapsed: return 'Lapsed';
    }
  }

  @override
  Widget build(BuildContext context) {
    final currFmt = NumberFormat.currency(symbol: '\$', decimalDigits: 2);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Guest Management'),
        actions: [
          IconButton(onPressed: _loadData, icon: const Icon(Icons.refresh)),
        ],
      ),
      body: Column(
        children: [
          // Insights Bar
          if (_insights != null)
            Container(
              padding: const EdgeInsets.all(16),
              color: Theme.of(context).colorScheme.surfaceContainerLowest,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _InsightChip(label: 'New', value: _insights!.totalNewGuests.toString(), color: Colors.blue),
                  _InsightChip(label: 'Returning', value: _insights!.totalReturning.toString(), color: Colors.green),
                  _InsightChip(label: 'Lapsed', value: _insights!.totalLapsed.toString(), color: Colors.red),
                  _InsightChip(label: 'Avg Spend', value: currFmt.format(_insights!.averageSpendAll), color: Colors.purple),
                ],
              ),
            ).animate().fadeIn(),
          
          // Search & Filter Bar
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      hintText: 'Search by name or phone...',
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                      isDense: true,
                    ),
                    onSubmitted: (_) => _loadData(),
                  ),
                ),
                const Gap(12),
                PopupMenuButton<CustomerSegment?>(
                  icon: const Icon(Icons.filter_list),
                  onSelected: (v) {
                    setState(() => _selectedSegment = v);
                    _loadData();
                  },
                  itemBuilder: (_) => [
                    const PopupMenuItem(value: null, child: Text('All')),
                    ...CustomerSegment.values.map((s) => PopupMenuItem(value: s, child: Text(_segmentLabel(s)))),
                  ],
                ),
              ],
            ),
          ),
          
          // Segment Chips
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                ChoiceChip(label: const Text('All'), selected: _selectedSegment == null, onSelected: (_) { setState(() => _selectedSegment = null); _loadData(); }),
                const Gap(8),
                ...CustomerSegment.values.map((s) => Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: ChoiceChip(
                    label: Text(_segmentLabel(s)),
                    selected: _selectedSegment == s,
                    selectedColor: _segmentColor(s).withValues(alpha: 0.3),
                    onSelected: (_) { setState(() => _selectedSegment = s); _loadData(); },
                  ),
                )),
              ],
            ),
          ),
          const Gap(12),
          
          // Customer List
          Expanded(
            child: _isLoading
                ? const Center(child: CircularProgressIndicator())
                : _customers.isEmpty
                    ? const Center(child: Text('No customers found', style: TextStyle(color: Colors.grey)))
                    : ListView.builder(
                        padding: const EdgeInsets.all(16),
                        itemCount: _customers.length,
                        itemBuilder: (context, index) {
                          final c = _customers[index];
                          return Card(
                            child: ListTile(
                              leading: CircleAvatar(
                                backgroundColor: _segmentColor(c.segment).withValues(alpha: 0.2),
                                child: Text(c.name.isNotEmpty ? c.name[0].toUpperCase() : '?', style: TextStyle(color: _segmentColor(c.segment))),
                              ),
                              title: Row(
                                children: [
                                  Text(c.name),
                                  if (c.isVip) ...[
                                    const Gap(8),
                                    Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                                      decoration: BoxDecoration(color: Colors.purple, borderRadius: BorderRadius.circular(4)),
                                      child: const Text('VIP', style: TextStyle(color: Colors.white, fontSize: 10)),
                                    ),
                                  ],
                                ],
                              ),
                              subtitle: Text('${c.visitCount} visits • ${currFmt.format(c.totalSpent)} total'),
                              trailing: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Chip(label: Text(_segmentLabel(c.segment), style: const TextStyle(fontSize: 10)), backgroundColor: _segmentColor(c.segment).withValues(alpha: 0.2)),
                                ],
                              ),
                              onTap: () => _openCustomerDetail(c),
                            ),
                          ).animate().fadeIn(delay: (index * 30).ms);
                        },
                      ),
          ),
        ],
      ),
    );
  }

  void _openCustomerDetail(CustomerProfile customer) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (_) => _CustomerDetailSheet(customer: customer, repo: _repo, onRefresh: _loadData),
    );
  }
}

class _InsightChip extends StatelessWidget {
  final String label;
  final String value;
  final Color color;

  const _InsightChip({required this.label, required this.value, required this.color});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(value, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: color)),
        Text(label, style: const TextStyle(color: Colors.grey, fontSize: 12)),
      ],
    );
  }
}

class _CustomerDetailSheet extends StatefulWidget {
  final CustomerProfile customer;
  final ICustomerCrmRepository repo;
  final VoidCallback onRefresh;

  const _CustomerDetailSheet({required this.customer, required this.repo, required this.onRefresh});

  @override
  State<_CustomerDetailSheet> createState() => _CustomerDetailSheetState();
}

class _CustomerDetailSheetState extends State<_CustomerDetailSheet> {
  late CustomerProfile _customer;
  List<OrderHistoryItem> _orders = [];
  final _noteController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _customer = widget.customer;
    _loadHistory();
  }

  @override
  void dispose() {
    _noteController.dispose();
    super.dispose();
  }

  Future<void> _loadHistory() async {
    final orders = await widget.repo.getOrderHistory(_customer.uuid);
    if (mounted) setState(() => _orders = orders);
  }

  Future<void> _addNote() async {
    if (_noteController.text.isEmpty) return;
    await widget.repo.addNote(_customer.uuid, _noteController.text, 'Staff');
    _noteController.clear();
    final updated = await widget.repo.getCustomer(_customer.uuid);
    if (updated != null && mounted) setState(() => _customer = updated);
  }

  @override
  Widget build(BuildContext context) {
    final currFmt = NumberFormat.currency(symbol: '\$', decimalDigits: 2);
    final dateFmt = DateFormat('MMM d, yyyy');

    return Container(
      padding: const EdgeInsets.all(24),
      constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height * 0.85),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Header
          Row(
            children: [
              CircleAvatar(radius: 32, child: Text(_customer.name[0].toUpperCase(), style: const TextStyle(fontSize: 28))),
              const Gap(16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(_customer.name, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    if (_customer.phoneNumber != null) Text(_customer.phoneNumber!, style: const TextStyle(color: Colors.grey)),
                    Wrap(
                      spacing: 4,
                      children: _customer.tags.map((t) => Chip(label: Text(t, style: const TextStyle(fontSize: 10)), padding: EdgeInsets.zero)).toList(),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Gap(20),
          
          // Stats Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _StatTile(label: 'Visits', value: _customer.visitCount.toString()),
              _StatTile(label: 'Total Spent', value: currFmt.format(_customer.totalSpent)),
              _StatTile(label: 'Avg Order', value: currFmt.format(_customer.averageOrderValue)),
            ],
          ),
          const Divider(height: 32),
          
          // Notes Section
          Align(alignment: Alignment.centerLeft, child: Text('Notes (${_customer.notes.length})', style: const TextStyle(fontWeight: FontWeight.bold))),
          const Gap(8),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _noteController,
                  decoration: const InputDecoration(hintText: 'Add a note...', border: OutlineInputBorder(), isDense: true),
                ),
              ),
              const Gap(8),
              IconButton(onPressed: _addNote, icon: const Icon(Icons.send)),
            ],
          ),
          const Gap(8),
          if (_customer.notes.isNotEmpty)
            ...(_customer.notes.take(3).map((n) => ListTile(
              dense: true,
              leading: n.isCritical ? const Icon(Icons.warning, color: Colors.red, size: 18) : const Icon(Icons.note, size: 18),
              title: Text(n.content, style: TextStyle(color: n.isCritical ? Colors.red : null)),
              subtitle: Text('${n.createdBy} • ${dateFmt.format(n.createdAt)}', style: const TextStyle(fontSize: 11)),
            ))),
          
          const Gap(16),
          
          // Order History
          Align(alignment: Alignment.centerLeft, child: Text('Recent Orders (${_orders.length})', style: const TextStyle(fontWeight: FontWeight.bold))),
          const Gap(8),
          if (_orders.isEmpty)
            const Text('No orders yet', style: TextStyle(color: Colors.grey))
          else
            ...(_orders.take(5).map((o) => ListTile(
              dense: true,
              leading: const Icon(Icons.receipt_long, size: 18),
              title: Text(currFmt.format(o.total)),
              subtitle: Text(dateFmt.format(o.orderDate)),
              trailing: Text(o.paymentMethod, style: const TextStyle(fontSize: 11)),
            ))),
          
          const Gap(16),
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Close')),
        ],
      ),
    );
  }
}

class _StatTile extends StatelessWidget {
  final String label;
  final String value;

  const _StatTile({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(value, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        Text(label, style: const TextStyle(color: Colors.grey, fontSize: 12)),
      ],
    );
  }
}
