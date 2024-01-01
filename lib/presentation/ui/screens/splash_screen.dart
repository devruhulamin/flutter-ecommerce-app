import 'package:crafty_bay_ruhulaminjr/presentation/ui/screens/register/enter_email_scree.dart';
import 'package:crafty_bay_ruhulaminjr/presentation/ui/utilities/app_logo.dart';
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
      const Duration(seconds: 3),
      () {
        Get.offAll(const EnterYourEmailScreen());
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
