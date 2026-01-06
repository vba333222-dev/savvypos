import 'package:flutter/material.dart';
import 'package:savvy_pos/features/admin/presentation/pages/web_dashboard_page.dart';
import 'package:savvy_pos/features/employees/presentation/pages/employee_login_page.dart';

class WebAdminShell extends StatefulWidget {
  const WebAdminShell({super.key});

  @override
  State<WebAdminShell> createState() => _WebAdminShellState();
}

class _WebAdminShellState extends State<WebAdminShell> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const WebDashboardPage(),
    const Center(child: Text("Products Master (Coming Soon)")),
    const Center(child: Text("Reports (Coming Soon)")),
    const Center(child: Text("Settings (Coming Soon)")),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Savvy POS Admin"),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (_) => const EmployeeLoginPage()),
              );
            },
          ),
        ],
      ),
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
                        constraints: const BoxConstraints(maxWidth: 1200),
                        child: _pages[_selectedIndex]
                    ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
