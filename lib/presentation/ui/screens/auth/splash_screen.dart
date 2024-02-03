import 'package:crafty_bay_ruhulaminjr/presentation/state/auth_controller.dart';
import 'package:crafty_bay_ruhulaminjr/presentation/ui/utilities/app_logo.dart';
import 'package:crafty_bay_ruhulaminjr/presentation/ui/widget/bottom_navigation_bar_home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void go() {
    Future.delayed(
      const Duration(seconds: 1),
      () async {
        await Get.find<AuthController>().initilize();
        Get.offAll(() => const BottomNavBarHome());
      },
    );
  }

  @override
  void initState() {
    super.initState();
    go();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          children: [
            Spacer(),
            AppLogo(),
            Spacer(),
            CircularProgressIndicator(),
            SizedBox(
              height: 20,
            ),
            Text('Version 1.0'),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
