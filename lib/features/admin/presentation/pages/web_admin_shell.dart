import 'package:flutter/material.dart';
import 'package:savvy_pos/features/admin/presentation/pages/web_dashboard_page.dart';
import 'package:savvy_pos/features/admin/presentation/widgets/admin_sidebar.dart';
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
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 600) {
            // Small screen: Drawer functionality could be added here or bottom nav.
            // For now, simpler implementation for Admin is usually desktop focused, but let's just hide rail
            // and maybe show a bottom bar or expect a drawer.
            // Given the requirements "Sidebar Menu", let's keep it simple:
            // If < 600, maybe show BottomNavigationBar? Or just a smaller rail.
            return Scaffold(
              // Nested scaffold for specific internal layout if needed
              bottomNavigationBar: BottomNavigationBar(
                currentIndex: _selectedIndex,
                onTap: (index) => setState(() => _selectedIndex = index),
                items: const [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.dashboard), label: 'Dash'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.inventory), label: 'Prod'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.bar_chart), label: 'Rpts'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.settings), label: 'Sets'),
                ],
                type: BottomNavigationBarType.fixed,
              ),
              body: _buildContent(),
            );
          } else {
            // Large screen -> Rail
            return Row(
              children: [
                AdminSidebar(
                  selectedIndex: _selectedIndex,
                  onDestinationSelected: (int index) {
                    setState(() {
                      _selectedIndex = index;
                    });
                  },
                ),
                const VerticalDivider(thickness: 1, width: 1),
                Expanded(
                  child: _buildContent(),
                ),
              ],
            );
          }
        },
      ),
    );
  }

  Widget _buildContent() {
    return Container(
      color: Colors.grey[100],
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1200),
            child: _pages[_selectedIndex],
          ),
        ),
      ),
    );
  }
}
