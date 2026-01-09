import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:savvy_pos/core/security/roles.dart';
import 'package:savvy_pos/features/auth/presentation/bloc/auth_bloc.dart';

class AdminSidebar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onDestinationSelected;

  const AdminSidebar({
    super.key,
    required this.selectedIndex,
    required this.onDestinationSelected,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        final employee = state.employee;
        UserRole role = UserRole.unknown;
        if (employee != null) {
          role = UserRole.fromString(employee.role);
        }

        // Define all possible destinations with their permission check
        final allDestinations = [
          _SidebarItem(
            destination: const NavigationRailDestination(
              icon: Icon(Icons.dashboard_outlined),
              selectedIcon: Icon(Icons.dashboard),
              label: Text('Dashboard'),
            ),
            isVisible: true, 
          ),
          _SidebarItem(
            destination: const NavigationRailDestination(
              icon: Icon(Icons.shopping_cart_outlined),
              selectedIcon: Icon(Icons.shopping_cart),
              label: Text('POS'),
            ),
             // Assuming POS is always visible or check permission
            isVisible: true,
          ),
          _SidebarItem(
            destination: const NavigationRailDestination(
              icon: Icon(Icons.inventory_2_outlined),
              selectedIcon: Icon(Icons.inventory_2),
              label: Text('Inventory'),
            ),
            isVisible: RoleGuard.canManageInventory(role),
          ),
          _SidebarItem(
            destination: const NavigationRailDestination(
              icon: Icon(Icons.bar_chart_outlined),
              selectedIcon: Icon(Icons.bar_chart),
              label: Text('Reports'),
            ),
            isVisible: RoleGuard.canViewReports(role),
          ),
          _SidebarItem(
            destination: const NavigationRailDestination(
              icon: Icon(Icons.settings_outlined),
              selectedIcon: Icon(Icons.settings),
              label: Text('Settings'),
            ),
            isVisible: RoleGuard.canManageSettings(role),
          ),
        ];

        final visibleDestinations = allDestinations.where((item) => item.isVisible).toList();

        return NavigationRail(
          selectedIndex: selectedIndex >= visibleDestinations.length ? 0 : selectedIndex,
          onDestinationSelected: onDestinationSelected, 
          labelType: NavigationRailLabelType.all,
          destinations: visibleDestinations.map((e) => e.destination).toList(),
        );
      },
    );
  }
}

class _SidebarItem {
  final NavigationRailDestination destination;
  final bool isVisible;

  _SidebarItem({required this.destination, required this.isVisible});
}
