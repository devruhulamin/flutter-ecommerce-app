import 'package:crafty_bay_ruhulaminjr/presentation/ui/screens/components/home/app_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: homeAppBar(),
    );
  }
}
