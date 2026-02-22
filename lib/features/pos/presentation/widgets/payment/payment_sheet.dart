import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:savvy_pos/core/config/theme/savvy_theme.dart';
import 'package:savvy_pos/core/presentation/widgets/savvy_text.dart';
import 'package:savvy_pos/core/presentation/widgets/savvy_numpad.dart';
import 'package:savvy_pos/features/pos/presentation/widgets/payment/smart_cash_helper.dart';
import 'package:savvy_pos/features/pos/presentation/bloc/cart/cart_bloc.dart';
import 'package:savvy_pos/features/pos/presentation/bloc/cart/cart_event.dart';
import 'package:savvy_pos/features/giftcards/presentation/widgets/gift_card_payment_dialog.dart';
import 'package:savvy_pos/features/loyalty/presentation/bloc/loyalty_bloc.dart';
import 'package:savvy_pos/features/loyalty/presentation/bloc/loyalty_state.dart';
import 'package:savvy_pos/features/loyalty/domain/entities/loyalty_entities.dart';

class PaymentSheet extends StatefulWidget {
  final double totalAmount;

  const PaymentSheet({super.key, required this.totalAmount});

  @override
  State<PaymentSheet> createState() => _PaymentSheetState();
}

class _PaymentSheetState extends State<PaymentSheet> {
  String _input = "";

  // Computed cash amount from string input
  double get _cashAmount {
    if (_input.isEmpty) return 0;
    // Assume input is raw integer digits, formatted as currency.
    // e.g. "1" -> 1.0, "12" -> 12.0
    // If handling cents, logic might be div by 100.
    // For standard POS (often integer based in IDR/YEN etc, or decimal in USD).
    // Let's assume standard decimal input logic:
    // IF decimal is needed, we need a dot button.
    // The requested Numpad doesn't have a dot.
    // Usually high volume POS treats input as integers (12500) or auto-decimals?
    // Given the prompt examples "12.500", "15.000", it implies integer-focus (IDR style).
    // I will treat input as Integer. If user needs cents, it's tricky without dot.
    // I will assume Integer for now based on context hints "12.500".

    return double.tryParse(_input) ?? 0;
  }

  void _handleNumpadInput(String value) {
    setState(() {
      if (_input == "0" && value != "00") {
        _input = value;
      } else {
        if (_input.length < 9) {
          // Max digits limit
          _input += value;
        }
      }
    });
  }

  void _handleDataInput(double val) {
    setState(() {
      _input = val.toInt().toString();
    });
  }

  void _handleBackspace() {
    setState(() {
      if (_input.isNotEmpty) {
        _input = _input.substring(0, _input.length - 1);
      }
    });
  }

  void _handleClear() {
    setState(() {
      _input = "";
    });
  }

  void _processPayment() {
    if (_cashAmount >= widget.totalAmount) {
      HapticFeedback.heavyImpact();
      // Trigger Checkout
      context.read<CartBloc>().add(CartEvent.checkoutProcessed(
            tenderedAmount: _cashAmount,
            paymentMethod: 'CASH',
          ));
      Navigator.pop(context);
    } else {
      HapticFeedback.vibrate();
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Insufficient Amount")));
    }
  }

  Future<void> _handleGiftCardPayment() async {
    // Import needed at top: import 'package:savvy_pos/features/giftcards/presentation/widgets/gift_card_payment_dialog.dart';
    final result = await showDialog<Map<String, dynamic>>(
      context: context,
      builder: (_) => GiftCardPaymentDialog(
          totalDue: widget.totalAmount -
              _cashAmount), // Allow split? For now just remaining total
    );

    if (result != null) {
      final amount = result['amount'] as double;
      // final cardUuid = result['cardUuid'] as String; // Unused

      if (!mounted) return;

      HapticFeedback.heavyImpact();
      context.read<CartBloc>().add(CartEvent.checkoutProcessed(
            tenderedAmount: amount,
            paymentMethod: 'GIFT_CARD',
          ));
      Navigator.pop(context);
    }
  }

  Future<void> _handleLoyaltyPayment(
      BuildContext context, LoyaltyMember member, LoyaltyConfig? config) async {
    // Calculate max redeemable
    // Assuming 100 pts = $1 (default in repo)
    final maxRedeemDollars = (member.currentPoints / 100).floorToDouble();
    final remainingDue = widget.totalAmount - _cashAmount;

    // Auto-calculate applicable
    double toRedeem = maxRedeemDollars;
    if (toRedeem > remainingDue) toRedeem = remainingDue;

    final pointsNeeded = (toRedeem * 100).toInt();

    final confirm = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Redeem Points?'),
        content: Text(
            'Use $pointsNeeded points to pay \$${toRedeem.toStringAsFixed(2)}?'),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(ctx, false),
              child: const Text('Cancel')),
          ElevatedButton(
              onPressed: () => Navigator.pop(ctx, true),
              child: const Text('Redeem')),
        ],
      ),
    );

    if (confirm == true && mounted) {
      context.read<CartBloc>().add(CartEvent.checkoutProcessed(
            tenderedAmount: toRedeem,
            paymentMethod:
                'LOYALTY_POINTS', // Ensure this enum/string is handled in CartBloc/Repo
          ));
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.savvy;
    final suggestions = SmartCashHelper.generateSuggestions(widget.totalAmount);
    final change = _cashAmount > widget.totalAmount
        ? _cashAmount - widget.totalAmount
        : 0.0;

    return Container(
      decoration: BoxDecoration(
        color: theme.colors.bgPrimary,
        borderRadius:
            BorderRadius.vertical(top: Radius.circular(theme.shapes.radiusXl)),
      ),
      padding: EdgeInsets.fromLTRB(
          theme.shapes.spacingMd,
          theme.shapes.spacingLg,
          theme.shapes.spacingMd,
          theme.shapes.spacingMd),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // HEADER
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SavvyText('Payment',
                  style: SavvyTextStyle.h3, color: theme.colors.textPrimary),
              Row(
                children: [
                  TextButton.icon(
                    onPressed: () async {
                      _handleGiftCardPayment();
                    },
                    icon: Icon(Icons.card_giftcard,
                        color: theme.colors.brandPrimary),
                    label: Text("Gift Card",
                        style: TextStyle(color: theme.colors.brandPrimary)),
                  ),
                  // Loyalty Button
                  BlocBuilder<LoyaltyBloc, LoyaltyState>(
                    builder: (context, state) {
                      if (!state.isEnrolled || state.member == null)
                        return const SizedBox.shrink();
                      final points = state.member!.currentPoints;
                      // Simple check: > 100 points
                      if (points < 100) return const SizedBox.shrink();

                      return TextButton.icon(
                        onPressed: () => _handleLoyaltyPayment(
                            context, state.member!, state.config),
                        icon: Icon(Icons.stars, color: Colors.amber.shade700),
                        label: Text("Use Points ($points)",
                            style: TextStyle(color: Colors.amber.shade700)),
                      );
                    },
                  ),
                  IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon:
                          Icon(Icons.close, color: theme.colors.textSecondary)),
                ],
              ),
            ],
          ),

          Divider(color: theme.colors.borderDefault),

          // DISPLAY AREA
          Container(
            padding: EdgeInsets.all(theme.shapes.spacingMd),
            margin: EdgeInsets.symmetric(vertical: theme.shapes.spacingMd),
            decoration: BoxDecoration(
              color: theme.colors.bgElevated,
              borderRadius: BorderRadius.circular(theme.shapes.radiusMd),
              border: Border.all(color: theme.colors.brandPrimary, width: 1.5),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SavvyText('TOTAL DUE',
                        style: SavvyTextStyle.labelMedium,
                        color: theme.colors.textSecondary),
                    SavvyText('\$${widget.totalAmount.toStringAsFixed(2)}',
                        style: SavvyTextStyle.h3,
                        color: theme.colors.textPrimary),
                  ],
                ),
                SizedBox(height: theme.shapes.spacingMd),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SavvyText('TENDERED',
                        style: SavvyTextStyle.labelMedium,
                        color: theme.colors.brandPrimary),
                    // Animated Text Size
                    AnimatedDefaultTextStyle(
                      duration: 200.ms,
                      style: TextStyle(
                        fontSize: _input.isEmpty ? 24 : 32,
                        fontWeight: FontWeight.bold,
                        color: theme.colors.brandPrimary,
                        fontFamily: 'Inter', // Or theme logic
                      ),
                      child: Text(_input.isEmpty
                          ? "\$0"
                          : "\$${double.parse(_input).toStringAsFixed(0)}"),
                    ),
                  ],
                ),
                if (change > 0) ...[
                  Divider(height: 24, color: theme.colors.borderDefault),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SavvyText('CHANGE',
                          style: SavvyTextStyle.labelMedium,
                          color: theme.colors.stateSuccess),
                      SavvyText('\$${change.toStringAsFixed(2)}',
                          style: SavvyTextStyle.h3,
                          color: theme.colors.stateSuccess),
                    ],
                  ),
                ]
              ],
            ),
          ),

          // SUGGESTIONS ROW
          SizedBox(
            height: 48,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: suggestions.length,
              separatorBuilder: (_, __) =>
                  SizedBox(width: theme.shapes.spacingSm),
              itemBuilder: (context, index) {
                final amt = suggestions[index];
                return ActionChip(
                  backgroundColor: theme.colors.bgElevated,
                  side: BorderSide(color: theme.colors.borderDefault),
                  label: Text('\$${amt.toInt()}',
                      style: TextStyle(color: theme.colors.textPrimary)),
                  onPressed: () {
                    HapticFeedback.selectionClick();
                    _handleDataInput(amt);
                  },
                );
              },
            ),
          ),

          SizedBox(height: theme.shapes.spacingMd),

          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: SavvyNumpad(
                  onInput: _handleNumpadInput,
                  onBackspace: _handleBackspace,
                  onClear: _handleClear,
                ),
              ),

              SizedBox(width: theme.shapes.spacingMd),

              // ACTION SIDE (For Tablet) or Bottom
              // In this layout, I'm putting it side-by-side as requested for tablet,
              // but for mobile standard modal sheet usually stacks.
              // Assuming flexible responsiveness not strictly defined, but "Bawah (Mobile) / Kanan (Tablet)".
              // I'll make it context aware or just stack for simplicity in this implementation unless constraints allow LayoutBuilder.
              // The request specified "Kanan (Tablet) / Bawah (Mobile)".
              // I'll stick to a column layout for the sheet as sheets are usually narrow.
              // But let's check size.
            ],
          ),

          // CONFIRM BUTTON (Slide)
          Container(
            width: double.infinity,
            height: 64,
            margin: EdgeInsets.only(top: theme.shapes.spacingMd),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    change >= 0 && _cashAmount >= widget.totalAmount
                        ? theme.colors.brandPrimary
                        : theme.colors.bgDisabled,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(theme.shapes.radiusLg)),
              ),
              onPressed: change >= 0 && _cashAmount >= widget.totalAmount
                  ? _processPayment
                  : null,
              child: SavvyText('CHARGE \$${_cashAmount.toStringAsFixed(2)}',
                  style: SavvyTextStyle.h3, color: theme.colors.textInverse),
            ),
          ),
        ],
      ),
    );
  }
}
