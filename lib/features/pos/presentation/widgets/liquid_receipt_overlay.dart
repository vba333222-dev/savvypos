import 'package:savvy_pos/core/utils/time_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:savvy_pos/core/presentation/widgets/digital_receipt_widget.dart';
import 'package:savvy_pos/features/pos/presentation/bloc/cart/cart_state.dart';

class LiquidReceiptOverlay extends StatefulWidget {
  final List<CartItem> items;
  final VoidCallback onDismiss;
  final VoidCallback onPrint;
  final VoidCallback onEmail;

  const LiquidReceiptOverlay({
    super.key,
    required this.items,
    required this.onDismiss,
    required this.onPrint,
    required this.onEmail,
  });

  @override
  State<LiquidReceiptOverlay> createState() => _LiquidReceiptOverlayState();
}

class _LiquidReceiptOverlayState extends State<LiquidReceiptOverlay>
    with TickerProviderStateMixin {
  // Animation Controller for "Printing" Entrance
  late AnimationController _printController;
  late Animation<double> _printAnimation; // Translation Y: -Height -> 0

  // Drag Physics
  Offset _dragOffset = Offset.zero;
  double _rotation = 0.0;

  bool _isTearing = false;

  @override
  void initState() {
    super.initState();

    // Setup Print Animation (Curve: Starts fast, slows down like paper stopping)
    _printController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 600));
    _printAnimation = Tween<double>(begin: -800, end: 0).animate(
        CurvedAnimation(parent: _printController, curve: Curves.easeOutQuart));

    // Start Printing
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _printController.forward();
      _playPrintingSound();
    });
  }

  @override
  void dispose() {
    _printController.dispose();
    super.dispose();
  }

  void _playPrintingSound() async {
    // Simulate "Zzzt-zzzt"
    for (int i = 0; i < 4; i++) {
      if (!mounted) break;
      await Future.delayed(100.ms);
      HapticFeedback.lightImpact();
    }
    await Future.delayed(50.ms);
    HapticFeedback.mediumImpact(); // Cut
  }

  void _onPanUpdate(DragUpdateDetails details) {
    if (_isTearing) return;

    setState(() {
      _dragOffset += details.delta;
      // Pendulum swing calculation
      _rotation = (_dragOffset.dx / 800).clamp(-0.3, 0.3);
    });
  }

  void _onPanEnd(DragEndDetails details) {
    if (_isTearing) return;

    // Tear-off Threshold
    if (_dragOffset.dy > 150) {
      _performTearOff();
    } else {
      // Snap Back Spring
      setState(() {
        _dragOffset = Offset.zero;
        _rotation = 0.0;
      });
    }
  }

  void _performTearOff() {
    setState(() => _isTearing = true);
    HapticFeedback.heavyImpact(); // Rrrrrip!
    widget.onDismiss();
  }

  @override
  Widget build(BuildContext context) {
    // Calculation
    final double total = widget.items.fold(0, (sum, item) => sum + item.total);
    final double subtotal = total / 1.1;
    final double tax = total - subtotal;

    return Scaffold(
      backgroundColor: Colors.black54, // Overlay dim
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          // 1. PRINTER SLOT (Visual Hole/Shadow at top)
          Positioned(
            top: -30,
            left: 0,
            right: 0,
            height: 60,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.black, Colors.transparent],
                ),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black, blurRadius: 40, spreadRadius: 10)
                ],
              ),
            ),
          ),

          // 2. THE RECEIPT
          AnimatedBuilder(
            animation: _printController,
            builder: (context, child) {
              double yPos = _printAnimation.value;

              if (_isTearing) {
                // Gravity fall
                yPos += 1000;
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
                      duration: 400.ms,
                      child: Container(
                        margin: const EdgeInsets.only(top: 40),
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black26,
                                blurRadius: 20,
                                offset: Offset(_dragOffset.dx * 0.1,
                                    10 + _dragOffset.dy * 0.1))
                          ],
                        ),
                        // Using existing DigitalReceiptWidget
                        child: DigitalReceiptWidget(
                          items: widget.items,
                          total: total,
                          subtotal: subtotal,
                          tax: tax,
                          discount: 0,
                          change:
                              0, // Mock for now or pass from cart if available
                          orderNumber:
                              'ORD-${TimeHelper.now().millisecondsSinceEpoch.toString().substring(8)}',
                          date: TimeHelper.now(),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),

          // 3. FLOATING ACTION BUTTONS (Fade in after print)
          Positioned(
            bottom: 40,
            child: FadeTransition(
              opacity: _printController,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _RoundActionBtn(
                      icon: Icons.print, label: 'Print', onTap: widget.onPrint),
                  SizedBox(width: 24),
                  _RoundActionBtn(
                      icon: Icons.share, label: 'Share', onTap: widget.onEmail),
                  SizedBox(width: 24),
                  _RoundActionBtn(
                      icon: Icons.close,
                      label: 'Close',
                      filled: true,
                      onTap: widget.onDismiss),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _RoundActionBtn extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final bool filled;

  const _RoundActionBtn(
      {required this.icon,
      required this.label,
      required this.onTap,
      this.filled = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FloatingActionButton(
          heroTag: label, // Unique tag
          onPressed: onTap,
          backgroundColor: filled ? Colors.white : Colors.white24,
          elevation: 0,
          child: Icon(icon, color: filled ? Colors.black : Colors.white),
        ),
        SizedBox(height: 8),
        Text(label, style: TextStyle(color: Colors.white70, fontSize: 12)),
      ],
    );
  }
}
