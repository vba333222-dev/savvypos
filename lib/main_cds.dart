import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:savvy_pos/core/config/theme/savvy_theme.dart';
import 'package:savvy_pos/core/services/socket_service.dart';
import 'package:savvy_pos/bootstrap.dart';
import 'package:savvy_pos/core/config/app_config.dart';
import 'package:savvy_pos/features/cds/presentation/bloc/cds_bloc.dart';
import 'package:savvy_pos/features/cds/presentation/pages/customer_display_page.dart';

void main() {
  bootstrap(AppConfig(
    appName: 'Savvy CDS',
    flavor: Flavor.prod,
    apiBaseUrl: 'https://api.savvypos.com',
    userApp: () => const CdsApp(),
  ));
}

class CdsApp extends StatelessWidget {
  const CdsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Savvy CDS',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          extensions: [SavvyTheme.dark()]), // Darker theme for elegance
      home: BlocProvider(
        create: (context) => CdsBloc(GetIt.I<SocketService>()),
        child: const CustomerDisplayPage(),
      ),
    );
  }
}
