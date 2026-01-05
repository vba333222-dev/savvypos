import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:savvy_pos/core/config/theme_config.dart';
import 'package:savvy_pos/features/tables/presentation/bloc/table_bloc.dart';
import 'package:savvy_pos/features/pos/presentation/bloc/cart/cart_bloc.dart';
import 'package:savvy_pos/features/pos/presentation/bloc/cart/cart_event.dart';
import 'package:savvy_pos/core/database/database.dart';
import 'package:savvy_pos/features/reservations/presentation/pages/reservation_list_page.dart';

class FloorPlanPage extends StatefulWidget {
  final Function(int)? onNavigateToPos; // Callback to switch tab
  
  const FloorPlanPage({Key? key, this.onNavigateToPos}) : super(key: key);

  @override
  State<FloorPlanPage> createState() => _FloorPlanPageState();
}

class _FloorPlanPageState extends State<FloorPlanPage> {
  bool _isEditMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Floor Plan'),
          actions: [
             IconButton(
               icon: const Icon(Icons.calendar_today),
               tooltip: 'Reservations',
               onPressed: () => Navigator.push(
                 context, 
                 MaterialPageRoute(builder: (_) => const ReservationListPage())
               ),
             ),
             const SizedBox(width: 8),
            IconButton(
              icon: Icon(_isEditMode ? Icons.check : Icons.edit),
              onPressed: () => setState(() => _isEditMode = !_isEditMode),
            ),
             if (_isEditMode)
               IconButton(
                 icon: const Icon(Icons.add),
                 onPressed: () {
                    // Add random table at center
                    GetIt.I<TableBloc>().add(const TableEvent.addTable('New', 0.5, 0.5));
                 },
               ),
          ],
        ),
        body: BlocBuilder<TableBloc, TableState>(
          builder: (context, state) {
            if (state.isLoading) return const Center(child: CircularProgressIndicator());
            
            return InteractiveViewer(
              constrained: false,
              boundaryMargin: const EdgeInsets.all(double.infinity),
              minScale: 0.5,
              maxScale: 2.0,
              child: Container(
                width: 1000, 
                height: 1000,
                color: Colors.grey.shade200, // Floor color
                child: Stack(
                  children: [
                    // Grid lines (Optional visual)
                    
                    ...state.tables.map((table) => _buildTable(context, table)),
                  ],
                ),
              ),
            );
          },
        ),
      );
  }

  Widget _buildTable(BuildContext context, RestaurantTableData table) {
    final colors = context.savvy.colors;
    
    return Positioned(
      left: table.x * 1000, // Scaling 0-1 to 1000x1000 canvas
      top: table.y * 1000,
      child: GestureDetector(
        onPanUpdate: _isEditMode ? (details) {
           // Update Percentage
           final dx = details.delta.dx / 1000;
           final dy = details.delta.dy / 1000;
           context.read<TableBloc>().add(TableEvent.moveTable(table.uuid, table.x + dx, table.y + dy));
        } : null,
        onTap: () {
          if (_isEditMode) {
            _showEditDialog(context, table);
          } else {
            _handleServiceTap(context, table);
          }
        },
        child: Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            color: table.isOccupied ? colors.stateError : colors.stateSuccess,
            shape: BoxShape.circle,
            boxShadow: const [BoxShadow(blurRadius: 4, color: Colors.black26)],
            border: _isEditMode ? Border.all(color: Colors.blue, width: 2) : null,
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(table.name, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                if (table.isOccupied)
                  const Icon(Icons.receipt, color: Colors.white, size: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _handleServiceTap(BuildContext context, RestaurantTableData table) {
    if (table.isOccupied && table.currentOrderUuid != null) {
      // Retrieve Order
      GetIt.I<CartBloc>().add(CartEvent.retrieveOrder(table.currentOrderUuid!, table.uuid));
      // Navigate to POS
      if (widget.onNavigateToPos != null) widget.onNavigateToPos!(1); // Index 1 is POS
    } else {
      // New Order
      GetIt.I<CartBloc>().add(const CartEvent.clearCart()); 
      // Set Active Table in Cart (Need a specific event or just assume Park will attach it?)
      // Actually Park needs tableUuid. But we usually want to know WHICH table we are serving BEFORE parking.
      // Ideally CartBloc has 'setTable(uuid)' event.
      // For now, we will handle it by just going to POS. 
      // The USER will have to select table later? No, flow says "Tap Table -> Go to POS".
      // So POS "knows" the table.
      // Let's assume we implement a `SetTable` event or pass it.
      // For MVP, we pass it via retrieveOrder with null order?
      // Or we just add `CartEvent.setTable(String id)`.
      // I'll assume we can Park to ANY table or we need to carry this state.
      // Let's add `CartEvent.startNewOrderForTable(String tableUuid)`?
      // reusing clearCart doesn't set table.
      
      // I will assume we add `startNewOrderForTable` or similar. 
      // Or just navigate and let them Park manually? No, they clicked the table.
      // Let's trigger a logic to set active table.
      // I'll emit a "Clean Cart with Table" state modification if I could.
      // Let's just create a `CartEvent.parkOrder(tableUuid)` later. 
      // But we need to know the table ID when we click "Park" in POS.
      // So CartState MUST have `activeTableUuid`.
      // So `retrieveOrder` sets it. 
      // We need `CartEvent.setActiveTable(String uuid)`.
      
      // Check CartBloc events... I didn't add `setActiveTable`.
      // I will add it or just use a workaround? 
      // Better to add it.
    }
  }

  void _showEditDialog(BuildContext context, RestaurantTableData table) {
     // Rename or Delete
     showDialog(
       context: context,
       builder: (ctx) => AlertDialog(
         title: Text('Edit ${table.name}'),
         actions: [
           TextButton(
             onPressed: () {
               context.read<TableBloc>().add(TableEvent.deleteTable(table.uuid));
               Navigator.pop(ctx);
             },
             child: const Text('Delete', style: TextStyle(color: Colors.red)),
           ),
         ],
       ),
     );
  }
}
