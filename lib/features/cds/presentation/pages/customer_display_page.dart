import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:savvy_pos/features/cds/presentation/bloc/cds_bloc.dart';
import 'package:savvy_pos/core/presentation/widgets/savvy_text.dart';

class CustomerDisplayPage extends StatelessWidget {
  const CustomerDisplayPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: BlocBuilder<CdsBloc, CdsState>(
        builder: (context, state) {
          return AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            child: state.map(
              idle: (_) => const _IdleView(key: ValueKey('idle')),
              activeCart: (s) => _ActiveCartView(key: const ValueKey('cart'), state: s),
              paymentRequest: (s) => _PaymentView(key: const ValueKey('pay'), state: s),
              success: (s) => _SuccessView(key: const ValueKey('success'), state: s),
            ),
          );
        },
      ),
    );
  }
}

class _IdleView extends StatelessWidget {
  const _IdleView({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        // Simulated Ken Burns Effect
        Image.network(
          'https://placehold.co/1920x1080/1a1a1a/white?text=Savvy+Bistro', 
          fit: BoxFit.cover,
        ).animate(onPlay: (c) => c.repeat(reverse: true))
         .scale(begin: const Offset(1,1), end: const Offset(1.1, 1.1), duration: 10.seconds)
         .moveX(begin: -20, end: 20, duration: 10.seconds),
         
        Container(color: Colors.black.withValues(alpha: 0.3)),
        
        Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SavvyText.h1('Welcome to Savvy Bistro', color: Colors.white, textStyle: TextStyle(fontSize: 64)),
              const SizedBox(height: 24),
              const SavvyText.h3('A Culinary Experience', color: Colors.white70),
            ],
          ).animate().fadeIn(duration: 2.seconds).slideY(begin: 0.2),
        ),
      ],
    );
  }
}

class _ActiveCartView extends StatelessWidget {
  final dynamic state; // Typed in real app
  const _ActiveCartView({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    final items = state.items;
    
    return Row(
      children: [
        // Left: Order List
        Expanded(
          flex: 4,
          child: Container(
            color: Colors.grey.shade900,
            padding: const EdgeInsets.all(32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SavvyText.h2('Your Order', color: Colors.white),
                const Divider(color: Colors.grey),
                Expanded(
                  child: ListView.builder(
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      final item = items[index];
                      return Container(
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.05),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.orange, 
                              child: Text('${item['qty']}', style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SavvyText.h3(item['name'], color: Colors.white),
                                  if (item['modifier'] != null)
                                    Text(item['modifier'], style: const TextStyle(color: Colors.grey)),
                                ],
                              ),
                            ),
                            SavvyText.h3('\$${item['price']}', color: Colors.white),
                          ],
                        ),
                      ).animate().slideX(begin: -0.5, curve: Curves.easeOutBack); // Fly In
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        
        // Right: Total
        Expanded(
          flex: 2,
          child: Container(
            color: Colors.black,
            padding: const EdgeInsets.all(32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SavvyText.h3('Total to Pay', color: Colors.grey),
                const SizedBox(height: 16),
                SavvyText.h1('\$${state.total.toStringAsFixed(2)}', color: Colors.greenAccent, textStyle: const TextStyle(fontSize: 72)),
                const SizedBox(height: 8),
                Text('Tax included: \$${state.tax.toStringAsFixed(2)}', style: const TextStyle(color: Colors.grey)),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _PaymentView extends StatelessWidget {
  final dynamic state;
  const _PaymentView({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SavvyText.h1('Scan to Pay', color: Colors.white),
          const SizedBox(height: 48),
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(32),
              boxShadow: const [BoxShadow(color: Colors.greenAccent, blurRadius: 40)],
            ),
            child: Icon(Icons.qr_code_2, size: 300, color: Colors.black),
          ).animate(onPlay: (c) => c.repeat(reverse: true)).scale(begin: const Offset(1,1), end: const Offset(1.05, 1.05), duration: 1.seconds),
          const SizedBox(height: 24),
          const SavvyText.h3('Waiting for payment...', color: Colors.white70),
        ],
      ),
    );
  }
}

class _SuccessView extends StatelessWidget {
  final dynamic state;
  const _SuccessView({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.check_circle, color: Colors.green, size: 120).animate().scale(curve: Curves.elasticOut),
              const SizedBox(height: 24),
              const SavvyText.h1('Payment Successful!', color: Colors.white),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                decoration: BoxDecoration(color: Colors.orange.withValues(alpha: 0.2), borderRadius: BorderRadius.circular(50), border: Border.all(color: Colors.orange)),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.star, color: Colors.orange),
                    const SizedBox(width: 8),
                    Text('You earned +${state.pointsEarned} Points', style: const TextStyle(color: Colors.orange, fontSize: 24, fontWeight: FontWeight.bold)),
                  ],
                ),
              ).animate().shimmer(),
            ],
          ),
        ),
        // Confetti would go here with a package overlay
      ],
    );
  }
}
