import 'package:flutter/material.dart';
import 'package:savvy_pos/bootstrap.dart';
import 'package:savvy_pos/core/config/theme_config.dart';
import 'package:savvy_pos/features/pos/presentation/pages/pos_page.dart';

void main() {
  bootstrap(() => const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Savvy POS',
      theme: ThemeData(
        extensions: [
          SavvyTheme.light(),
        ],
      ),
      darkTheme: ThemeData(
        extensions: [
          SavvyTheme.dark(),
        ],
      ),
      home: const PosPage(),
    );
  }
}
