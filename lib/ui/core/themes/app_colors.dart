import 'package:flutter/material.dart';

abstract final class AppColors {
  static const success = Color(0xFF0C9409);
  static const warning = Color(0xFFED1010);
  static const info = Color(0xFF3B82F6);
  static const black1 = Color(0xFF101010);
  static const black2 = Color(0xFF333333);
  static const grey1 = Color(0xFF4D4D4D);
  static const grey2 = Color(0xFF666666);
  static const grey3 = Color(0xFF808080);
  static const grey4 = Color(0xFF999999);
  static const grey5 = Color(0xFFB3B3B3);

  static const white1 = Color(0xFFCCCCCC);
  static const white2 = Color(0xFFE6E6E6);
  static const white = Color(0xFFFFFFFF);
  static const whiteTransparent = Color(
    0x4DFFFFFF,
  ); // Figma rgba(255, 255, 255, 0.3)
  static const blackTransparent = Color(0x4D000000);

  static const lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: AppColors.black1,
    onPrimary: AppColors.white1,
    secondary: AppColors.black1,
    onSecondary: AppColors.white1,
    surface: Colors.white,
    onSurface: AppColors.black1,
    error: Colors.white,
    onError: AppColors.warning,
  );

  static const darkColorScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: AppColors.white1,
    onPrimary: AppColors.black1,
    secondary: AppColors.white1,
    onSecondary: AppColors.black1,
    surface: AppColors.black1,
    onSurface: Colors.white,
    error: Colors.black,
    onError: AppColors.warning,
  );
}
