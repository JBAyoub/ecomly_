import 'package:ecomly_frontend/ui/core/themes/app_colors.dart';
import 'package:flutter/material.dart';

abstract final class AppTheme {
  static const TextTheme textTheme = TextTheme(
    displayLarge: TextStyle(
      fontSize: 64,
      height: 1.25,
      fontWeight: FontWeight.w600,
    ),
    headlineLarge: TextStyle(
      fontSize: 32,
      height: 1.0,
      fontWeight: FontWeight.w600,
    ),
    headlineMedium: TextStyle(
      fontSize: 24,
      height: 1.2,
      fontWeight: FontWeight.w600,
    ),
    headlineSmall: TextStyle(
      fontSize: 20,
      height: 1.2,
      fontWeight: FontWeight.w600,
    ),

    // B1
    bodyLarge: TextStyle(
      fontSize: 16,
      height: 1.4,
      fontWeight: FontWeight.w400,
    ),

    // B2
    bodyMedium: TextStyle(
      fontSize: 14,
      height: 1.4,
      fontWeight: FontWeight.w400,
    ),

    // B3
    bodySmall: TextStyle(
      fontSize: 12,
      height: 1.4,
      fontWeight: FontWeight.w400,
    ),

    // Medium / SemiBold variants can use the remaining slots
    titleLarge: TextStyle(
      fontSize: 20,
      height: 1.2,
      fontWeight: FontWeight.w500,
    ),
    titleMedium: TextStyle(
      fontSize: 16,
      height: 1.4,
      fontWeight: FontWeight.w500,
    ),
    titleSmall: TextStyle(
      fontSize: 14,
      height: 1.4,
      fontWeight: FontWeight.w500,
    ),

    labelLarge: TextStyle(
      fontSize: 16,
      height: 1.4,
      fontWeight: FontWeight.w600,
    ),
    labelMedium: TextStyle(
      fontSize: 14,
      height: 1.4,
      fontWeight: FontWeight.w600,
    ),
    labelSmall: TextStyle(
      fontSize: 12,
      height: 1.4,
      fontWeight: FontWeight.w600,
      color: AppColors.grey3,
    ),
  );

  static const InputDecorationTheme inputDecorationTheme = InputDecorationTheme(
    hintStyle: TextStyle(
      color: AppColors.grey3,
      fontSize: 18,
      fontWeight: FontWeight.w400,
    ),
  );

  static final ThemeData lightTheme = ThemeData(
    fontFamily: 'GeneralSans',
    brightness: Brightness.light,
    colorScheme: AppColors.lightColorScheme,
    textTheme: textTheme,
    inputDecorationTheme: inputDecorationTheme,
  );

  static final ThemeData darkTheme = ThemeData(
    fontFamily: 'GeneralSans',
    brightness: Brightness.dark,
    colorScheme: AppColors.darkColorScheme,
    textTheme: textTheme,
    inputDecorationTheme: inputDecorationTheme,
  );
}
