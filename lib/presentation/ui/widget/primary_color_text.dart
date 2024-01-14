import 'package:crafty_bay_ruhulaminjr/presentation/ui/utilities/app_colors.dart';
import 'package:flutter/material.dart';

class PrimaryColorText extends StatelessWidget {
  final String text;
  final double size;
  const PrimaryColorText({super.key, required this.text, this.size = 14});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size,
        color: AppColors.primaryColor,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
