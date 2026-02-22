import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get_it/get_it.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:savvy_pos/core/config/theme_config.dart';
import 'package:savvy_pos/core/hal/printer_interface.dart';
import 'package:savvy_pos/core/presentation/widgets/savvy_widgets.dart';

class PrinterSettingsPage extends StatefulWidget {
  const PrinterSettingsPage({super.key});

  @override
  State<PrinterSettingsPage> createState() => _PrinterSettingsPageState();
}

class _PrinterSettingsPageState extends State<PrinterSettingsPage> {
  final IPrinterService _printerService = GetIt.I<IPrinterService>();

  List<PrinterDevice> _devices = [];
  bool _isScanning = false;
  String _status = "Disconnected";

  @override
  void initState() {
    super.initState();
    _scan();
    _printerService.status.listen((s) {
      if (mounted) {
        setState(() {
          final rawStr = s.name;
          _status = "${rawStr[0].toUpperCase()}${rawStr.substring(1)}";
        });
      }
    });
  }

  Future<void> _scan() async {
    setState(() => _isScanning = true);

    // Request Permissions first
    await [
      Permission.bluetoothScan,
      Permission.bluetoothConnect,
      Permission.location, // Sometimes needed for easier BLE discovery
    ].request();

    final devices = await _printerService.scan();
    if (mounted) {
      setState(() {
        _devices = devices;
        _isScanning = false;
      });
    }
  }

  Future<void> _connect(PrinterDevice device) async {
    try {
      await _printerService.connect(device.address);
      // Persist preference logic here (SharedPreferences)
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Connect Error: $e')));
      }
    }
  }

  Future<void> _testPrint() async {
    try {
      await _printerService.printText(
          "Hello Savvy POS!\nTest Print Successful.\n\n\n",
          isBold: true);
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Print Error: $e')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.savvy;

    return Scaffold(
      backgroundColor: theme.colors.bgPrimary,
      appBar: AppBar(
          title: SavvyText("Hardware Settings", style: SavvyTextStyle.h3)),
      body: Padding(
        padding: EdgeInsets.all(theme.shapes.spacingMd),
        child: Column(
          children: [
            // Status Card
            SavvyBox(
              width: double.infinity,
              color: theme.colors.bgElevated,
              padding: EdgeInsets.all(theme.shapes.spacingMd),
              child: Row(
                children: [
                  Icon(Icons.print,
                      color: _status == "Connected"
                          ? theme.colors.stateSuccess
                          : theme.colors.textMuted),
                  SizedBox(width: theme.shapes.spacingMd),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SavvyText("Printer Status", style: SavvyTextStyle.label),
                      SavvyText(_status, style: SavvyTextStyle.h3),
                    ],
                  ),
                  const Spacer(),
                  if (_status == "Connected")
                    ElevatedButton(
                        onPressed: _testPrint, child: const Text("Test Print"))
                ],
              ),
            ),

            SizedBox(height: theme.shapes.spacingLg),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SavvyText("Discovered Devices", style: SavvyTextStyle.h3),
                if (_isScanning)
                  const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(strokeWidth: 2))
                else
                  IconButton(icon: const Icon(Icons.refresh), onPressed: _scan),
              ],
            ),

            Expanded(
              child: _devices.isEmpty
                  ? Center(
                      child: SavvyText("No devices found",
                          color: theme.colors.textMuted))
                  : ListView.builder(
                      itemCount: _devices.length,
                      itemBuilder: (context, index) {
                        final device = _devices[index];
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: SavvyBox(
                            color: theme.colors.bgSecondary,
                            child: ListTile(
                              title: Text(device.name),
                              subtitle: Text(device.address),
                              trailing: ElevatedButton(
                                onPressed: () => _connect(device),
                                child: const Text("Connect"),
                              ),
                            ),
                          ).animate().fadeIn(delay: (50 * index).ms).slideX(),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
