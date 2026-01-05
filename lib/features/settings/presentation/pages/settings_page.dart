import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get_it/get_it.dart';
import 'package:print_bluetooth_thermal/print_bluetooth_thermal.dart';
import 'package:savvy_pos/core/config/theme_config.dart';
import 'package:savvy_pos/core/hal/printer_interface.dart';
import 'package:savvy_pos/core/hal/printer_service.dart';

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

        ],
      ),
    );
  }
}
