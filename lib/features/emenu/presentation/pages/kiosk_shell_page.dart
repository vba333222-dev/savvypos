import 'package:flutter/material.dart';
import 'package:savvy_pos/core/di/injection.dart';
import 'package:savvy_pos/features/emenu/domain/entities/kiosk_entities.dart';
import 'package:savvy_pos/features/emenu/domain/repositories/i_kiosk_repository.dart';
import 'package:savvy_pos/features/emenu/presentation/pages/kiosk_menu_page.dart';
import 'package:savvy_pos/features/emenu/presentation/pages/kiosk_welcome_page.dart';
import 'package:savvy_pos/features/emenu/presentation/pages/kiosk_cart_page.dart';
import 'package:savvy_pos/features/emenu/presentation/pages/kiosk_success_page.dart';

class KioskShellPage extends StatefulWidget {
  const KioskShellPage({super.key});

  @override
  State<KioskShellPage> createState() => _KioskShellPageState();
}

class _KioskShellPageState extends State<KioskShellPage> {
  final _kioskRepo = getIt<IKioskRepository>();

  @override
  void initState() {
    super.initState();
    // Auto-start session if none exists
    _kioskRepo.startSession();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<KioskSession?>(
        stream: _kioskRepo.watchSession(),
        builder: (context, snapshot) {
          final session = snapshot.data;
          if (session == null) {
            return const Center(child: CircularProgressIndicator());
          }

          return GestureDetector(
            onTap: () {
              // Reset idle timer on any tap
              _kioskRepo.touchSession(session.uuid);
            },
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              child: _buildStep(session),
            ),
          );
        },
      ),
    );
  }

  Widget _buildStep(KioskSession session) {
    switch (session.currentStep) {
      case KioskFlowStep.welcome:
        return KioskWelcomePage(
          key: const ValueKey('welcome'),
          onStart: () => _kioskRepo.updateStep(session.uuid, KioskFlowStep.diningOption),
        );
      case KioskFlowStep.diningOption:
         return KioskDiningOptionPage(
          key: const ValueKey('dining'),
          onSelect: (isDineIn) {
            _kioskRepo.setDiningOption(session.uuid, isDineIn);
            _kioskRepo.updateStep(session.uuid, KioskFlowStep.menu);
          },
        );
      case KioskFlowStep.menu:
        return KioskMenuPage(
          key: const ValueKey('menu'),
          session: session,
          onViewCart: () => _kioskRepo.updateStep(session.uuid, KioskFlowStep.cart),
        );
      case KioskFlowStep.cart:
       return KioskCartPage(
          key: const ValueKey('cart'),
          session: session,
          onBack: () => _kioskRepo.updateStep(session.uuid, KioskFlowStep.menu),
          onCheckout: () => _kioskRepo.updateStep(session.uuid, KioskFlowStep.payment),
        );
      case KioskFlowStep.payment:
        return KioskPaymentPage(
           key: const ValueKey('payment'),
           session: session,
           onSuccess: () => _kioskRepo.updateStep(session.uuid, KioskFlowStep.success),
        );
      case KioskFlowStep.success:
        return KioskSuccessPage(
          key: const ValueKey('success'),
          onDone: () => _kioskRepo.startSession(), // Restart
          orderUuid: session.uuid,
        );
    }
  }
}

// -- Placeholder/Inline Pages for Flow logic (will move to separate files if large) --

class KioskDiningOptionPage extends StatelessWidget {
  final Function(bool) onSelect;
  const KioskDiningOptionPage({super.key, required this.onSelect});

  @override
  Widget build(BuildContext context) {
     return Stack(
      fit: StackFit.expand,
      children: [
        // Background
        Image.asset(
          'assets/images/kiosk_bg.jpg', // Placeholder
          fit: BoxFit.cover,
          errorBuilder: (_,__,___) => Container(color: Colors.black),
        ),
        Container(color: Colors.black.withValues(alpha: 0.6)), // Overlay
        
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildOption(
                context, 
                'EAT IN', 
                Icons.restaurant, 
                () => onSelect(true),
              ),
              const SizedBox(width: 48),
              _buildOption(
                context, 
                'TAKE OUT', 
                Icons.shopping_bag, 
                () => onSelect(false),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildOption(BuildContext context, String label, IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 300,
        height: 300,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(32),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.3),
              blurRadius: 20,
              offset: const Offset(0, 10),
            )
          ]
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 80, color: Theme.of(context).primaryColor),
            const SizedBox(height: 24),
            Text(
              label,
              style: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class KioskPaymentPage extends StatelessWidget {
  final KioskSession session;
  final VoidCallback onSuccess;
  
  const KioskPaymentPage({super.key, required this.session, required this.onSuccess});

  @override
  Widget build(BuildContext context) {
    // Auto-advance for mock
    Future.delayed(const Duration(seconds: 2), onSuccess);
    
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(color: Colors.black),
            SizedBox(height: 32),
            Text(
              'PROCESSING PAYMENT...',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
             SizedBox(height: 8),
            Text('Please follow instructions on the pin pad'),
          ]
        )
      )
    );
  }
}




