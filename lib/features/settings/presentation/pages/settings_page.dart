import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get_it/get_it.dart';
import 'package:print_bluetooth_thermal/print_bluetooth_thermal.dart';
import 'package:savvy_pos/core/config/theme_config.dart';
import 'package:savvy_pos/core/hal/printer_interface.dart';
import 'package:savvy_pos/core/hal/printer_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:savvy_pos/features/inventory/presentation/pages/inventory_list_page.dart';
import 'package:savvy_pos/features/shift/presentation/bloc/shift_bloc.dart';
import 'package:savvy_pos/features/shift/presentation/widgets/close_shift_dialog.dart';
import 'package:savvy_pos/features/settings/presentation/bloc/backup_bloc.dart';
import 'package:savvy_pos/features/employees/presentation/pages/employee_list_page.dart';
import 'package:savvy_pos/features/auth/presentation/bloc/auth_bloc.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final PrinterService _printerService = GetIt.I<IPrinterService>() as PrinterService;
  List<BluetoothInfo> _devices = [];
  bool _isScanning = false;

  @override
  void initState() {
    super.initState();
    _scanForDevices();
  }

  Future<void> _scanForDevices() async {
    setState(() => _isScanning = true);
    final devices = await _printerService.scanDevices();
    if (mounted) {
      setState(() {
        _devices = devices;
        _isScanning = false;
      });
    }
  }

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
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Theme logic not connected yet')),
                );
              },
            ),
          ),
          Divider(color: colors.borderDefault),
          
          // Printer Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Printer Configuration',
                style: typography.titleMedium?.copyWith(fontWeight: FontWeight.bold),
              ),
              IconButton(
                icon: const Icon(Icons.refresh),
                onPressed: _isScanning ? null : _scanForDevices,
              ),
            ],
          ),
          
          // Connection Status
          StreamBuilder<String>(
            stream: _printerService.status,
            builder: (context, snapshot) {
               final status = snapshot.data ?? 'Disconnected';
               return Padding(
                 padding: EdgeInsets.symmetric(vertical: shapes.spacingSm),
                 child: Row(
                   children: [
                     Icon(
                       status == 'Connected' ? Icons.check_circle : Icons.info,
                       color: status == 'Connected' ? colors.stateSuccess : colors.textMuted,
                     ),
                     SizedBox(width: shapes.spacingSm),
                     Text('Status: $status'),
                   ],
                 ),
               );
            },
          ),
          
          const SizedBox(height: 16),
          
          if (_isScanning)
             const Center(child: CircularProgressIndicator())
          else if (_devices.isEmpty)
             const Center(child: Text('No Bluetooth devices found'))
          else
            ..._devices.map((device) => Card(
              color: colors.bgElevated,
              margin: EdgeInsets.symmetric(vertical: shapes.spacingXs),
              child: ListTile(
                title: Text(device.name),
                subtitle: Text(device.macAdress),
                trailing: ElevatedButton(
                  onPressed: () {
                    _printerService.connect(device.macAdress).catchError((e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Connection Failed: $e')),
                      );
                    });
                  },
                  child: const Text('Connect'),
                ),
              ),
            ).animate().slideX()),

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
