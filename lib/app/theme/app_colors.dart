import 'package:flutter/material.dart';

abstract class AppColors {
  AppColors._();

  // --- Light mode ---
  static const Color backgroundLight = Color(0xFFFFFFFF);
  static const Color surfaceLight = Color(0xFFF2F2F2);
  static const Color textPrimaryLight = Color(0xFF000000);
  static const Color textSecondaryLight = Color(0xFF616161);

  // --- Dark mode ---
  static const Color backgroundDark = Color(0xFF000000);
  static const Color surfaceDark = Color(0xFF2C2C2E);
  static const Color textPrimaryDark = Color(0xFFFFFFFF);
  static const Color textSecondaryDark = Color(0xFFB0B0B0);

  static const Color focusLight = Color(0xFF007AFF);
  static const Color focusDark = Color(0xFF0A84FF);

  static const Color primary = Color(0xFF000000);
  static const Color primaryLightVariant = Color(0xFF212121);
  static const Color error = Color(0xFFDC2626);

  static const Color success = Color(0xFF059669);

  static const Color onPrimary = Color(0xFFFFFFFF);
  static const Color transparent = Color(0x00000000);

  static const Color background = backgroundLight;
  static const Color surface = surfaceLight;
  static const Color textPrimary = textPrimaryLight;
  static const Color textSecondary = textSecondaryLight;

  static const Color accentBlue = Color(0xFF2563EB);
  static const Color accentBlueDark = Color(0xFF1D4ED8);
  static const Color onAccent = Color(0xFFFFFFFF);
  static const Color surfaceInverse = Color(0xFFFFFFFF);

  static const Color textOnSurfaceInverse = Color(0xFF424242);
}
