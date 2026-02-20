import 'package:flutter/material.dart';
import 'package:savvy_pos/core/di/injection.dart';
import 'package:savvy_pos/features/emenu/domain/entities/kiosk_entities.dart';
import 'package:savvy_pos/features/emenu/domain/repositories/i_kiosk_repository.dart';

class KioskCartPage extends StatelessWidget {
  final KioskSession session;
  final VoidCallback onBack;
  final VoidCallback onCheckout;

  const KioskCartPage({
    super.key,
    required this.session,
    required this.onBack,
    required this.onCheckout,
  });

  @override
  Widget build(BuildContext context) {
    final repo = getIt<IKioskRepository>();

    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      body: Column(
        children: [
          // Header
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
            color: Colors.white,
            child: Row(
              children: [
                IconButton(
                  onPressed: onBack,
                  icon: const Icon(Icons.arrow_back, size: 32),
                  style: IconButton.styleFrom(
                    backgroundColor: Colors.grey.shade100,
                    padding: const EdgeInsets.all(12),
                  ),
                ),
                const SizedBox(width: 24),
                const Text(
                  'YOUR ORDER',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          
          // List
          Expanded(
            child: session.cartItems.isEmpty
                ? _buildEmptyState()
                : ListView.separated(
                    padding: const EdgeInsets.all(24),
                    itemCount: session.cartItems.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 16),
                    itemBuilder: (context, index) {
                      final item = session.cartItems[index];
                      return _buildCartItem(context, item, repo);
                    },
                  ),
          ),
          
          // Footer
          if (session.cartItems.isNotEmpty)
            _buildFooter(context, session),
        ],
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.shopping_cart_outlined, size: 100, color: Colors.grey.shade300),
          const SizedBox(height: 24),
          const Text(
            'Your cart is empty',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.grey),
          ),
          const SizedBox(height: 32),
          ElevatedButton(
            onPressed: onBack,
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 24),
              backgroundColor: Colors.orange,
              foregroundColor: Colors.white,
            ),
            child: const Text('BROWSE MENU', style: TextStyle(fontSize: 20)),
          )
        ],
      ),
    );
  }

  Widget _buildCartItem(BuildContext context, KioskCartItem item, IKioskRepository repo) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          // Qty Controls
          Column(
            children: [
              IconButton(
                onPressed: () => repo.updateCartItemQuantity(session.uuid, item.uuid, item.quantity + 1),
                icon: const Icon(Icons.add_circle_outline, color: Colors.green, size: 32),
              ),
              Text(
                '${item.quantity}',
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              IconButton(
                onPressed: () => repo.updateCartItemQuantity(session.uuid, item.uuid, item.quantity - 1),
                icon: const Icon(Icons.remove_circle_outline, color: Colors.red, size: 32),
              ),
            ],
          ),
          const SizedBox(width: 24),
          // Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.name,
                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Text(
                  '\$${(item.unitPrice * item.quantity).toStringAsFixed(2)}',
                  style: TextStyle(fontSize: 20, color: Colors.grey.shade600, fontWeight: FontWeight.w500),
                ),
                if (item.modifiers.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      item.modifiers.join(', '),
                      style: TextStyle(color: Colors.grey.shade500),
                    ),
                  ),
              ],
            ),
          ),
          // Delete
          IconButton(
            onPressed: () => repo.removeFromCart(session.uuid, item.uuid),
            icon: const Icon(Icons.delete_outline, color: Colors.grey),
          ),
        ],
      ),
    );
  }

  Widget _buildFooter(BuildContext context, KioskSession session) {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 20,
            offset: const Offset(0, -5),
          )
        ]
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('TOTAL', style: TextStyle(fontSize: 16, color: Colors.grey)),
              Text(
                '\$${session.totalAmount.toStringAsFixed(2)}',
                style: const TextStyle(fontSize: 32, fontWeight: FontWeight.w900),
              ),
            ],
          ),
          const Spacer(),
          ElevatedButton(
            onPressed: onCheckout,
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 64, vertical: 24),
              backgroundColor: Colors.green,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              elevation: 4,
            ),
            child: const Text('CHECKOUT', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }
}
