import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:savvy_pos/core/presentation/widgets/savvy_text.dart';

class AccountMappingWidget extends StatefulWidget {
  const AccountMappingWidget({super.key});

  @override
  State<AccountMappingWidget> createState() => _AccountMappingWidgetState();
}

class _AccountMappingWidgetState extends State<AccountMappingWidget> with TickerProviderStateMixin {
  // Mock Data
  final List<String> savvyCategories = ['Beverage Sales', 'Food Sales', 'Service Charge', 'Tax Collected'];
  final List<Map<String, String>> jurnalAccounts = [
    {'code': '4-4000', 'name': 'Sales Revenue'},
    {'code': '4-4001', 'name': 'Service Revenue'},
    {'code': '2-2000', 'name': 'Tax Payable'},
    {'code': '1-1001', 'name': 'Unmapped Asset'},
  ];

  final Map<String, String?> mappings = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ledger Bridge: Jurnal')),
      body: Row(
        children: [
          // Left: Savvy (Source)
          Expanded(
            child: Column(
              children: [
                const SizedBox(height: 20),
                const Icon(Icons.store, size: 50, color: Colors.purple),
                 const SizedBox(height: 10),
                const SavvyText.h3('Savvy POS'),
                const Divider(),
                Expanded(
                  child: ListView.builder(
                    itemCount: savvyCategories.length,
                    itemBuilder: (context, index) {
                      final cat = savvyCategories[index];
                      final isMapped = mappings.containsKey(cat);
                      
                      return Draggable<String>(
                        data: cat,
                        feedback: Material(
                          child: Container(
                            padding: const EdgeInsets.all(12),
                            color: Colors.purple,
                            child: Text(cat, style: const TextStyle(color: Colors.white)),
                          ),
                        ),
                        child: Container(
                          margin: const EdgeInsets.all(8),
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: isMapped ? Colors.purple.shade50 : Colors.white,
                            border: Border.all(color: Colors.purple.shade200),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(cat),
                              if (isMapped) const Icon(Icons.link, color: Colors.purple),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),

          // center: Particle Stream
          SizedBox(
            width: 100,
            child: Center(
              child: const Icon(Icons.arrow_forward_ios, color: Colors.grey).animate(onPlay: (c) => c.repeat()).shimmer(duration: 1.seconds),
            ),
          ),

          // Right: External (Target)
          Expanded(
            child: Column(
              children: [
                const SizedBox(height: 20),
                const Icon(Icons.account_balance, size: 50, color: Colors.blue),
                const SizedBox(height: 10),
                const SavvyText.h3('Jurnal.id'),
                const Divider(),
                Expanded(
                  child: ListView.builder(
                    itemCount: jurnalAccounts.length,
                    itemBuilder: (context, index) {
                      final acc = jurnalAccounts[index];
                      final mappedCat = mappings.entries
                          .firstWhere((e) => e.value == acc['code'], orElse: () => const MapEntry('', null))
                          .key;
                      
                      return DragTarget<String>(
                        onAcceptWithDetails: (details) {
                          setState(() {
                            mappings[details.data] = acc['code'];
                          });
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Mapped ${details.data} to ${acc['name']}')));
                        },
                        builder: (context, candidates, rejects) {
                          return Container(
                            margin: const EdgeInsets.all(8),
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: candidates.isNotEmpty ? Colors.blue.shade100 : Colors.white,
                              border: Border.all(color: Colors.blue.shade200),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('${acc['code']} - ${acc['name']}', style: const TextStyle(fontWeight: FontWeight.bold)),
                                if (mappedCat.isNotEmpty)
                                  Container(
                                    margin: const EdgeInsets.only(top: 8),
                                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                    decoration: BoxDecoration(color: Colors.purple.shade100, borderRadius: BorderRadius.circular(4)),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        const Icon(Icons.link, size: 12, color: Colors.purple),
                                        const SizedBox(width: 4),
                                        Text('Mapped: $mappedCat', style: const TextStyle(fontSize: 12, color: Colors.purple)),
                                      ],
                                    ),
                                  ).animate().scale(curve: Curves.elasticOut),
                              ],
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
