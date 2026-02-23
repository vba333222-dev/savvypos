import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:savvy_pos/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:savvy_pos/features/auth/presentation/pages/force_update_page.dart';
import 'package:savvy_pos/features/home/presentation/pages/entry_page.dart';
import 'package:savvy_pos/features/inventory/presentation/pages/product_list_page.dart';

class _GoRouterRefreshStream extends ChangeNotifier {
  _GoRouterRefreshStream(Stream<dynamic> stream) {
    notifyListeners();
    _subscription = stream.asBroadcastStream().listen(
      (dynamic _) => notifyListeners(),
    );
  }

  late final StreamSubscription<dynamic> _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}

class AppRouter {
  static final router = GoRouter(
    initialLocation: '/',
    refreshListenable: _GoRouterRefreshStream(GetIt.I<AuthBloc>().stream),
    redirect: (context, state) {
      final authBloc = GetIt.I<AuthBloc>();
      final isOutdated = authBloc.state.isOutdated;

      if (isOutdated && state.matchedLocation != '/force-update') {
        return '/force-update';
      }

      return null;
    },
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const EntryPage(),
      ),
      GoRoute(
        path: '/product-list',
        builder: (context, state) => const ProductListPage(),
      ),
      GoRoute(
        path: '/force-update',
        builder: (context, state) => const ForceUpdatePage(),
      ),
    ],
  );
}
