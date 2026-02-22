import 'package:flutter/material.dart';

class WebAdminLayout extends StatefulWidget {
  const WebAdminLayout({super.key});

  @override
  State<WebAdminLayout> createState() => _WebAdminLayoutState();
}

class _WebAdminLayoutState extends State<WebAdminLayout> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const Center(child: Text("Dashboard Placeholder")),
    const Center(child: Text("Products Placeholder")),
    const Center(child: Text("Reports Placeholder")),
    const Center(child: Text("Settings Placeholder")),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          NavigationRail(
            selectedIndex: _selectedIndex,
            onDestinationSelected: (int index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            labelType: NavigationRailLabelType.all,
            destinations: const <NavigationRailDestination>[
              NavigationRailDestination(
                icon: Icon(Icons.dashboard),
                label: Text('Dashboard'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.inventory),
                label: Text('Products'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.bar_chart),
                label: Text('Reports'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.settings),
                label: Text('Settings'),
              ),
            ],
          ),
          const VerticalDivider(thickness: 1, width: 1),
          Expanded(
            child: Container(
              color: Colors.grey[100],
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Center(
                  child: ConstrainedBox(
                      constraints: const BoxConstraints(
                          maxWidth: 1200), // Max width constraint
                      child: _pages[_selectedIndex]),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
