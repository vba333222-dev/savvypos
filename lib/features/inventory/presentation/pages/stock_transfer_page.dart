import 'package:flutter/material.dart';
import 'package:savvy_pos/core/config/theme/savvy_theme.dart';
import 'package:savvy_pos/core/presentation/widgets/savvy_box.dart';
import 'package:savvy_pos/core/presentation/widgets/savvy_text.dart';
import 'package:savvy_pos/core/presentation/widgets/savvy_widgets.dart'; // SavvyButton
// import 'package:flutter_animate/flutter_animate.dart'; // Assuming flutter_animate is added

class StockTransferPage extends StatefulWidget {
  const StockTransferPage({super.key});

  @override
  State<StockTransferPage> createState() => _StockTransferPageState();
}

class _StockTransferPageState extends State<StockTransferPage> with SingleTickerProviderStateMixin {
  String sourceWarehouse = 'Main Warehouse';
  String destWarehouse = 'Outlet Downtown';
  double transferQty = 0;
  bool isTransferring = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.savvy.colors.bgCanvas,
      appBar: AppBar(
        title: SavvyText.h3('Transfer Stock'),
        backgroundColor: context.savvy.colors.bgSurface,
        elevation: 0,
        iconTheme: IconThemeData(color: context.savvy.colors.textPrimary),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                // SOURCE
                Expanded(
                  child: Container(
                    color: context.savvy.colors.bgSurface,
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SavvyText.label('SOURCE'),
                        const SizedBox(height: 8),
                        SavvyText.h3(sourceWarehouse),
                        const SizedBox(height: 32),
                        Icon(Icons.warehouse, size: 64, color: context.savvy.colors.textDisabled),
                        const SizedBox(height: 16),
                        SavvyText.body('Current Stock: 150'),
                      ],
                    ),
                  ),
                ),
                
                // ACTION AREA
                SizedBox(
                  width: 120,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Animated Arrow (Simplified for code gen)
                      Icon(Icons.arrow_forward, size: 32, color: context.savvy.colors.primary), 
                      const SizedBox(height: 16),
                      SavvyText.h3(transferQty.toStringAsFixed(0)),
                      const SizedBox(height: 16),
                      // Stepper
                      IconButton(
                        onPressed: () => setState(() => transferQty += 10), 
                        icon: const Icon(Icons.add_circle_outline)
                      ),
                      IconButton(
                        onPressed: () => setState(() => transferQty = (transferQty - 10).clamp(0, 1000)), 
                        icon: const Icon(Icons.remove_circle_outline)
                      ),
                    ],
                  ),
                ),

                // DESTINATION
                Expanded(
                  child: Container(
                    color: context.savvy.colors.bgSurface,
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SavvyText.label('DESTINATION'),
                        const SizedBox(height: 8),
                        SavvyText.h3(destWarehouse),
                        const SizedBox(height: 32),
                        Icon(Icons.storefront, size: 64, color: context.savvy.colors.textDisabled),
                        const SizedBox(height: 16),
                        SavvyText.body('Current Stock: 20'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          
          // Footer
          SavvyBox(
            color: context.savvy.colors.bgSurface,
            padding: const EdgeInsets.all(24),
            border: Border(top: BorderSide(color: context.savvy.colors.border)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SavvyButton(
                  text: 'CANCEL',
                  style: SavvyButtonStyle.ghost,
                  onPressed: () => Navigator.pop(context),
                ),
                const SizedBox(width: 16),
                SavvyButton(
                  text: 'CONFIRM TRANSFER',
                  style: SavvyButtonStyle.primary,
                  onPressed: transferQty > 0 ? () {
                    // Trigger Logic
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Transfer Initiated'))
                    );
                  } : null,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
