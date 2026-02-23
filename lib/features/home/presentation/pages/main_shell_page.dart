import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:savvy_pos/core/config/theme_config.dart';
import 'package:savvy_pos/core/presentation/bloc/theme_cubit.dart';
import 'package:savvy_pos/features/customers/presentation/bloc/customer_bloc.dart';
import 'package:savvy_pos/features/dashboard/presentation/pages/dashboard_page.dart';
import 'package:savvy_pos/features/history/presentation/pages/transaction_history_page.dart';
import 'package:savvy_pos/features/inventory/presentation/pages/inventory_dashboard_page.dart';
import 'package:savvy_pos/features/pos/presentation/pages/pos_page.dart';
import 'package:savvy_pos/features/settings/presentation/pages/settings_page.dart';
import 'package:savvy_pos/features/shifts/presentation/bloc/shift_bloc.dart';
import 'package:savvy_pos/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:savvy_pos/features/auth/presentation/widgets/pin_pad_dialog.dart';
import 'package:savvy_pos/features/tables/presentation/bloc/table_bloc.dart';
import 'package:savvy_pos/features/reservations/presentation/bloc/reservation_bloc.dart';
import 'package:savvy_pos/features/marketing/presentation/pages/marketing_dashboard_page.dart';
import 'package:savvy_pos/features/delivery/presentation/pages/delivery_dashboard_page.dart';
import 'package:savvy_pos/features/analytics/presentation/pages/analytics_dashboard_page.dart';
import 'package:savvy_pos/features/shifts/presentation/pages/time_clock_page.dart';
import 'package:savvy_pos/features/loyalty/presentation/pages/loyalty_dashboard_page.dart';
import 'package:savvy_pos/features/customers/presentation/pages/customer_crm_page.dart';
import 'package:savvy_pos/core/presentation/widgets/network_status_banner.dart';
import 'package:savvy_pos/features/pos/presentation/bloc/cart/cart_bloc.dart';
import 'package:savvy_pos/features/home/presentation/widgets/inactivity_tracker_widget.dart';

class MainShellPage extends StatefulWidget {
  const MainShellPage({super.key});

  @override
  State<MainShellPage> createState() => _MainShellPageState();
}

class _MainShellPageState extends State<MainShellPage> {
  int _selectedIndex = 1; // Default to POS

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (_) =>
                GetIt.I<ShiftBloc>()..add(const ShiftEvent.checkStatus())),
        BlocProvider(create: (_) => GetIt.I<CartBloc>()),
        BlocProvider(create: (_) => GetIt.I<CustomerBloc>()),
        BlocProvider(create: (_) => GetIt.I<AuthBloc>()),
        BlocProvider(
            create: (_) =>
                GetIt.I<TableBloc>()..add(const TableEvent.loadTables())),
        BlocProvider(
            create: (_) => GetIt.I<ReservationBloc>()
              ..add(const ReservationEvent.loadReservations())),
        // ThemeCubit: already registered in GetIt by main(), just expose to subtree
        BlocProvider.value(value: GetIt.I<ThemeCubit>()),
      ],
      child: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state.error != null) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(state.error!), backgroundColor: Colors.red));
          }
          if (state.employee != null) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(
                    'Active: ${state.employee!.name} (${state.employee!.role})')));
          }
        },
        child: InactivityTrackerWidget(
          child: _MainShellContent(
            initialIndex: _selectedIndex,
            onTap: (index) => setState(() => _selectedIndex = index),
          ),
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

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex;
  }

  @override
  void didUpdateWidget(covariant _MainShellContent oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.initialIndex != oldWidget.initialIndex) {
      _selectedIndex = widget.initialIndex;
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.savvy.colors;
    // TODO: Implement F&B mode toggle from settings when needed

    final pages = [
      const DashboardPage(),
      const PosPage(), // For F&B mode, switch to FloorPlanPage()
      const InventoryDashboardPage(),
      const TransactionHistoryPage(),
      const MarketingDashboardPage(),
      const DeliveryDashboardPage(),
      const AnalyticsDashboardPage(),
      const TimeClockPage(),
      const LoyaltyDashboardPage(),
      const CustomerCrmPage(), // Guest Management
      const SettingsPage(),
    ];

    final destinations = [
      const NavigationRailDestination(
          icon: Icon(Icons.dashboard), label: Text('Dashboard')),
      const NavigationRailDestination(
          icon: Icon(Icons.point_of_sale), label: Text('POS')),
      const NavigationRailDestination(
          icon: Icon(Icons.inventory),
          label: Text('Inventory')), // Changed icon and label
      const NavigationRailDestination(
          icon: Icon(Icons.history), label: Text('History')),
      const NavigationRailDestination(
          icon: Icon(Icons.campaign), label: Text('Marketing')),
      const NavigationRailDestination(
          icon: Icon(Icons.two_wheeler), label: Text('Delivery')),
      const NavigationRailDestination(
          icon: Icon(Icons.analytics), label: Text('Analytics')),
      const NavigationRailDestination(
          icon: Icon(Icons.access_time), label: Text('Time Clock')),
      const NavigationRailDestination(
          icon: Icon(Icons.card_giftcard), label: Text('Loyalty')),
      const NavigationRailDestination(
          icon: Icon(Icons.people_alt), label: Text('Guests')),
      const NavigationRailDestination(
          icon: Icon(Icons.settings), label: Text('Settings')),
    ];

    final bottomItems = [
      const BottomNavigationBarItem(
          icon: Icon(Icons.dashboard), label: 'Dashboard'),
      const BottomNavigationBarItem(
          icon: Icon(Icons.point_of_sale), label: 'POS'),
      const BottomNavigationBarItem(
          icon: Icon(Icons.inventory), label: 'Inventory'), // Changed
      const BottomNavigationBarItem(
          icon: Icon(Icons.history), label: 'History'),
      const BottomNavigationBarItem(
          icon: Icon(Icons.campaign), label: 'Marketing'),
      const BottomNavigationBarItem(
          icon: Icon(Icons.two_wheeler), label: 'Delivery'),
      const BottomNavigationBarItem(
          icon: Icon(Icons.analytics), label: 'Analytics'),
      const BottomNavigationBarItem(
          icon: Icon(Icons.access_time), label: 'Time Clock'),
      const BottomNavigationBarItem(
          icon: Icon(Icons.card_giftcard), label: 'Loyalty'),
      const BottomNavigationBarItem(
          icon: Icon(Icons.people_alt), label: 'Guests'),
      const BottomNavigationBarItem(
          icon: Icon(Icons.settings), label: 'Settings'),
    ];

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      behavior: HitTestBehavior.translucent,
      child: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 900) {
          // Desktop / Tablet
          return Scaffold(
            body: Stack(
              children: [
                Row(
                  children: [
                    NavigationRail(
                      selectedIndex: _selectedIndex,
                      onDestinationSelected: (index) async {
                        // RBAC Check: Protected Routes (Owner/Manager Only)
                        // 2:Products, 4:Marketing, 5:Delivery, 6:Analytics, 7:Settings
                        if ([2, 4, 5, 6, 7].contains(index)) {
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
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: Column(
                          children: [
                            Icon(Icons.storefront,
                                color: colors.brandPrimary, size: 32),
                            const SizedBox(height: 12),
                            // Quick Light/Dark toggle
                            const ThemeToggleButton(compact: false),
                          ],
                        ),
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
                // Stacked Floating Banner Overlay
                const Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: IgnorePointer(child: NetworkStatusBanner()),
                ),
              ],
            ),
          );
        } else {
          // Mobile
          return Scaffold(
            body: Stack(
              children: [
                IndexedStack(
                  index: _selectedIndex,
                  children: pages,
                ),
                const Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: IgnorePointer(child: NetworkStatusBanner()),
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
    ),
    );
  }
}
