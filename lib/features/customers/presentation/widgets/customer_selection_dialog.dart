import 'package:flutter/material.dart';
import 'package:savvy_pos/features/customers/presentation/pages/customer_list_page.dart';

class CustomerSelectionDialog extends StatelessWidget {
  const CustomerSelectionDialog({super.key});

  @override
  Widget build(BuildContext context) {
    // Reuse CustomerListPage in selection mode.
    // It returns a Customer object when popped.
    return SizedBox(
      width: 600, // Limit width for desktop dialog feel
      height: 700,
      child: const CustomerListPage(isSelectionMode: true),
    );
  }
}
