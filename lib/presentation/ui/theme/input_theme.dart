import 'package:crafty_bay_ruhulaminjr/presentation/ui/utilities/app_colors.dart';
import 'package:flutter/material.dart';

InputDecorationTheme getDefaultInputTheme() {
  return const InputDecorationTheme(
      contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      outlineBorder: BorderSide(color: AppColors.primaryColor),
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.primaryColor)),
      errorBorder:
          OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))));
}
