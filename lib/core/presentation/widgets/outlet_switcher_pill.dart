import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:savvy_pos/core/config/theme/savvy_theme.dart';
import 'package:savvy_pos/core/presentation/widgets/savvy_box.dart';
import 'package:savvy_pos/core/presentation/widgets/savvy_text.dart';
import 'package:savvy_pos/features/auth/presentation/bloc/auth_bloc.dart';

class OutletSwitcherPill extends StatelessWidget {
  const OutletSwitcherPill({super.key});


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listenWhen: (p, c) => p.isLoading != c.isLoading,
      listener: (context, state) {
        if (state.isLoading) {
          showDialog(
             context: context,
             barrierDismissible: false,
             builder: (_) => const Center(child: CircularProgressIndicator()),
          );
        } else {
             // If we used a dialog loader, pop it. But checking if dialog is open is tricky.
             // Instead, let's rely on the global overlay if strictly requested.
             // But for this specific file, user asked "Show a generic loading indicator".
             Navigator.of(context, rootNavigator: true).popUntil((route) => route is! PopupRoute);
        }
      },
      builder: (context, state) {
        // Mock Name Mapping (In real app, fetch from Repo/Config)
        final outletName = state.activeOutletId == 'outlet-002' ? 'Outlet Downtown' : 'Main Outlet';
        final warehouseName = state.activeWarehouseId == 'wh-002' ? 'Downtown WH' : 'Main Warehouse';

        return GestureDetector(
          onTap: () => _showOutletSelectionDialog(context),
          child: SavvyBox(
            color: context.savvy.colors.bgSurface,
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: context.savvy.colors.border),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Live Status Dot - always green for now (TODO: integrate with NetworkBloc)
                Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: context.savvy.colors.success,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 8),
                
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SavvyText.label(outletName, textStyle: const TextStyle(fontSize: 10), color: context.savvy.colors.textSecondary),
                    SavvyText.body(warehouseName, textStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600)),
                  ],
                ),
                
                const SizedBox(width: 8),
                Icon(Icons.keyboard_arrow_down, size: 16, color: context.savvy.colors.textSecondary),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showOutletSelectionDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => SimpleDialog(
        title: const SavvyText.h3('Select Context'),
        backgroundColor: Theme.of(context).cardColor,
        children: [
           SimpleDialogOption(
             padding: const EdgeInsets.all(16),
             onPressed: () {
               context.read<AuthBloc>().add(const AuthEvent.changeActiveOutlet('outlet-001', 'wh-001'));
               Navigator.pop(ctx);
             },
             child: const Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 SavvyText.h4('Main Outlet'),
                 SavvyText.body('Main Warehouse'),
               ],
             ),
           ),
           const Divider(),
           SimpleDialogOption(
             padding: const EdgeInsets.all(16),
             onPressed: () {
               context.read<AuthBloc>().add(const AuthEvent.changeActiveOutlet('outlet-002', 'wh-002'));
               Navigator.pop(ctx);
             },
             child: const Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 SavvyText.h4('Outlet Downtown'),
                 SavvyText.body('Downtown WH'),
               ],
             ),
           ),
        ],
      ),
    );
  }
}
