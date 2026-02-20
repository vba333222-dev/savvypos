import 'package:go_router/go_router.dart';
import 'package:savvy_pos/features/home/presentation/pages/entry_page.dart';
import 'package:savvy_pos/features/inventory/presentation/pages/product_list_page.dart';
// import 'package:savvy_pos/features/diagnostics/presentation/pages/design_system_page.dart';

class AppRouter {
  static final router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const EntryPage(),
      ),
      GoRoute(
        path: '/product-list',
        builder: (context, state) => const ProductListPage(),
      ),
      // GoRoute(
      //   path: '/design-system',
      //   builder: (context, state) => const DesignSystemPage(),
      // ),
    ],
  );
}
