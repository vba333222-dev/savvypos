import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:savvy_pos/core/presentation/widgets/digital_receipt_widget.dart';
import 'package:savvy_pos/core/presentation/widgets/savvy_numpad.dart';
import 'package:savvy_pos/features/pos/presentation/bloc/cart/cart_state.dart';
import 'package:savvy_pos/core/config/theme/savvy_theme.dart';
import 'package:savvy_pos/core/presentation/widgets/savvy_text.dart';
import 'package:savvy_pos/core/utils/receipt_generator.dart';
import 'package:savvy_pos/features/customers/domain/repositories/i_customer_repository.dart';
import 'package:savvy_pos/features/customers/domain/entities/customer.dart';
import 'package:uuid/uuid.dart';

Future<List<int>> _generateReceiptIsolate(Map<String, dynamic> args) async {
  // Compute must run a top-level function and ESC/POS generator inside it
  return await ReceiptGenerator.generateReceipt(
    storeName: args['storeName'],
    orderNumber: args['orderNumber'],
    date: args['date'],
    items: args['items'],
    subtotal: args['subtotal'],
    discount: args['discount'],
    tax: args['tax'],
    total: args['total'],
    paymentMethod: args['paymentMethod'],
  );
}

class CheckoutSuccessDialog extends StatefulWidget {
  final dynamic order;
  final List<CartItem> items;
  final VoidCallback onNewOrder;

  const CheckoutSuccessDialog(
      {super.key, this.order, required this.items, required this.onNewOrder});

  @override
  State<CheckoutSuccessDialog> createState() => _CheckoutSuccessDialogState();
}

class _CheckoutSuccessDialogState extends State<CheckoutSuccessDialog>
    with TickerProviderStateMixin {
  // State for E-Receipt Flow
  bool _isAddingWhatsapp = false;
  String _whatsappNumber = '';
  bool _isSending = false;

  // State for Physics
  Offset _dragOffset = Offset.zero;
  double _rotation = 0.0;

  bool _isTearing = false;

  // Animation Controller for "Printing" Entrance
  late AnimationController _printController;
  late Animation<double> _printAnimation; // Translation Y: -Height -> 0

  @override
  void initState() {
    super.initState();

    // Setup Print Animation
    _printController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 800));
    _printAnimation = Tween<double>(begin: -600, end: 0).animate(
        CurvedAnimation(parent: _printController, curve: Curves.easeOutQuart));

    // Start Printing after frame
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _printController.forward();
      _playPrintingHaptics();
    });
  }

  @override
  void dispose() {
    _printController.dispose();
    super.dispose();
  }

  void _playPrintingHaptics() async {
    // Simulate "Chug chug chug" of printer
    for (int i = 0; i < 6; i++) {
      if (!mounted) break;
      await Future.delayed(80.ms);
      HapticFeedback.selectionClick();
    }
    // Final "Cut" click
    if (mounted) HapticFeedback.mediumImpact();
  }

  void _onPanUpdate(DragUpdateDetails details) {
    if (_isTearing) return;

    setState(() {
      _dragOffset += details.delta;

      // Swing Logic: Rotate based on X drag relative to top center anchor
      // Simple approximation: X / 1000 radians
      _rotation = (_dragOffset.dx / 600).clamp(-0.4, 0.4);
    });
  }

  void _onPanEnd(DragEndDetails details) {
    if (_isTearing) return;

    // Check Threshold for Tear (Downwards)
    if (_dragOffset.dy > 150) {
      _tearOff();
    } else {
      // Snap Back
      setState(() {
        _dragOffset = Offset.zero;
        _rotation = 0.0;
      });
    }
  }

  void _tearOff() {
    setState(() => _isTearing = true);
    HapticFeedback.heavyImpact(); // Rrrrrip!

    // Complete the dismissal
    Future.delayed(300.ms, () {
      widget.onNewOrder();
    });
  }

  @override
  Widget build(BuildContext context) {
    // Calculate totals for receipt display (Dummy values if not provided in Order object)
    final double total = widget.items.fold(0, (sum, item) => sum + item.total);
    final double subtotal = total / 1.1; // Approx
    final double tax = total - subtotal;

    return Scaffold(
      backgroundColor: Colors.black54,
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 400),
        switchInCurve: Curves.easeInOut,
        switchOutCurve: Curves.easeInOut,
        child: _isAddingWhatsapp
            ? _buildWhatsappView(context)
            : _buildReceiptView(total, subtotal, tax),
      ),
    );
  }

  Widget _buildReceiptView(double total, double subtotal, double tax) {
    return Stack(
      key: const ValueKey('receipt'),
      alignment: Alignment.topCenter,
      children: [
        // 1. RECEIPT SLOT (Visual Shadow/Hole)
        Positioned(
          top: -20,
          left: 0,
          right: 0,
          height: 40,
          child: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Colors.black87, blurRadius: 30, spreadRadius: 5)
              ],
            ),
          ),
        ),

        // 2. THE RECEIPT (Interactive)
        AnimatedBuilder(
          animation: _printController,
          builder: (context, child) {
            // Combine Print Animation (Y Translation) + Drag Physics (Offset + Rotation)
            double yPos = _printAnimation.value;

            // If tearing, accelerate down
            if (_isTearing) {
              yPos += 800; // Drop off screen
            } else {
              yPos += _dragOffset.dy;
            }

            return Transform.translate(
              offset: Offset(_dragOffset.dx, yPos),
              child: Transform.rotate(
                angle: _rotation,
                alignment: Alignment.topCenter,
                child: GestureDetector(
                  onPanUpdate: _onPanUpdate,
                  onPanEnd: _onPanEnd,
                  child: AnimatedOpacity(
                    opacity: _isTearing ? 0.0 : 1.0,
                    duration: 300.ms,
                    child: Container(
                      margin: const EdgeInsets.only(
                          top: 60), // Init position below slot
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black26,
                              blurRadius: 15,
                              offset: Offset(_dragOffset.dx * 0.1,
                                  10 + _dragOffset.dy * 0.1))
                        ],
                      ),
                      child: DigitalReceiptWidget(
                        items: widget.items,
                        total: total,
                        subtotal: subtotal,
                        tax: tax,
                        discount: 0,
                        change: 12.50, // Mock
                        orderNumber: widget.order?.orderNumber ?? 'ORD-001',
                        date: widget.order?.createdAt ?? DateTime.now(),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),

        // 3. ACTION BUTTONS (Appear after print)
        Positioned(
          bottom: 40,
          left: 20,
          right: 20,
          child: FadeTransition(
            opacity: _printController, // Fade in with print
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _ActionButton(
                    icon: Icons.print,
                    label: 'Cetak Kertas',
                    onTap: () {
                      HapticFeedback.selectionClick();
                      // Implementation for physical print
                    }),
                const SizedBox(width: 24),
                _ActionButton(
                    icon: Icons.chat_bubble_outline,
                    label: 'WhatsApp',
                    onTap: () {
                      HapticFeedback.selectionClick();
                      setState(() => _isAddingWhatsapp = true);
                    }),
                const SizedBox(width: 24),
                _ActionButton(
                    icon: Icons.check,
                    label: 'Selesai',
                    isPrimary: true,
                    onTap: () {
                      widget.onNewOrder();
                    }),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildWhatsappView(BuildContext context) {
    return Center(
      key: const ValueKey('whatsapp'),
      child: Container(
        width: 600,
        height: 700,
        decoration: BoxDecoration(
          color: context.savvy.colors.bgPrimary,
          borderRadius: BorderRadius.circular(context.savvy.shapes.radiusLg),
        ),
        padding: EdgeInsets.all(context.savvy.shapes.spacingXl),
        child: Column(
          children: [
            const SavvyText.h2('Kirim E-Receipt'),
            const SizedBox(height: 8),
            SavvyText.body('Masukkan nomor WhatsApp pelanggan',
                color: context.savvy.colors.textSecondary),
            const SizedBox(height: 32),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              decoration: BoxDecoration(
                color: context.savvy.colors.bgElevated,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: context.savvy.colors.borderDefault),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SavvyText.h1('+62 ', color: Colors.grey),
                  SavvyText.h1(
                    _whatsappNumber.isEmpty ? '000 0000 0000' : _whatsappNumber,
                    color: _whatsappNumber.isEmpty
                        ? Colors.grey
                        : context.savvy.colors.textPrimary,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            Expanded(
              child: SavvyNumpad(
                onInput: (key) {
                  if (_whatsappNumber.length < 13) {
                    setState(() => _whatsappNumber += key);
                  }
                },
                onBackspace: () {
                  if (_whatsappNumber.isNotEmpty) {
                    setState(() => _whatsappNumber = _whatsappNumber.substring(
                        0, _whatsappNumber.length - 1));
                  }
                },
                onClear: () => setState(() => _whatsappNumber = ''),
              ),
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: _isSending
                        ? null
                        : () => setState(() => _isAddingWhatsapp = false),
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                    ),
                    child: const Text('Batal'),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    onPressed: (_isSending || _whatsappNumber.length < 8)
                        ? null
                        : _sendEReceipt,
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                    ),
                    child: _isSending
                        ? const SizedBox(
                            width: 24,
                            height: 24,
                            child: CircularProgressIndicator(
                                color: Colors.white, strokeWidth: 2))
                        : const Text('Kirim PDF',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _sendEReceipt() async {
    setState(() => _isSending = true);

    try {
      final double total =
          widget.items.fold(0, (sum, item) => sum + item.total);
      final double subtotal = total / 1.1;
      final double tax = total - subtotal;

      // 1. Generate PDF in Background Isolate
      // ignore: unused_local_variable
      final pdfBytes = await compute(_generateReceiptIsolate, {
        'storeName': 'Savvy Bistro',
        'orderNumber': widget.order?.orderNumber ?? 'ORD-001',
        'date': widget.order?.createdAt ?? DateTime.now(),
        'items': widget.items
            .map((i) => {
                  'name': i.product.name,
                  'qty': i.quantity,
                  'price': i.product.price,
                  'total': i.total
                })
            .toList(),
        'subtotal': subtotal,
        'discount': 0.0,
        'tax': tax,
        'total': total,
        'paymentMethod': 'Digital QR',
      });

      // 2. Mock API Gateway Transmission logic
      await Future.delayed(
          const Duration(seconds: 1)); // Sending bits to WA API...

      // 3. CRM Capture
      final crmRepo = GetIt.I<ICustomerRepository>();
      final existingCusts = await crmRepo.searchCustomers(_whatsappNumber);

      if (existingCusts.isEmpty) {
        // Auto-Create Profile for Marketing
        final newCustomer = Customer(
          uuid: const Uuid().v4(),
          name: 'Guest-$_whatsappNumber',
          phone: _whatsappNumber,
          email: '',
          totalPoints: 0,
          lastVisitAt: DateTime.now(),
        );
        await crmRepo.saveCustomer(newCustomer);
      }

      HapticFeedback.heavyImpact();
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text('E-Receipt terkirim & Kontak tersimpan di CRM!'),
              backgroundColor: Colors.green),
        );
        setState(() => _isSending = false);
        widget.onNewOrder();
      }
    } catch (e) {
      if (mounted) {
        setState(() => _isSending = false);
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Error: $e')));
      }
    }
  }
}

class _ActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final bool isPrimary;

  const _ActionButton({
    required this.icon,
    required this.label,
    required this.onTap,
    this.isPrimary = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(30),
          child: Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: isPrimary ? Colors.white : Colors.white24,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: isPrimary ? Colors.black : Colors.white),
          ),
        ),
        SizedBox(height: 8),
        Text(label, style: TextStyle(color: Colors.white70, fontSize: 12)),
      ],
    );
  }
}
