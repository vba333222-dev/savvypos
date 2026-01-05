import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:savvy_pos/core/config/theme_config.dart';
import 'package:savvy_pos/features/pos/presentation/bloc/cart/cart_bloc.dart';
import 'package:savvy_pos/features/pos/presentation/bloc/cart/cart_state.dart';

class SplitBillPage extends StatefulWidget {
  const SplitBillPage({Key? key}) : super(key: key);

  @override
  State<SplitBillPage> createState() => _SplitBillPageState();
}

class _SplitBillPageState extends State<SplitBillPage> {
  // Track selected items to pay
  final Set<int> _selectedIndices = {}; // Simple index tracking for prototype
  double _splitAmount = 0.0;
  
  @override
  Widget build(BuildContext context) {
    final colors = context.savvy.colors;
    
    return Scaffold(
      appBar: AppBar(title: const Text('Split Bill')),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
           if (state.items.isEmpty) return const Center(child: Text('No items to split'));

           return Column(
             children: [
               Expanded(
                 child: ListView.builder(
                   itemCount: state.items.length,
                   itemBuilder: (context, index) {
                     final item = state.items[index];
                     final isSelected = _selectedIndices.contains(index);
                     
                     return ListTile(
                       leading: Checkbox(
                         value: isSelected,
                         onChanged: (val) {
                           setState(() {
                             if (val == true) {
                               _selectedIndices.add(index);
                             } else {
                               _selectedIndices.remove(index);
                             }
                             _calculateTotal(state);
                           });
                         },
                       ),
                       title: Text(item.product.name),
                       subtitle: Text('Qty: ${item.quantity}'),
                       trailing: Text(Theme.of(context).savvy.formatCurrency(item.total)),
                     );
                   },
                 ),
               ),
               Container(
                 padding: const EdgeInsets.all(16),
                 child: Column(
                   children: [
                     Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         const Text('Selected Total:', style: TextStyle(fontWeight: FontWeight.bold)),
                         Text(Theme.of(context).savvy.formatCurrency(_splitAmount), style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                       ],
                     ),
                     const SizedBox(height: 16),
                     ElevatedButton(
                       style: ElevatedButton.styleFrom(minimumSize: const Size.fromHeight(50)),
                       onPressed: _splitAmount > 0 ? () {
                         // Create list of selected items
                         final selectedItems = <CartItem>[];
                         for (final index in _selectedIndices) {
                           if (index < state.items.length) {
                             selectedItems.add(state.items[index]);
                           }
                         }
                         
                         // Trigger Split Checkout (Assuming CASH for MVP or show Dialog)
                         // For better UX, show PaymentMethodsDialog here passing the partial amount?
                         // But PaymentMethodsDialog assumes full cart total usually.
                         // Let's just fire 'CASH' for MVP to demonstrate logic.
                         context.read<CartBloc>().add(CartEvent.checkoutSplit(selectedItems, 'CASH'));
                         Navigator.pop(context); // Go back
                       } : null,
                       child: const Text('Pay Selected'),
                     ),
                   ],
                 ),
               ),
             ],
           );
        },
      ),
    );
  }

  void _calculateTotal(CartState state) {
    double total = 0;
    for (var i in _selectedIndices) {
      if (i < state.items.length) {
        total += state.items[i].total;
      }
    }
    setState(() => _splitAmount = total);
  }
}
