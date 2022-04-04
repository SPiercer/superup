import 'package:flutter/material.dart';
import 'package:superup/app/core/constants/colors.dart';

final lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: AppColors.primaryColor,
  colorScheme: const ColorScheme.light(
    onSecondary: AppColors.accentColor,
    primary: AppColors.accentColor,
    brightness: Brightness.light,
  ),
  appBarTheme: const AppBarTheme(elevation: 1),
);
final darkTheme = ThemeData(
  brightness: Brightness.dark,
);
