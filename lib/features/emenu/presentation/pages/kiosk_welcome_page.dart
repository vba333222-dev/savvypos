import 'package:flutter/material.dart';

class KioskWelcomePage extends StatelessWidget {
  final VoidCallback onStart;

  const KioskWelcomePage({
    super.key,
    required this.onStart,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        // Background
        Image.asset(
          'assets/images/kiosk_landing.jpg', // Placeholder
          fit: BoxFit.cover,
          errorBuilder: (_, __, ___) => Container(color: Colors.black),
        ),

        // Gradient overlay
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.black.withValues(alpha: 0.3),
                Colors.black.withValues(alpha: 0.8),
              ],
            ),
          ),
        ),

        // Content
        SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              // Logo
              const Icon(Icons.fastfood,
                  size: 80, color: Colors.white), // Placeholder logo
              const SizedBox(height: 24),
              const Text(
                'Savvy Burger',
                style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                  letterSpacing: 2.0,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Quality Burgers, Fast Service',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white70,
                ),
              ),
              const Spacer(),

              // Start Button with Pulse Effect (simulated static for now)
              GestureDetector(
                onTap: onStart,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 64, vertical: 32),
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(60),
                      boxShadow: [
                        BoxShadow(
                          color: Theme.of(context)
                              .primaryColor
                              .withValues(alpha: 0.5),
                          blurRadius: 30,
                          spreadRadius: 5,
                        )
                      ]),
                  child: const Text(
                    'ORDER NOW',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 64),

              // Language Selector (Mock)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _langButton('English', true),
                  const SizedBox(width: 16),
                  _langButton('Español', false),
                  const SizedBox(width: 16),
                  _langButton('Français', false),
                ],
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ],
    );
  }

  Widget _langButton(String code, bool selected) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: selected ? Colors.white : Colors.transparent,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white),
      ),
      child: Text(
        code,
        style: TextStyle(
          color: selected ? Colors.black : Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
