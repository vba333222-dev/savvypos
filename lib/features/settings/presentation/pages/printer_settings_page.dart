import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:savvy_pos/core/hal/printer_interface.dart';
import 'package:savvy_pos/core/hal/printer_router.dart';
import 'package:gap/gap.dart';

class PrinterSettingsPage extends StatefulWidget {
  const PrinterSettingsPage({super.key});

  @override
  State<PrinterSettingsPage> createState() => _PrinterSettingsPageState();
}

class _PrinterSettingsPageState extends State<PrinterSettingsPage> {
  final _router = GetIt.I<PrinterRouter>();
  
  final _kitchenController = TextEditingController();
  final _barController = TextEditingController();
  final _cashierController = TextEditingController();
  
  bool _isLoading = false;
  List<PrinterDevice> _scannedDevices = [];

  @override
  void initState() {
    super.initState();
    _loadSettings();
  }
  
  Future<void> _loadSettings() async {
    await _router.loadSettings();
    setState(() {
      _kitchenController.text = _router.kitchenPrinterMac ?? '';
      _barController.text = _router.barPrinterMac ?? '';
      _cashierController.text = _router.cashierPrinterMac ?? '';
    });
  }

  Future<void> _scan() async {
    setState(() => _isLoading = true);
    try {
      final devices = await _router.scanDevices();
      setState(() => _scannedDevices = devices);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Scan failed: $e')));
    } finally {
      setState(() => _isLoading = false);
    }
  }

  Future<void> _save() async {
    await _router.saveSettings(
      kitchen: _kitchenController.text,
      bar: _barController.text,
      cashier: _cashierController.text,
    );
    if(mounted) ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Settings Saved')));
  }

  void _assignMac(String mac, String type) {
    if (type == 'KITCHEN') _kitchenController.text = mac;
    if (type == 'BAR') _barController.text = mac;
    if (type == 'CASHIER') _cashierController.text = mac;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Printer Configuration')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildInput('Cashier Printer (Receipts)', _cashierController),
            const Gap(12),
            _buildInput('Kitchen Printer (Food)', _kitchenController),
            const Gap(12),
            _buildInput('Bar Printer (Drinks)', _barController),
            const Gap(24),
            ElevatedButton.icon(
              onPressed: _save, 
              icon: const Icon(Icons.save), 
              label: const Text('Save Settings')
            ),
            const Divider(height: 48),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Available Devices', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                if (_isLoading) const CircularProgressIndicator()
                else TextButton.icon(
                  onPressed: _scan, 
                  icon: const Icon(Icons.refresh), 
                  label: const Text('Scan')
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _scannedDevices.length,
                itemBuilder: (context, index) {
                  final device = _scannedDevices[index];
                  return Card(
                    child: ListTile(
                      title: Text(device.name),
                      subtitle: Text(device.address),
                      trailing: PopupMenuButton<String>(
                        onSelected: (type) => _assignMac(device.address, type),
                        itemBuilder: (context) => [
                          const PopupMenuItem(value: 'CASHIER', child: Text('Assign to Cashier')),
                          const PopupMenuItem(value: 'KITCHEN', child: Text('Assign to Kitchen')),
                          const PopupMenuItem(value: 'BAR', child: Text('Assign to Bar')),
                        ],
                        icon: const Icon(Icons.link),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInput(String label, TextEditingController controller) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
        suffixIcon: IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () => controller.clear(),
        ),
      ),
    );
  }
}
