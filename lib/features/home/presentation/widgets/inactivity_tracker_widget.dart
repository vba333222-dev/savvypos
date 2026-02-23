import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:savvy_pos/core/utils/sound_helper.dart';
import 'package:savvy_pos/features/pos/presentation/bloc/cart/cart_bloc.dart';
import 'package:savvy_pos/features/pos/presentation/bloc/cart/cart_event.dart';

class InactivityTrackerWidget extends StatefulWidget {
  final Widget child;
  final Duration timeoutDuration;

  const InactivityTrackerWidget({
    super.key,
    required this.child,
    this.timeoutDuration = const Duration(minutes: 3),
  });

  @override
  State<InactivityTrackerWidget> createState() =>
      _InactivityTrackerWidgetState();
}

class _InactivityTrackerWidgetState extends State<InactivityTrackerWidget> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer?.cancel();
    _timer = Timer(widget.timeoutDuration, _handleTimeout);
  }

  void _resetTimer() {
    _startTimer();
  }

  void _handleTimeout() {
    if (!mounted) return;

    final cartBloc = context.read<CartBloc>();

    // Only trigger if cart has items
    if (cartBloc.state.items.isNotEmpty) {
      cartBloc.add(const CartEvent.clearCart());

      GetIt.I<SoundHelper>().playError();

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Sesi tidak aktif. Keranjang telah dikosongkan secara otomatis.'),
          backgroundColor: Colors.orange,
          duration: Duration(seconds: 4),
        ),
      );
    }
    
    // Restart timer in case user stays idle but cart is empty (prevents dead loops)
    _startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: _resetTimer,
      onPanDown: (_) => _resetTimer(),
      // Adding Scale for pinch/zoom coverage
      onScaleStart: (_) => _resetTimer(),
      child: widget.child,
    );
  }
}
