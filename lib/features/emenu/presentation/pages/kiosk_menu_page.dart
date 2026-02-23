import 'package:savvy_pos/core/utils/time_helper.dart';
import 'package:flutter/material.dart';
import 'package:savvy_pos/core/di/injection.dart';
import 'package:savvy_pos/features/emenu/domain/entities/kiosk_entities.dart';
import 'package:savvy_pos/features/emenu/domain/repositories/i_kiosk_repository.dart';
// import 'package:savvy_pos/features/inventory/domain/repositories/i_product_repository.dart';
// import 'package:savvy_pos/features/inventory/domain/entities/product.dart';

class KioskMenuPage extends StatefulWidget {
  final KioskSession session;
  final VoidCallback onViewCart;

  const KioskMenuPage({
    super.key,
    required this.session,
    required this.onViewCart,
  });

  @override
  State<KioskMenuPage> createState() => _KioskMenuPageState();
}

class _KioskMenuPageState extends State<KioskMenuPage> {
  // Using Mock data for now to focus on UI, or could inject repo
  // final _productRepo = getIt<IProductRepository>();
  final _kioskRepo = getIt<IKioskRepository>();

  String _selectedCategory = 'Burgers';
  final List<String> _categories = ['Burgers', 'Drinks', 'Sides', 'Desserts'];

  // Mock Products
  final List<Map<String, dynamic>> _allProducts = [
    {
      'uuid': 'p1',
      'name': 'Classic Burger',
      'price': 8.99,
      'category': 'Burgers',
      'image': 'assets/images/burger_classic.jpg',
      'desc': 'Beef patty, lettuce, tomato, cheese',
    },
    {
      'uuid': 'p2',
      'name': 'Double Cheese',
      'price': 10.99,
      'category': 'Burgers',
      'image': 'assets/images/burger_double.jpg',
      'desc': 'Double beef, double cheese, secret sauce',
    },
    {
      'uuid': 'p3',
      'name': 'Cola',
      'price': 2.50,
      'category': 'Drinks',
      'image': 'assets/images/drink_cola.jpg',
      'desc': 'Ice cold cola',
    },
    {
      'uuid': 'p4',
      'name': 'Fries',
      'price': 3.99,
      'category': 'Sides',
      'image': 'assets/images/fries.jpg',
      'desc': 'Golden crispy fries',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final filteredProducts =
        _allProducts.where((p) => p['category'] == _selectedCategory).toList();

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Column(
        children: [
          // Header
          _buildHeader(),

          // Categories
          _buildCategoryTabs(),

          // Grid
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(24),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 0.75,
                crossAxisSpacing: 24,
                mainAxisSpacing: 24,
              ),
              itemCount: filteredProducts.length,
              itemBuilder: (context, index) {
                final product = filteredProducts[index];
                return _buildProductCard(product);
              },
            ),
          ),
        ],
      ),
      floatingActionButton: _buildCartButton(),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.fromLTRB(32, 48, 32, 24),
      color: Colors.white,
      child: Row(
        children: [
          const Icon(Icons.fastfood, size: 40, color: Colors.orange),
          const SizedBox(width: 16),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Savvy Burger',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Text(
                'ORDER HERE',
                style: TextStyle(
                    fontSize: 14, color: Colors.grey, letterSpacing: 1.2),
              ),
            ],
          ),
          const Spacer(),
          // Cancel/Reset Button
          TextButton.icon(
            onPressed: () {
              // Restart
              _kioskRepo.updateStep(widget.session.uuid, KioskFlowStep.welcome);
            },
            icon: const Icon(Icons.refresh, color: Colors.red),
            label:
                const Text('START OVER', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryTabs() {
    return Container(
      height: 80,
      color: Colors.white,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        scrollDirection: Axis.horizontal,
        itemCount: _categories.length,
        separatorBuilder: (_, __) => const SizedBox(width: 16),
        itemBuilder: (context, index) {
          final category = _categories[index];
          final isSelected = category == _selectedCategory;
          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedCategory = category;
              });
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: isSelected ? Colors.orange : Colors.grey.shade100,
                borderRadius: BorderRadius.circular(40),
              ),
              child: Text(
                category.toUpperCase(),
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: isSelected ? Colors.white : Colors.grey.shade600,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildProductCard(Map<String, dynamic> product) {
    return GestureDetector(
      onTap: () => _addToCart(product),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image
            Expanded(
              flex: 3,
              child: Container(
                color: Colors.grey.shade200,
                alignment: Alignment.center,
                child: Icon(Icons.lunch_dining,
                    size: 60, color: Colors.grey.shade400),
                // In real app: Image.network(product['image']...)
              ),
            ),
            // Details
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product['name'],
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      product['desc'],
                      style:
                          TextStyle(fontSize: 14, color: Colors.grey.shade600),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '\$${product['price']}',
                          style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.orange),
                        ),
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: const BoxDecoration(
                            color: Colors.orange,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(Icons.add,
                              color: Colors.white, size: 20),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCartButton() {
    final count =
        widget.session.cartItems.fold(0, (sum, item) => sum + item.quantity);
    final total = widget.session.totalAmount;

    if (count == 0) return const SizedBox.shrink();

    return GestureDetector(
      onTap: widget.onViewCart,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(40),
            boxShadow: [
              BoxShadow(
                color: Colors.green.withValues(alpha: 0.4),
                blurRadius: 16,
                offset: const Offset(0, 8),
              )
            ]),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.black.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                '$count',
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
            ),
            const SizedBox(width: 16),
            const Text(
              'VIEW ORDER',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
            const SizedBox(width: 16),
            Text(
              '\$${total.toStringAsFixed(2)}',
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }

  void _addToCart(Map<String, dynamic> product) {
    // In real app, show modifier dialog first
    // Here we just add directly
    final item = KioskCartItem(
      uuid: TimeHelper.now().toIso8601String(), // Temp UUID
      productUuid: product['uuid'],
      name: product['name'],
      unitPrice: product['price'],
      quantity: 1,
    );

    _kioskRepo.addToCart(widget.session.uuid, item);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${product['name']} added to order'),
        duration: const Duration(seconds: 1),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.green,
      ),
    );
  }
}
