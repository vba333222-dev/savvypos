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

class MainShellPage extends StatefulWidget {
  const MainShellPage({Key? key}) : super(key: key);

  @override
  State<MainShellPage> createState() => _MainShellPageState();
}

class _MainShellPageState extends State<MainShellPage> {
  int _selectedIndex = 1; // Default to POS

  // Pages
  // Using IndexedStack to keep POS state alive.
  // Note: We need to wrap pages that need specific blocs if not global.
  // Currently PosPage already wraps itself in MultiBlocProviderproviders.
  // DashboardPage wraps itself.
  // History wraps itself.
  // Settings relies on passed Bloc or needs provider. Settings relies on ShiftBloc.
  
  // To allow correct access to ShiftBloc across Navigation, we should provide it globally here or in MainShell.
  // PosPage creates ShiftBloc locally. This is problematic if we want to share state strictly.
  // BUT PosPage uses GetIt.I<ShiftBloc> in create.
  // If we move ShiftBloc higher up, we access the same singleton instance if registered as LazySingleton.
  // Let's assume ShiftBloc is registered as Factory or Singleton?
  // It is @injectable, so Factory by default unless @singleton.
  // CHECK: shift_bloc.dart used @injectable.
  // Wait, if it's factory, creating it multiple times means different states.
  // We MUST register ShiftBloc as Singleton or provide it here once.
  // For safety, let's provide ShiftBloc here to the whole shell.
  
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => GetIt.I<ShiftBloc>()..add(const ShiftEvent.checkStatus())),
        BlocProvider(create: (_) => GetIt.I<CartBloc>()),
        BlocProvider(create: (_) => GetIt.I<CustomerBloc>()),
        BlocProvider(create: (_) => GetIt.I<AuthBloc>()),
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
    
    // Pass the provided ShiftBloc down to pages that might look for it via context.read
    // PosPage creates its own provider, we might need to refactor PosPage to NOT create it if it exists,
    // Or simpler: PosPage's provider overrides parent. But we want shared state.
    // Ideally PosPage should use BlocProvider.value if it exists, or we refactor PosPage to just consume.
    // For "Pragmatic Execution", let's assume PosPage creates a NEW Bloc unless we fix it.
    // FIX: We should make ShiftBloc a singleton in DI or lift it up.
    // Assuming for now we lift it up in MainShell, and PosPage logic is "If we want shared state, we must use singleton".
    // I will check injection. If factory, checking status in shell vs pos yields different results.
    // I will explicitly Register ShiftBloc as LazySingleton in next step or use existing behaviour
    
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 900) {
          // Desktop / Tablet
          return Scaffold(
             body: Row(
               children: [
                 NavigationRail(
                   selectedIndex: _selectedIndex,
                   onDestinationSelected: (index) async {
                      // RBAC: Settings (4) and Products (2)
                      if (index == 4 || index == 2) {
                        final authBloc = context.read<AuthBloc>();
                        final user = authBloc.state.employee; // Updated field
                        
                        // Check if user is null or not authorized (CASHIER restricted)
                        if (user == null || user.role == 'CASHIER') {
                          final pin = await showDialog<String>(
                            context: context,
                            builder: (_) => const PinPadDialog(isLogin: true), // Force Login/Override
                          );
                          
                          if (pin != null && context.mounted) {
                            // Try to login as someone else (Manager/Owner)
                            authBloc.add(AuthEvent.loginWithPin(pin));
                            // In a real app, we might handle "Override" differently than full login switch.
                            // Here, we switch user.
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
                   destinations: const [
                     NavigationRailDestination(icon: Icon(Icons.dashboard), label: Text('Dashboard')),
                     NavigationRailDestination(icon: Icon(Icons.point_of_sale), label: Text('POS')),
                     NavigationRailDestination(icon: Icon(Icons.inventory_2), label: Text('Products')), // Added
                     NavigationRailDestination(icon: Icon(Icons.history), label: Text('History')),
                     NavigationRailDestination(icon: Icon(Icons.settings), label: Text('Settings')),
                   ],
                 ),
                 const VerticalDivider(thickness: 1, width: 1),
                 Expanded(
                   child: IndexedStack(
                     index: _selectedIndex,
                     children: _pages,
                   ),
                 ),
               ],
             ),
          );
        } else {
          // Mobile
          return Scaffold(
            body: IndexedStack(
              index: _selectedIndex,
              children: _pages,
            ),
            bottomNavigationBar: BottomNavigationBar(
               currentIndex: _selectedIndex,
               onTap: (index) {
                  setState(() => _selectedIndex = index);
                  widget.onTap(index);
               },
               type: BottomNavigationBarType.fixed,
               items: const [
                 BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: 'Dashboard'),
                 BottomNavigationBarItem(icon: Icon(Icons.point_of_sale), label: 'POS'),
                 BottomNavigationBarItem(icon: Icon(Icons.inventory_2), label: 'Products'), // Added
                 BottomNavigationBarItem(icon: Icon(Icons.history), label: 'History'),
                 BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
               ],
            ),
          );
        }
      },
    );
  }
}
