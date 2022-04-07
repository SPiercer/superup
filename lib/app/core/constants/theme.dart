import 'package:flutter/material.dart';
import 'package:superup/app/core/constants/colors.dart';

final lightTheme = ThemeData(
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
    )));
final darkTheme = ThemeData(
  brightness: Brightness.dark,
);
