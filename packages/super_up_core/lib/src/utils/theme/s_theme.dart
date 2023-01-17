import 'package:flutter/material.dart';

import '../../../super_up_core.dart';

final lightTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  primaryColor: AppColors.primaryColor,
  scaffoldBackgroundColor: AppColors.scaffoldBackground,
  colorScheme: const ColorScheme.light(
    onSecondary: AppColors.accentColor,
    primary: AppColors.accentColor,
    brightness: Brightness.light,
  ),
  appBarTheme: const AppBarTheme(
    elevation: 1,
  ),
  textTheme: const TextTheme(
    bodyText1: TextStyle(
      fontSize: 16,
    ),
  ),
);

final darkTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.dark,
);
