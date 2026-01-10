import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:savvy_pos/core/config/theme/savvy_theme.dart';
import 'package:savvy_pos/core/presentation/widgets/savvy_widgets.dart'; // SavvyButton
import 'package:savvy_pos/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';

// Standalone trigger helper
void showOutletSwitcher(BuildContext context) {
  WoltModalSheet.show(
    context: context,
    pageListBuilder: (context) {
      return [
        WoltModalSheetPage(
          backgroundColor: context.savvy.colors.bgSurface,
          hasSabGradient: false,
          topBarTitle: const SavvyText.h3('Switch Outlet'),
          isTopBarLayerAlwaysVisible: true,
          child: const Padding(
            padding: EdgeInsets.all(16.0),
            child: OutletSwitcherSheet(),
          ),
        ),
      ];
    },
  );
}

class OutletSwitcherSheet extends StatelessWidget {
  const OutletSwitcherSheet({super.key});

  @override
  Widget build(BuildContext context) {
    // In a real app, this list comes from AuthBloc state (e.g. user.allowedOutlets)
    // For now, we mock the list but check Active ID from Bloc
    final mockOutlets = [
      OutletUIModel(id: 'outlet-001', name: 'Main Cafe - Downtown', address: '123 Coffee St, New York, NY', isOnline: true, warehouseId: 'wh-001'),
      OutletUIModel(id: 'outlet-002', name: 'Pop-up Store - Brooklyn', address: '456 Maker Ave, Brooklyn, NY', isOnline: true, warehouseId: 'wh-002'),
      OutletUIModel(id: 'outlet-003', name: 'Airport Kiosk', address: 'Terminal 4, JFK', isOnline: false, warehouseId: 'wh-003'),
    ];

    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        final activeOutletId = state.activeOutletId; // Assuming this exists in AuthState from previous tasks

        return Column(
          children: [
            const SavvyText.body('Select an outlet to switch your active context. This will change inventory visibility.'),
            const SizedBox(height: 24),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: mockOutlets.length,
              separatorBuilder: (c, i) => const SizedBox(height: 16),
              itemBuilder: (context, index) {
                final outlet = mockOutlets[index];
                final isActive = outlet.id == activeOutletId;

                return _OutletCard(
                  outlet: outlet,
                  isActive: isActive,
                  onTap: () {
                    // Dispatch Change
                    context.read<AuthBloc>().add(AuthEvent.changeActiveOutlet(
                      outlet.id, 
                      outlet.warehouseId, // In real app, map outlet->warehouse
                    ));
                    Navigator.pop(context);
                    
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Switched to ${outlet.name}'))
                    );
                  },
                );
              },
            ),
            const SizedBox(height: 32),
          ],
        );
      },
    );
  }
}

class OutletUIModel {
  final String id;
  final String name;
  final String address;
  final bool isOnline;
  final String warehouseId;

  OutletUIModel({required this.id, required this.name, required this.address, required this.isOnline, required this.warehouseId});
}

class _OutletCard extends StatelessWidget {
  final OutletUIModel outlet;
  final bool isActive;
  final VoidCallback onTap;

  const _OutletCard({required this.outlet, required this.isActive, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final theme = context.savvy;
    
    return GestureDetector(
      onTap: onTap,
      child: SavvyBox(
        color: isActive ? theme.colors.primary.withValues(alpha: 0.05) : theme.colors.bgSurface,
        border: Border.all(
          color: isActive ? theme.colors.primary : theme.colors.border,
          width: isActive ? 2 : 1,
        ),
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            // Icon
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: isActive ? theme.colors.primary : theme.colors.bgCanvas,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.storefront, 
                color: isActive ? Colors.white : theme.colors.textSecondary,
                size: 24
              ),
            ),
            const SizedBox(width: 16),
            
            // Info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(child: SavvyText.h4(outlet.name)),
                      if (!outlet.isOnline) 
                         Container(
                           padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                           decoration: BoxDecoration(color: Colors.red.withValues(alpha: 0.1), borderRadius: BorderRadius.circular(4)),
                           child: const SavvyText.label('OFFLINE', color: Colors.red),
                         )
                    ],
                  ),
                  const SizedBox(height: 4),
                  SavvyText.body(outlet.address, color: theme.colors.textSecondary, maxLines: 1),
                ],
              ),
            ),
            
            // Check
            if (isActive)
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Icon(Icons.check_circle, color: theme.colors.primary),
              )
          ],
        ),
      ),
    );
  }
}
