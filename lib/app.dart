import 'package:crafty_bay_ruhulaminjr/presentation/ui/screens/auth/splash_screen.dart';
import 'package:crafty_bay_ruhulaminjr/presentation/ui/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: AppThemeData.appThemeData,
      home: const SplashScreen(),
    );
  }
}
