import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get_it/get_it.dart';
import 'package:savvy_pos/features/settings/presentation/pages/printer_settings_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:savvy_pos/features/inventory/presentation/pages/inventory_list_page.dart';
import 'package:savvy_pos/features/shift/presentation/bloc/shift_bloc.dart';
import 'package:savvy_pos/features/shift/presentation/widgets/close_shift_dialog.dart';
import 'package:savvy_pos/features/settings/presentation/bloc/backup_bloc.dart';
import 'package:savvy_pos/features/employees/presentation/pages/employee_list_page.dart';
import 'package:savvy_pos/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:savvy_pos/core/config/business_mode.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  // Printer Service moved to PrinterSettingsPage

  @override
  Widget build(BuildContext context) {
    final colors = context.savvy.colors;
    final typography = Theme.of(context).textTheme;
    final shapes = context.savvy.shapes;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        backgroundColor: colors.bgPrimary,
      ),
      body: ListView(
        padding: EdgeInsets.all(shapes.spacingMd),
        children: [
          // Theme Toggle Stub (Visual Only currently as Theme is handled in Main)
          ListTile(
            title: const Text('Dark Mode'),
            trailing: Switch(
              value: Theme.of(context).brightness == Brightness.dark,
              onChanged: (val) {
                // In a real app, use a ThemeCubit to toggle
                // In a real app, use a ThemeCubit to toggle
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Theme logic not connected yet')),
                );
              },
            ),
          ),
          // Business Mode Toggle (Retail vs F&B)
          ValueListenableBuilder<bool>(
            valueListenable: businessModeNotifier,
            builder: (context, isFoodBev, _) {
              return ListTile(
                title: const Text('Restaurant Mode (Tables)'),
                subtitle: const Text('Enable Dine-In Features'),
                trailing: Switch(
                  value: isFoodBev,
                  onChanged: (val) {
                    businessModeNotifier.toggle();
                  },
                ),
              );
            },
          ),
          Divider(color: colors.borderDefault),
          
          // Printer Management
          ListTile(
            leading: const Icon(Icons.print),
            title: const Text('Printer Setup'),
            subtitle: const Text('Configure Kitchen, Bar, and Receipt printers'),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () => Navigator.push(
              context, 
              MaterialPageRoute(builder: (_) => const PrinterSettingsPage())
            ),
          ),

          const SizedBox(height: 32),
          Divider(color: colors.borderDefault),
          
          // Inventory Management
          Text(
            'Inventory',
            style: typography.titleMedium?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          ListTile(
            leading: const Icon(Icons.inventory_2),
            title: const Text('Manage Products'),
             subtitle: const Text('Add, edit, or remove products'),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
             onTap: () => Navigator.push(
               context, 
               MaterialPageRoute(builder: (_) => const InventoryListPage())
             ),
          ),
          const SizedBox(height: 32),
          Divider(color: colors.borderDefault),

          // Employee & Data (Protected)
          BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
               final role = state.employee?.role;
               final isOwner = role == 'OWNER';
               final isManager = role == 'MANAGER' || isOwner;
               
               if (!isManager) return const SizedBox.shrink();

               return Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                    Text('Administration', style: typography.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 16),
                    ListTile(
                      leading: const Icon(Icons.people),
                      title: const Text('Employees'),
                      subtitle: const Text('Manage staff & access'),
                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const EmployeeListPage())),
                    ),
                    if (isOwner) ...[
                      // Backup Tiles via BackupBloc
                      BlocProvider(
                        create: (_) => GetIt.I<BackupBloc>(),
                        child: Builder(
                          builder: (ctx) => Column(
                            children: [
                              ListTile(
                                leading: const Icon(Icons.download),
                                title: const Text('Backup Data'),
                                onTap: () {
                                   ctx.read<BackupBloc>().add(const BackupEvent.createBackup());
                                   ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Backup Started...')));
                                },
                              ),
                              ListTile(
                                leading: const Icon(Icons.upload_file),
                                title: const Text('Restore Data'),
                                onTap: () {
                                   ctx.read<BackupBloc>().add(const BackupEvent.restoreBackup());
                                   ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Restore Started... Check file picker.')));
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                    const SizedBox(height: 32),
                    Divider(color: colors.borderDefault),
                 ],
               );
            },
          ),
          const SizedBox(height: 32),
          Divider(color: colors.borderDefault),
          
          // Shift Management
          Text(
            'Shift Management',
            style: typography.titleMedium?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          BlocBuilder<ShiftBloc, ShiftState>(
            builder: (context, state) {
              return state.maybeWhen(
                open: (shift) => SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (_) => BlocProvider.value(
                          value: context.read<ShiftBloc>(),
                          child: CloseShiftDialog(currentShift: shift),
                        ),
                      );
                    },
                    icon: const Icon(Icons.lock),
                    label: const Text('Close Register / End Shift'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: colors.stateError,
                      foregroundColor: Colors.white,
                    ),
                  ),
                ),
                orElse: () => const SizedBox.shrink(),
              );
            },
          ),
        ],
      ),
    );
  }
}
