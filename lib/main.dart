import 'package:flutter/material.dart';

import 'core/config/app_theme.dart';
import 'core/services/navigation.dart';

void main() {
  runApp(const FruitHub());
}

class FruitHub extends StatelessWidget {
  const FruitHub({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      routerConfig: Navigation.getRouter,
    );
  }
}
