import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:savvy_pos/core/config/theme/savvy_theme.dart';
import 'package:savvy_pos/features/pos/presentation/bloc/cart/cart_bloc.dart';
import 'package:savvy_pos/features/pos/presentation/bloc/cart/cart_event.dart';

class PromoCodeInput extends StatefulWidget {
  const PromoCodeInput({super.key});

  @override
  State<PromoCodeInput> createState() => _PromoCodeInputState();
}

class _PromoCodeInputState extends State<PromoCodeInput> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.savvy;

    return Row(
      children: [
        Expanded(
          child: SizedBox(
            height: 48, // Improved Touch Target
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: 'Enter Promo Code',
                hintStyle:
                    TextStyle(fontSize: 14, color: theme.colors.textSecondary),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(theme.shapes.radiusMd),
                  borderSide: BorderSide(color: theme.colors.borderDefault),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(theme.shapes.radiusMd),
                  borderSide: BorderSide(color: theme.colors.borderDefault),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(theme.shapes.radiusMd),
                  borderSide:
                      BorderSide(color: theme.colors.brandPrimary, width: 2),
                ),
                filled: true,
                fillColor: theme.colors.bgPrimary,
                suffixIcon: IconButton(
                  icon: const Icon(Icons.clear, size: 16),
                  onPressed: _controller.clear,
                  tooltip: 'Clear',
                ),
              ),
              style: TextStyle(fontSize: 14, color: theme.colors.textPrimary),
              onSubmitted: (value) => _applyPromo(context),
            ),
          ),
        ),
        const SizedBox(width: 8),
        SizedBox(
          height: 48,
          child: ElevatedButton(
            onPressed: () => _applyPromo(context),
            style: ElevatedButton.styleFrom(
              backgroundColor: theme.colors
                  .brandSecondary, // Make it pop a bit more or keep neutral?
              foregroundColor: theme.colors.brandPrimary,
              elevation: 0,
              side: BorderSide(
                  color: theme.colors.brandPrimary.withValues(alpha: 0.5)),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(theme.shapes.radiusMd)),
            ),
            child: const Text('APPLY',
                style: TextStyle(fontWeight: FontWeight.bold)),
          ),
        ),
      ],
    );
  }

  void _applyPromo(BuildContext context) {
    if (_controller.text.isNotEmpty) {
      context.read<CartBloc>().add(CartEvent.addPromoCode(_controller.text));
      _controller.clear();
      // Optional: Close keyboard?
      FocusScope.of(context).unfocus();
    }
  }
}
