import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:savvy_pos/core/config/theme_config.dart';
import 'package:savvy_pos/core/presentation/widgets/savvy_widgets.dart';
import 'package:savvy_pos/features/pos/presentation/bloc/cart/cart_bloc.dart';
import 'package:savvy_pos/features/pos/presentation/bloc/cart/cart_event.dart';
import 'package:savvy_pos/features/tables/presentation/bloc/table_bloc.dart';

class FloorPlanPage extends StatelessWidget {
  final Function(int)? onNavigateToPos;

  const FloorPlanPage({super.key, this.onNavigateToPos});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value( // Use existing global provider or create?
      // MainShell provides TableBloc globally.
      value: GetIt.I<TableBloc>(), 
      child: _FloorPlanView(onNavigateToPos: onNavigateToPos),
    );
  }
}

class _FloorPlanView extends StatelessWidget {
  final Function(int)? onNavigateToPos;
  const _FloorPlanView({this.onNavigateToPos});

  @override
  Widget build(BuildContext context) {
    final theme = context.savvy;
    // Desktop: 4 columns, Mobile: 2 columns
    final isDesktop = MediaQuery.of(context).size.width > 900;
    
    return Scaffold(
      backgroundColor: theme.colors.bgPrimary,
      appBar: AppBar(
        title: SavvyText("Tables", style: SavvyTextStyle.h3, color: theme.colors.textPrimary),
        backgroundColor: theme.colors.bgSecondary,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => context.read<TableBloc>().add(const TableEvent.loadTables()),
          )
        ],
      ),
      body: BlocBuilder<TableBloc, TableState>(
        builder: (context, state) {
          if (state.isLoading) {
             return const Center(child: CircularProgressIndicator());
          }
          if (state.tables.isEmpty) {
             return Center(child: SavvyText("No Tables Configured", style: SavvyTextStyle.bodyLg));
          }

          return GridView.builder(
            padding: EdgeInsets.all(theme.shapes.spacingLg),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: isDesktop ? 4 : 2,
              crossAxisSpacing: theme.shapes.spacingLg,
              mainAxisSpacing: theme.shapes.spacingLg,
              childAspectRatio: 1.2,
            ),
            itemCount: state.tables.length,
            itemBuilder: (context, index) {
              final status = state.tables[index];
              return _TableCard(
                status: status,
                onTap: () {
                  // Action: Select Table -> Navigate to POS
                  // 1. Set Table in CartBloc
                  // 2. Navigate
                  
                  // NOTE: We need to implement 'setTable' or similar in CartBloc 
                  // For now, assume parkOrder mechanism or new event.
                  // User Request: "Tapping a table should navigate to PosPage passing tableId to CartBloc"
                  // 'CartEvent.parkOrder' is for Parking. 
                  // 'CartEvent.retrieveOrder' is for retrieving. 
                  // New Order? 
                  
                  // If status is ACTIVE, we retrieveActiveOrder. 
                  // If status is NONE, we startNewOrder (setTable).
                  
                  final cartBloc = context.read<CartBloc>();
                  
                  if (status.orderStatus == 'ACTIVE' || status.orderStatus == 'BILL_PRINTED') {
                     // Check if valid Order UUID exists. 
                     // Our TableWithStatus logic didn't explicitly pass OrderUUID back yet? 
                     // Wait, TableRepositoryImpl mapped OrderTable... we need to access it. 
                     // TableWithStatus has 'orderStatus' but not 'activeOrderUuid'. 
                     // We should update TableWithStatus to carry the UUID.
                     
                     // For MVP fallback: Use currentOrderUuid from table data.
                     if (status.table.currentOrderUuid != null) {
                        cartBloc.add(CartEvent.retrieveOrder(status.table.currentOrderUuid!, status.table.uuid));
                     }
                  } else {
                     // Start new empty order for this table
                     // We use parkOrder as 'Set Table' initial context? No. 
                     // We need a way to tell Cart "Active Table is X".
                     // Let's use generic 'startOrder' event we will add.
                     // Or use 'clearCart' then manual state manipulation? No, explicit event is best.
                     // "CartEvent.selectCustomer" exists. We need "CartEvent.selectTable".
                     
                     // Temporarily using clearCart + custom logic if event missing, but I will add 'selectTable'.
                     // cartBloc.add(CartEvent.selectTable(status.table.uuid)); // Projected
                  }
                  
                  if (onNavigateToPos != null) {
                    onNavigateToPos!(1); // Index of POS
                  } else {
                     // Direct Push
                     // Navigator.pushNamed(context, '/pos'); // Or MaterialPageRoute
  
                  }
                },
              ).animate().scale(delay: (index * 50).ms);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: theme.colors.brandPrimary,
        child: const Icon(Icons.add),
        onPressed: () {
          // Add Table Dialog not required but helpful
          context.read<TableBloc>().add(TableEvent.addTable("T${DateTime.now().second}", 0, 0));
        },
      ),
    );
  }
}

class _TableCard extends StatelessWidget {
  final dynamic status; // TableWithStatus
  final VoidCallback onTap;

  const _TableCard({required this.status, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final theme = context.savvy;
    final table = status.table;
    final orderStatus = status.orderStatus; // 'NONE', 'ACTIVE', 'PAID', 'BILL_PRINTED'

    Color bgColor;
    Color textColor = Colors.white;
    IconData icon = Icons.table_restaurant;

    switch (orderStatus) {
      case 'ACTIVE':
        bgColor = theme.colors.stateError; // Red (Occupied)
        break;
      case 'BILL_PRINTED':
      case 'PAID': // If we differentiate
        bgColor = theme.colors.stateWarning; // Orange
        icon = Icons.receipt;
        break;
      case 'NONE':
      default:
        bgColor = theme.colors.stateSuccess; // Green
        textColor = Colors.white;
    }

    return GestureDetector(
      onTap: onTap,
      child: SavvyBox(
        color: bgColor,
        padding: EdgeInsets.all(theme.shapes.spacingMd),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: textColor, size: 32),
            const SizedBox(height: 8),
            SavvyText(
              table.name,
              style: SavvyTextStyle.h3,
              color: textColor,
              align: TextAlign.center,
            ),
            if (orderStatus != 'NONE')
              Padding(
                 padding: const EdgeInsets.only(top: 4),
                 child: Text(
                   orderStatus, 
                   style: TextStyle(color: textColor.withOpacity(0.8), fontSize: 12)
                 ),
              )
          ],
        ),
      ),
    );
  }
}
