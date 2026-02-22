import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:savvy_pos/core/config/theme_config.dart';
import 'package:savvy_pos/features/customers/presentation/pages/customer_list_page.dart';
import 'package:savvy_pos/features/pos/presentation/bloc/cart/cart_bloc.dart';
import 'package:savvy_pos/features/pos/presentation/widgets/payment_methods_dialog.dart';
import 'package:savvy_pos/features/pos/presentation/bloc/cart/cart_event.dart';
import 'package:savvy_pos/features/pos/presentation/bloc/cart/cart_state.dart';
import 'package:savvy_pos/features/pos/presentation/pages/split_bill_page.dart';

class CurrentOrderSummary extends StatelessWidget {
  const CurrentOrderSummary({super.key});

  void _showDiscountDialog(BuildContext context, CartBloc bloc) {
    final percentCtrl = TextEditingController();
    final fixedCtrl = TextEditingController();

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Apply Discount'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: percentCtrl,
              decoration: const InputDecoration(
                  labelText: 'Percentage (%)', suffixText: '%'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            const Text('OR'),
            const SizedBox(height: 16),
            TextFormField(
              controller: fixedCtrl,
              decoration: const InputDecoration(
                  labelText: 'Fixed Amount', prefixText: '\$'),
              keyboardType: TextInputType.number,
            ),
          ],
        ),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel')),
          ElevatedButton(
            onPressed: () {
              double? percent = double.tryParse(percentCtrl.text);
              double? fixed = double.tryParse(fixedCtrl.text);

              bloc.add(CartEvent.applyDiscount(percent: percent, fixed: fixed));
              Navigator.pop(context);
            },
            child: const Text('Apply'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.savvy.colors;
    final shapes = context.savvy.shapes;
    final typography = Theme.of(context).textTheme;

    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        // We show container even if empty to show customer selection optionally,
        // but traditionally we hide until items added.
        // Let's show always? No, keep behavior: Hide if empty.
        if (state.items.isEmpty) {
          return const SizedBox.shrink(); // Hide if empty
        }

        return Container(
          padding: EdgeInsets.all(shapes.spacingMd),
          decoration: BoxDecoration(
            color: colors.bgElevated,
            border: Border(
              top: BorderSide(color: colors.borderDefault),
            ),
            boxShadow: context.savvy.elevations.lg,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Customer Selection
              InkWell(
                onTap: () async {
                  // Open Customer List in Selection Mode
                  final result = await Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) =>
                              const CustomerListPage(isSelectionMode: true)));
                  if (result != null && context.mounted) {
                    context
                        .read<CartBloc>()
                        .add(CartEvent.selectCustomer(result));
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.person, color: colors.brandPrimary),
                          const SizedBox(width: 8),
                          Text(
                            state.customer?.name ?? 'Guest Customer',
                            style: typography.titleSmall
                                ?.copyWith(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      if (state.customer != null)
                        IconButton(
                          icon: const Icon(Icons.close, size: 16),
                          onPressed: () => context
                              .read<CartBloc>()
                              .add(const CartEvent.selectCustomer(null)),
                        )
                      else
                        Text('Select',
                            style: TextStyle(color: colors.brandPrimary)),
                    ],
                  ),
                ),
              ),
              Divider(color: colors.borderDefault),

              // Totals
              _SummaryRow(
                  label: 'Subtotal',
                  value: '\$${state.subtotal.toStringAsFixed(2)}'),
              SizedBox(height: shapes.spacingXs),

              if (state.discount > 0) ...[
                _SummaryRow(
                  label: 'Discount',
                  value: '-\$${state.discount.toStringAsFixed(2)}',
                  color: colors.stateSuccess,
                ),
                SizedBox(height: shapes.spacingXs),
              ],

              _SummaryRow(
                  label: 'Tax (10%)',
                  value: '\$${state.tax.toStringAsFixed(2)}'),
              SizedBox(height: shapes.spacingMd),

              // F&B Actions (Split Bill / Park)
              // Only if there is an active table or business mode is F&B
              // We'll rely on BusinessMode global for visibility or state.activeTableUuid
              if (state.activeTableUuid != null ||
                  state.activeOrderUuid != null) ...[
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton.icon(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const SplitBillPage()));
                        },
                        icon: const Icon(Icons.call_split, size: 16),
                        label: const Text('Split Bill'),
                      ),
                    ),
                    const SizedBox(width: 8),
                    // Park Button (If not already parked/retrieved)
                    if (state.activeOrderUuid == null)
                      Expanded(
                        child: OutlinedButton.icon(
                          onPressed: () {
                            // Assuming we know the table from somewhere or prompt for it
                            // For now, if we don't have activeTable, we can't Park easily without selecting it.
                            // But requirement said "ParkOrder(tableUuid)".
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text(
                                        'Select Table from Floor Plan to Park')));
                          },
                          icon: const Icon(Icons.save_alt, size: 16),
                          label: const Text('Park'),
                        ),
                      ),
                  ],
                ),
                SizedBox(height: shapes.spacingMd),
              ],

              // Discount Button Area
              Row(
                children: [
                  TextButton.icon(
                    onPressed: () =>
                        _showDiscountDialog(context, context.read<CartBloc>()),
                    icon: const Icon(Icons.local_offer, size: 16),
                    label: const Text('Discount'),
                    style: TextButton.styleFrom(
                      foregroundColor: colors.brandPrimary,
                      padding: EdgeInsets.zero,
                      alignment: Alignment.centerLeft,
                    ),
                  ),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total',
                    style: typography.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: colors.textPrimary,
                    ),
                  ),
                  Text(
                    '\$${state.total.toStringAsFixed(2)}',
                    style: typography.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: colors.brandPrimary,
                    ),
                  ),
                ],
              ),
              SizedBox(height: shapes.spacingMd),

              // Checkout Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: state.isLoading
                      ? null
                      : () {
                          showDialog(
                            context: context,
                            builder: (_) => PaymentMethodsDialog(
                              totalAmount: state.total,
                              cartBloc: context.read<CartBloc>(),
                            ),
                          );
                        },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: colors.brandPrimary,
                    foregroundColor: colors.textInverse,
                    padding: EdgeInsets.symmetric(vertical: shapes.spacingMd),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(shapes.radiusMd),
                    ),
                    elevation: 0,
                  ),
                  child: state.isLoading
                      ? SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: colors.textInverse,
                          ),
                        )
                      : Text(
                          'Charge \$${state.total.toStringAsFixed(2)}',
                          style: typography.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: colors.textInverse,
                          ),
                        ),
                ),
              ).animate().scale(
                  duration: context.savvy.motion.durationFast,
                  curve: context.savvy.motion.curveBounce),
            ],
          ),
        );
      },
    );
  }
}

class _SummaryRow extends StatelessWidget {
  final String label;
  final String value;
  final Color? color;

  const _SummaryRow({required this.label, required this.value, this.color});

  @override
  Widget build(BuildContext context) {
    final colors = context.savvy.colors;
    final typography = Theme.of(context).textTheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: typography.bodyMedium?.copyWith(color: colors.textSecondary),
        ),
        Text(
          value,
          style: typography.bodyMedium?.copyWith(
            color: color ?? colors.textPrimary,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
