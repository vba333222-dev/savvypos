import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:savvy_pos/core/config/theme/savvy_theme.dart';
import 'package:savvy_pos/features/pos/presentation/bloc/cart/cart_bloc.dart';
import 'package:savvy_pos/features/pos/presentation/bloc/cart/cart_event.dart';
import 'package:savvy_pos/features/pos/presentation/bloc/cart/cart_state.dart';
import 'package:savvy_pos/features/pos/presentation/widgets/split_bill/draggable_bill_item.dart';
import 'package:savvy_pos/features/pos/presentation/widgets/split_bill/split_target_zone.dart';

class SplitBillPage extends StatefulWidget {
  const SplitBillPage({super.key});

  @override
  State<SplitBillPage> createState() => _SplitBillPageState();
}

class _SplitBillPageState extends State<SplitBillPage> {
  // Master List (Unassigned Items)
  late List<CartItem> _masterItems;
  
  // Split Groups (Lists of assigned Items)
  final List<List<CartItem>> _splitGroups = [[]]; // Start with 1 empty bill

  bool _initialized = false;

  @override
  void initState() {
    super.initState();
    // Initialize Master from Cart Bloc on first load
    // We do this in build or didChangeDependencies usually if we want live updates,
    // but for Split logic, we often take a snapshot. 
    // Here we'll listen to Bloc but store local "distribution" state.
    WidgetsBinding.instance.addPostFrameCallback((_) {
       if (context.read<CartBloc>().state.items.isNotEmpty) {
         setState(() {
           _masterItems = List.from(context.read<CartBloc>().state.items);
           _initialized = true;
         });
       }
    });
  }

  void _createBudgetSplit() {
    // "Smart Equi-Split" Visual: Shuffle items round-robin
    if (!_initialized) return;
    
    // Reset
    final allItems = [..._masterItems, ..._splitGroups.expand((e) => e)];
    
    // Create 3 groups for fun/demo (or ask user?)
    final newGroups = <List<CartItem>>[[], [], []];
    
    // Distribute
    for (int i = 0; i < allItems.length; i++) {
       newGroups[i % 3].add(allItems[i]);
    }

    setState(() {
      _masterItems = [];
      _splitGroups.clear();
      _splitGroups.addAll(newGroups);
    });
    
    HapticFeedback.mediumImpact();
  }
  
  void _addNewBill() {
    setState(() {
      _splitGroups.add([]);
    });
    HapticFeedback.selectionClick();
  }

  // LOGIC: Move Item
  void _onItemDrop(CartItem item, int targetGroupIndex) {
    setState(() {
      // Remove from Master if there
      _masterItems.remove(item);
      
      // Remove from other groups if there
      for (var group in _splitGroups) {
        group.remove(item);
      }
      
      // Add to Target
      if (targetGroupIndex == -1) {
         // -1 means return to Master
         _masterItems.add(item);
      } else {
         _splitGroups[targetGroupIndex].add(item);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.savvy;
    
    if (!_initialized) {
      return Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return Scaffold(
      backgroundColor: theme.colors.bgSecondary, // Darker "Workbench" feel
      appBar: AppBar(
        title: const Text('Split Bill Workbench'),
        backgroundColor: theme.colors.bgElevated,
        actions: [
          IconButton(
            icon: Icon(Icons.call_split),
            tooltip: 'Smart Split (3 Ways)',
            onPressed: _createBudgetSplit,
          ),
          IconButton(
            icon: Icon(Icons.add),
            tooltip: 'Add Bill',
            onPressed: _addNewBill,
          ),
        ],
      ),
      body: Row(
        children: [
          // LEFT PANEL: Master Bill (Source)
          Expanded(
            flex: 4,
            child: Container(
              color: theme.colors.bgPrimary,
              child: DragTarget<CartItem>(
                onWillAcceptWithDetails: (details) => !_masterItems.contains(details.data),
                onAcceptWithDetails: (details) => _onItemDrop(details.data, -1), // -1 = Master
                builder: (context, candidates, rejected) {
                  return Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(16),
                        color: candidates.isNotEmpty ? theme.colors.brandPrimary.withValues(alpha: 0.1) : null,
                        child: Row(
                          children: [
                            Icon(Icons.receipt_long, color: theme.colors.textSecondary),
                            SizedBox(width: 8),
                            Text('Master Bill (${_masterItems.length} items)', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                          ],
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          padding: EdgeInsets.all(8),
                          itemCount: _masterItems.length,
                          itemBuilder: (context, index) {
                            final item = _masterItems[index];
                            return DraggableBillItem(item: item)
                                .animate().fadeIn(duration: 300.ms).slideX(begin: -0.1, end: 0); 
                          },
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
          
          // DIVIDER
          Container(width: 1, color: theme.colors.borderDefault),

          // RIGHT PANEL: Split Groups (Targets)
          Expanded(
            flex: 6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 Padding(
                   padding: const EdgeInsets.all(16),
                   child: Text('Split Groups', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                 ),
                 Expanded(
                   child: ListView.separated(
                     padding: EdgeInsets.symmetric(horizontal: 16),
                     scrollDirection: Axis.horizontal,
                     itemCount: _splitGroups.length,
                     separatorBuilder: (_,__) => SizedBox(width: 8),
                     itemBuilder: (context, index) {
                       return SplitTargetZone(
                         index: index,
                         items: _splitGroups[index],
                         onRemove: (item) => _onItemDrop(item, -1), // Return to master logic inside widget? Handled by drag out actually.
                         onAccept: (item) => _onItemDrop(item, index),
                         onPay: () {
                           // Trigger Payment Logic for this Sub-Bill
                           final items = _splitGroups[index];
                           context.read<CartBloc>().add(CartEvent.checkoutSplit(items.map((e) => e.uuid).toList(), 'CASH')); // Mock Payment
                           Navigator.pop(context);
                         },
                       );
                     },
                   ),
                 ),
                 SizedBox(height: 32),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
