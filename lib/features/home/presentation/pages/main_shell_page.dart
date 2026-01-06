import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:savvy_pos/core/config/theme_config.dart';
import 'package:savvy_pos/features/auth/domain/repositories/i_tenant_repository.dart';
import 'package:savvy_pos/features/customers/presentation/bloc/customer_bloc.dart';
import 'package:savvy_pos/features/dashboard/presentation/pages/dashboard_page.dart';
import 'package:savvy_pos/features/history/presentation/pages/transaction_history_page.dart';
import 'package:savvy_pos/features/inventory/presentation/pages/inventory_list_page.dart';
import 'package:savvy_pos/features/pos/presentation/pages/pos_page.dart';
import 'package:savvy_pos/features/settings/presentation/pages/settings_page.dart';
import 'package:savvy_pos/features/shift/presentation/bloc/shift_bloc.dart';
import 'package:savvy_pos/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:savvy_pos/features/auth/presentation/widgets/pin_pad_dialog.dart';
import 'package:savvy_pos/features/tables/presentation/bloc/table_bloc.dart';
import 'package:savvy_pos/features/tables/presentation/pages/floor_plan_page.dart';
import 'package:savvy_pos/features/reservations/presentation/bloc/reservation_bloc.dart';
import 'package:savvy_pos/core/presentation/widgets/network_status_banner.dart';

class MainShellPage extends StatefulWidget {
  const MainShellPage({Key? key}) : super(key: key);

  @override
  State<MainShellPage> createState() => _MainShellPageState();
}

class _MainShellPageState extends State<MainShellPage> {
  int _selectedIndex = 1; // Default to POS

  @override
  Widget build(BuildContext context) {

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => GetIt.I<ShiftBloc>()..add(const ShiftEvent.checkStatus())),
        BlocProvider(create: (_) => GetIt.I<CartBloc>()),
        BlocProvider(create: (_) => GetIt.I<CustomerBloc>()),
        BlocProvider(create: (_) => GetIt.I<AuthBloc>()),
        BlocProvider(create: (_) => GetIt.I<TableBloc>()..add(const TableEvent.loadTables())),
        BlocProvider(create: (_) => GetIt.I<ReservationBloc>()..add(const ReservationEvent.loadReservations())),
      ],
      child: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state.error != null) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.error!), backgroundColor: Colors.red));
          }
          if (state.employee != null) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Active: ${state.employee!.name} (${state.employee!.role})')));
          }
        },
        child: _MainShellContent(
          initialIndex: _selectedIndex,
          onTap: (index) => setState(() => _selectedIndex = index),
        ),
      ),
    );
  }
}

class _MainShellContent extends StatefulWidget {
  final int initialIndex;
  final Function(int) onTap;

  const _MainShellContent({required this.initialIndex, required this.onTap});

  @override
  State<_MainShellContent> createState() => _MainShellContentState();
}

class _MainShellContentState extends State<_MainShellContent> {
  late int _selectedIndex;
  String _tenantName = 'Savvy POS';

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex;
    _loadTenantName();
  }
  
  @override
  void didUpdateWidget(covariant _MainShellContent oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.initialIndex != oldWidget.initialIndex) {
      _selectedIndex = widget.initialIndex;
    }
  }

  Future<void> _loadTenantName() async {
    final config = await GetIt.I<ITenantRepository>().getConfig();
    if (config != null && mounted) {
      setState(() {
        _tenantName = config.outletName;
      });
    }
  }

  final List<Widget> _pages = const [
    DashboardPage(),
    PosPage(), 
    InventoryListPage(), // Added
    TransactionHistoryPage(),
    SettingsPage(), 
  ];

  @override
  Widget build(BuildContext context) {
    final colors = context.savvy.colors;

    return ValueListenableBuilder<bool>(
      valueListenable: businessModeNotifier,
      builder: (context, isFoodBev, child) {
         final pages = [
            const DashboardPage(),
            isFoodBev 
              ? FloorPlanPage(onNavigateToPos: (index) {
                  // Hacky navigation to POS (which is not in tab list directly? Wait.
                  // If F&B, Tab 1 is FloorPlan. POS is hidden or accessible via FloorPlan?
                  // Requirement: "Middle tab changes from POS to Tables. Clicking a table navigates to POS".
                  // So POS must be accessible.
                  // Let's make POS valid route pushed on top or swap tab?
                  // If swap tab, we need POS in the list?
                  // Maybe Tab 1 is Tables, but where is POS? 
                  // "Clicking a table then navigates to POS".
                  // Keep POS as a hidden tab or push standard route?
                  // Pushing standard route is cleaner for "Check In".
                  Navigator.push(context, MaterialPageRoute(builder: (_) => const PosPage()));
                })
              : const PosPage(),
            const InventoryListPage(),
            const TransactionHistoryPage(),
            const SettingsPage(),
         ];

         final destinations = [
             const NavigationRailDestination(icon: Icon(Icons.dashboard), label: Text('Dashboard')),
             NavigationRailDestination(icon: Icon(isFoodBev ? Icons.table_restaurant : Icons.point_of_sale), label: Text(isFoodBev ? 'Tables' : 'POS')),
             const NavigationRailDestination(icon: Icon(Icons.inventory_2), label: Text('Products')),
             const NavigationRailDestination(icon: Icon(Icons.history), label: Text('History')),
             const NavigationRailDestination(icon: Icon(Icons.settings), label: Text('Settings')),
         ];
         
         final bottomItems = [
             const BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: 'Dashboard'),
             BottomNavigationBarItem(icon: Icon(isFoodBev ? Icons.table_restaurant : Icons.point_of_sale), label: isFoodBev ? 'Tables' : 'POS'),
             const BottomNavigationBarItem(icon: Icon(Icons.inventory_2), label: 'Products'),
             const BottomNavigationBarItem(icon: Icon(Icons.history), label: 'History'),
             const BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
         ];

         return LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth > 900) {
              // Desktop / Tablet
              return Scaffold(
                 body: Column(
                   children: [
                     const NetworkStatusBanner(),
                     Expanded(
                       child: Row(
                         children: [
                           NavigationRail(
                             selectedIndex: _selectedIndex,
                             onDestinationSelected: (index) async {
                                // RBAC Check (Same as before)
                                if (index == 4 || index == 2) {
                                  final authBloc = context.read<AuthBloc>();
                                  final user = authBloc.state.employee;
                                  if (user == null || user.role == 'CASHIER') {
                                    final pin = await showDialog<String>(
                                      context: context,
                                      builder: (_) => const PinPadDialog(isLogin: true),
                                    );
                                    if (pin != null && context.mounted) {
                                      authBloc.add(AuthEvent.loginWithPin(pin));
                                    }
                                    return; 
                                  }
                                }
                                setState(() => _selectedIndex = index);
                                widget.onTap(index);
                             },
                             labelType: NavigationRailLabelType.all,
                             leading: Padding(
                               padding: const EdgeInsets.symmetric(vertical: 24.0),
                               child: Icon(Icons.storefront, color: colors.brandPrimary, size: 32),
                             ),
                             destinations: destinations,
                           ),
                           const VerticalDivider(thickness: 1, width: 1),
                           Expanded(
                             child: IndexedStack(
                               index: _selectedIndex,
                               children: pages,
                             ),
                           ),
                         ],
                       ),
                     ),
                   ],
                 ),
              );
            } else {
              // Mobile
              return Scaffold(
                body: Column(
                  children: [
                    const NetworkStatusBanner(),
                    Expanded(
                      child: IndexedStack(
                        index: _selectedIndex,
                        children: pages,
                      ),
                    ),
                  ],
                ),
                bottomNavigationBar: BottomNavigationBar(
                   currentIndex: _selectedIndex,
                   onTap: (index) {
                      setState(() => _selectedIndex = index);
                      widget.onTap(index);
                   },
                   type: BottomNavigationBarType.fixed,
                   items: bottomItems,
                ),
              );
            }
          },
        );
      },
    );
  }
}
