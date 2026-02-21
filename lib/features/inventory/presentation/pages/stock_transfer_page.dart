import 'package:action_slider/action_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:savvy_pos/core/config/theme/savvy_theme.dart';
import 'package:savvy_pos/core/presentation/widgets/savvy_widgets.dart';
import 'package:savvy_pos/features/inventory/domain/entities/inventory_entities.dart';
import 'package:savvy_pos/features/inventory/presentation/bloc/inventory_management_bloc.dart';

class StockTransferPage extends StatefulWidget {
  const StockTransferPage({super.key});

  @override
  State<StockTransferPage> createState() => _StockTransferPageState();
}

class _StockTransferPageState extends State<StockTransferPage> {
  // Mock Data for Prototype
  String sourceWarehouseId = 'wh-001';
  String sourceWarehouseName = 'Main Warehouse';
  
  String destWarehouseId = 'wh-002';
  String destWarehouseName = 'Outlet Downtown';
  
  double transferQty = 0;
  // In real app, we would select a product. For now, hardcode a product UUID from seed
  final String mockProductUuid = 'prod-001'; 

  final _controller = ActionSliderController();
  final TextEditingController _barcodeController = TextEditingController();
  bool _showPacket = false; // Trigger for packet animation

  final List<DropdownMenuItem<String>> warehouseOptions = [
    const DropdownMenuItem(value: 'wh-001', child: Text('Main Warehouse')),
    const DropdownMenuItem(value: 'wh-002', child: Text('Outlet Downtown')),
    const DropdownMenuItem(value: 'wh-003', child: Text('Branch A')),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => GetIt.I<InventoryManagementBloc>(), // In real app, might pass existing bloc or create new
      child: BlocListener<InventoryManagementBloc, InventoryManagementState>(
        listener: (context, state) {
          state.maybeWhen(
            success: () {
               // Reset
               _controller.success();
               Future.delayed(1.seconds, () {
                   if (mounted) Navigator.pop(this.context);
               });
            },
            error: (msg) {
              _controller.failure(); // Reset slider
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error: $msg', style: const TextStyle(color: Colors.white)), backgroundColor: Colors.red));
            },
            orElse: () {},
          );
        },
        child: Builder( // Builder to get context with Bloc
          builder: (context) {
            final isLoading = context.select((InventoryManagementBloc bloc) => bloc.state.maybeWhen(loading: () => true, orElse: () => false));

            return Scaffold(
              backgroundColor: context.savvy.colors.bgCanvas,
              appBar: AppBar(
                title: const SavvyText.h3('Transfer Stock'),
                backgroundColor: context.savvy.colors.bgSurface,
                elevation: 0,
                iconTheme: IconThemeData(color: context.savvy.colors.textPrimary),
              ),
               body: Column(
                 children: [
                    if (isLoading) const LinearProgressIndicator(),
                    
                    // Barcode Scanner Section
                    Container(
                      padding: const EdgeInsets.all(16),
                      color: context.savvy.colors.bgSurface,
                      child: Row(
                        children: [
                          Expanded(
                            child: SavvyTextField(
                              controller: _barcodeController,
                              hintText: 'Scan Barcode or Enter Product SKU...',
                              prefixIcon: const Icon(Icons.qr_code_scanner),
                            ),
                          ),
                          const SizedBox(width: 16),
                          FilledButton.icon(
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Searching for: ${_barcodeController.text}')));
                              _barcodeController.clear();
                            },
                            icon: const Icon(Icons.search),
                            label: const Text('Find'),
                          )
                        ],
                      ),
                    ),
                    const Divider(height: 1),

                   Expanded(
                     child: Stack(
                       children: [
                         Row(
                          children: [
                            // SOURCE (LEFT)
                            Expanded(
                              child: Container(
                                height: double.infinity,
                                color: context.savvy.colors.bgSurface,
                                padding: const EdgeInsets.all(24),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SavvyText.label('SOURCE'),
                                    const SizedBox(height: 8),
                                    DropdownButtonHideUnderline(
                                      child: DropdownButton<String>(
                                        value: sourceWarehouseId,
                                        items: warehouseOptions,
                                        onChanged: (val) {
                                          if (val != null) setState(() => sourceWarehouseId = val);
                                        },
                                      ),
                                    ),
                                    const SizedBox(height: 32),
                                    Icon(Icons.warehouse, size: 80, color: context.savvy.colors.textDisabled),
                                    const SizedBox(height: 16),
                                    const SavvyText.body('Product: Espresso Beans'),
                                    const SavvyText.body('Current Stock: 150'), // Mock
                                  ],
                                ),
                              ),
                            ),
                            
                            // DIVIDER
                            VerticalDivider(width: 1, color: context.savvy.colors.border),

                            // DESTINATION (RIGHT)
                            Expanded(
                              child: Container(
                                height: double.infinity,
                                color: context.savvy.colors.bgSurface,
                                padding: const EdgeInsets.all(24),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SavvyText.label('DESTINATION'),
                                    const SizedBox(height: 8),
                                    DropdownButtonHideUnderline(
                                      child: DropdownButton<String>(
                                        value: destWarehouseId,
                                        items: warehouseOptions,
                                        onChanged: (val) {
                                          if (val != null) setState(() => destWarehouseId = val);
                                        },
                                      ),
                                    ),
                                    const SizedBox(height: 32),
                                    Icon(Icons.storefront, size: 80, color: context.savvy.colors.textDisabled),
                                    const SizedBox(height: 16),
                                    const SavvyText.body('Product: Espresso Beans'),
                                    const SavvyText.body('Current Stock: 20'), // Mock
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),

                        // ANIMATED PACKET (Flying across)
                        if (_showPacket)
                          Positioned(
                             top: MediaQuery.of(context).size.height * 0.3,
                             left: 50, // Start point
                             child: Container(
                               padding: const EdgeInsets.all(16),
                               decoration: BoxDecoration(color: context.savvy.colors.primary, shape: BoxShape.circle),
                               child: const Icon(Icons.inventory_2, color: Colors.white),
                             )
                             .animate()
                             .move(duration: 600.ms, begin: const Offset(0, 0), end: Offset(MediaQuery.of(context).size.width * 0.5, 0), curve: Curves.easeInOutBack)
                             .scale(begin: const Offset(1,1), end: const Offset(0,0), delay: 500.ms),
                          ),
                          
                        // QTY CONTROLLER (Middle Overlay)
                        Center(
                          child: Container(
                             width: 200,
                             padding: const EdgeInsets.all(16),
                             decoration: BoxDecoration(
                               color: context.savvy.colors.bgCanvas,
                               borderRadius: BorderRadius.circular(16),
                               boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.1), blurRadius: 20)]
                             ),
                             child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                   SavvyText.label('QTY TO MOVE'),
                                   const SizedBox(height: 16),
                                   Row(
                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                     children: [
                                       IconButton(
                                         onPressed: isLoading ? null : () => setState(() => transferQty = (transferQty - 10).clamp(0, 1000)), 
                                         icon: const Icon(Icons.remove_circle_outline, size: 32)
                                       ),
                                       SavvyText.h2(transferQty.toStringAsFixed(0)),
                                       IconButton(
                                         onPressed: isLoading ? null : () => setState(() => transferQty += 10), 
                                         icon: const Icon(Icons.add_circle_outline, size: 32)
                                       ),
                                     ],
                                   )
                                ],
                             ),
                          ),
                        )
                      ],
                    ),
                  ),
                  
                  // SLIDER FOOTER
                  Container(
                    padding: const EdgeInsets.all(32),
                    decoration: BoxDecoration(
                      color: context.savvy.colors.bgSurface,
                      border: Border(top: BorderSide(color: context.savvy.colors.border))
                    ),
                    child: Center(
                      child: ActionSlider.standard(
                        controller: _controller,
                        width: 300,
                        backgroundColor: context.savvy.colors.bgCanvas,
                        toggleColor: context.savvy.colors.primary,
                        icon: const Icon(Icons.arrow_forward, color: Colors.white),
                        loadingIcon: const CircularProgressIndicator(color: Colors.white),
                        successIcon: const Icon(Icons.check, color: Colors.white),
                        failureIcon: const Icon(Icons.close, color: Colors.white),
                        child: const Text('Slide to Confirm Transfer'),
                        action: (controller) async {
                          if (transferQty <= 0) {
                             controller.reset();
                             ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Quantity must be > 0')));
                             return;
                          }
                          
                          controller.loading();
                          // Trigger Animation
                          setState(() => _showPacket = true);
                          await Future.delayed(300.ms); // Wait for anim start
                          
                          if (context.mounted) {
                            context.read<InventoryManagementBloc>().add(InventoryManagementEvent.stockTransferRequested(
                              sourceWarehouseId: sourceWarehouseId, 
                              targetWarehouseId: destWarehouseId, 
                              items: [StockTransferItem(productUuid: mockProductUuid, quantity: transferQty)], 
                              referenceNote: 'Touch Transfer'
                            ));
                          }
                        },
                      ),
                    ),
                  )
                ],
              ),
            );
          }
        ),
      ),
    );
  }
}
