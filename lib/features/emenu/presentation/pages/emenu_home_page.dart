import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:savvy_pos/core/presentation/widgets/savvy_text.dart';

class EMenuHomePage extends StatefulWidget {
  final String? storeId;
  final String? tableId;

  const EMenuHomePage({super.key, this.storeId, this.tableId});

  @override
  State<EMenuHomePage> createState() => _EMenuHomePageState();
}

class _EMenuHomePageState extends State<EMenuHomePage> {
  // Mock Data
  final List<String> stories = [
    '🔥 Hot',
    '⭐ Chef',
    '🍔 Burger',
    '🥤 Drinks',
    '🍰 Dessert'
  ];
  final List<Map<String, dynamic>> products = [
    {
      'name': 'Truffle Burger',
      'price': 15.00,
      'image': 'https://placehold.co/150x150/orange/white?text=Burger'
    },
    {
      'name': 'Wagyu Steak',
      'price': 45.00,
      'image': 'https://placehold.co/150x150/red/white?text=Steak'
    },
    {
      'name': 'Caesar Salad',
      'price': 12.00,
      'image': 'https://placehold.co/150x150/green/white?text=Salad'
    },
    {
      'name': 'Mojito',
      'price': 8.00,
      'image': 'https://placehold.co/150x150/blue/white?text=Mojito'
    },
    {
      'name': 'Cheesecake',
      'price': 9.00,
      'image': 'https://placehold.co/150x150/purple/white?text=Cake'
    },
  ];

  int cartCount = 0;
  bool isCooking = false;

  void _addToCart() {
    // Liquid Animation Trigger
    HapticFeedback.mediumImpact();
    setState(() {
      cartCount++;
    });
  }

  void _placeOrder() {
    setState(() {
      isCooking = true;
      cartCount = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              // 1. Stories Header
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(top: 60, bottom: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const SavvyText.h2('Savvy Menu'),
                            if (widget.tableId != null)
                              Chip(
                                  label: Text('Table ${widget.tableId}'),
                                  backgroundColor: Colors.black,
                                  labelStyle:
                                      const TextStyle(color: Colors.white)),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        height: 100,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          itemCount: stories.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(right: 16),
                              child: Column(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(3),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      gradient: const LinearGradient(colors: [
                                        Colors.purple,
                                        Colors.orange
                                      ]),
                                    ),
                                    child: CircleAvatar(
                                      radius: 30,
                                      backgroundColor: Colors.white,
                                      child: CircleAvatar(
                                        radius: 27,
                                        backgroundColor: Colors.grey.shade200,
                                        child: Text(stories[index][0],
                                            style:
                                                const TextStyle(fontSize: 24)),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  SavvyText.small(stories[index]),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // 2. Product List
              SliverPadding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final product = products[index];
                      return Container(
                        margin: const EdgeInsets.only(bottom: 24),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CommonNetworkImage(
                                url: product['image'],
                                width: 100,
                                height: 100,
                                radius: 12),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SavvyText.h4(product['name']),
                                  const SizedBox(height: 4),
                                  SavvyText.body(
                                      'Delicious description goes here.',
                                      color: Colors.grey),
                                  const SizedBox(height: 8),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SavvyText.h4('\$${product['price']}'),
                                      _LiquidAddButton(onAdd: _addToCart),
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                          .animate()
                          .fadeIn(delay: (100 * index).ms)
                          .slideY(begin: 0.2);
                    },
                    childCount: products.length,
                  ),
                ),
              ),

              const SliverToBoxAdapter(child: SizedBox(height: 100)),
            ],
          ),

          // 3. Floating Cart Bar (The "Cart Bar")
          if (cartCount > 0 && !isCooking)
            Positioned(
              bottom: 30,
              left: 16,
              right: 16,
              child: GestureDetector(
                onTap: _placeOrder,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(32),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withValues(alpha: 0.3),
                            blurRadius: 20,
                            offset: const Offset(0, 10))
                      ]),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 4),
                        decoration: BoxDecoration(
                            color: Colors.white.withValues(alpha: 0.2),
                            borderRadius: BorderRadius.circular(12)),
                        child: Text('$cartCount items',
                            style: const TextStyle(color: Colors.white)),
                      ),
                      const Text('View Cart',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16)),
                      const Text('\$54.00',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16)),
                    ],
                  ),
                ),
              ).animate().scale(curve: Curves.elasticOut, duration: 400.ms),
            ),

          // 4. Cooking Tracker Overlay
          if (isCooking)
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        const BorderRadius.vertical(top: Radius.circular(24)),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withValues(alpha: 0.1),
                          blurRadius: 20)
                    ]),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SavvyText.h3('Order #1234'),
                    const SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _TrackerStep(
                            icon: '👨‍🍳', label: 'Cooking', isActive: true),
                        _TrackerStep(
                            icon: '🛎️', label: 'Ready', isActive: false),
                        _TrackerStep(
                            icon: '🏃', label: 'Serving', isActive: false),
                      ],
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ).animate().slideY(
                  begin: 1, duration: 400.ms, curve: Curves.easeOutBack),
            ),
        ],
      ),
    );
  }
}

class _LiquidAddButton extends StatefulWidget {
  final VoidCallback onAdd;
  const _LiquidAddButton({required this.onAdd});

  @override
  State<_LiquidAddButton> createState() => _LiquidAddButtonState();
}

class _LiquidAddButtonState extends State<_LiquidAddButton> {
  bool _isAnimating = false;

  void _tap() async {
    widget.onAdd();
    setState(() => _isAnimating = true);
    await Future.delayed(const Duration(milliseconds: 300));
    if (mounted) setState(() => _isAnimating = false);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _tap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.elasticOut,
        width: _isAnimating ? 80 : 40,
        height: 40,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: _isAnimating
              ? const Icon(Icons.check, color: Colors.white, size: 20)
              : const Icon(Icons.add, color: Colors.white, size: 20),
        ),
      ),
    );
  }
}

class _TrackerStep extends StatelessWidget {
  final String icon;
  final String label;
  final bool isActive;
  const _TrackerStep(
      {required this.icon, required this.label, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(icon,
            style:
                TextStyle(fontSize: 32, color: isActive ? null : Colors.grey)),
        const SizedBox(height: 8),
        Text(label,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: isActive ? Colors.black : Colors.grey)),
      ],
    )
        .animate(target: isActive ? 1 : 0)
        .scale(begin: const Offset(0.8, 0.8), end: const Offset(1.1, 1.1));
  }
}

// Simple Mock Image Widget
class CommonNetworkImage extends StatelessWidget {
  final String url;
  final double width;
  final double height;
  final double radius;
  const CommonNetworkImage(
      {super.key,
      required this.url,
      required this.width,
      required this.height,
      this.radius = 0});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(radius),
      ),
      child: Center(
          child: Icon(Icons.image, color: Colors.grey.shade400)), // Placeholder
    );
  }
}
