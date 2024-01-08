import 'package:crafty_bay_ruhulaminjr/presentation/ui/theme/elevated_button_theme.dart';
import 'package:crafty_bay_ruhulaminjr/presentation/ui/theme/input_theme.dart';
import 'package:crafty_bay_ruhulaminjr/presentation/ui/theme/text_button_theme.dart';
import 'package:crafty_bay_ruhulaminjr/presentation/ui/utilities/app_colors.dart';
import 'package:flutter/material.dart';

@immutable
class AppThemeData {
  static final appThemeData = ThemeData(
    primaryColor: AppColors.primaryColor,
    primarySwatch: MaterialColor(
      32,
      AppColors.colorSwatch,
    ),
    progressIndicatorTheme:
        const ProgressIndicatorThemeData(color: AppColors.primaryColor),
    inputDecorationTheme: getDefaultInputTheme(),
    textTheme: const TextTheme(
        titleLarge: TextStyle(
      fontSize: 40,
      fontWeight: FontWeight.bold,
    )),
    elevatedButtonTheme: getElevatedButtonTheme(),
    textButtonTheme: getTextButtonThemeData,
  );
}
