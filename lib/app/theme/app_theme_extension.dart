import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppThemeExtension extends ThemeExtension<AppThemeExtension> {
  const AppThemeExtension({
    required this.success,
    required this.accent,
    required this.onAccent,
    required this.surfaceVariant,
    required this.onSurfaceVariant,
    required this.focus,
    this.surfaceInverse,
    this.textOnSurfaceInverse,
  });

  final Color success;
  final Color accent;
  final Color onAccent;

  final Color surfaceVariant;

  final Color onSurfaceVariant;

  final Color focus;
  final Color? surfaceInverse;
  final Color? textOnSurfaceInverse;

  static const light = AppThemeExtension(
    success: AppColors.success,
    accent: AppColors.accentBlue,
    onAccent: AppColors.onAccent,
    surfaceVariant: AppColors.surfaceLight,
    onSurfaceVariant: AppColors.textSecondaryLight,
    focus: AppColors.focusLight,
    surfaceInverse: AppColors.surfaceInverse,
    textOnSurfaceInverse: AppColors.textOnSurfaceInverse,
  );

  static const dark = AppThemeExtension(
    success: AppColors.success,
    accent: AppColors.accentBlue,
    onAccent: AppColors.onAccent,
    surfaceVariant: AppColors.surfaceDark,
    onSurfaceVariant: AppColors.textSecondaryDark,
    focus: AppColors.focusDark,
    surfaceInverse: AppColors.surfaceInverse,
    textOnSurfaceInverse: AppColors.textOnSurfaceInverse,
  );

  @override
  ThemeExtension<AppThemeExtension> copyWith({
    Color? success,
    Color? accent,
    Color? onAccent,
    Color? surfaceVariant,
    Color? onSurfaceVariant,
    Color? focus,
    Color? surfaceInverse,
    Color? textOnSurfaceInverse,
  }) {
    return AppThemeExtension(
      success: success ?? this.success,
      accent: accent ?? this.accent,
      onAccent: onAccent ?? this.onAccent,
      surfaceVariant: surfaceVariant ?? this.surfaceVariant,
      onSurfaceVariant: onSurfaceVariant ?? this.onSurfaceVariant,
      focus: focus ?? this.focus,
      surfaceInverse: surfaceInverse ?? this.surfaceInverse,
      textOnSurfaceInverse: textOnSurfaceInverse ?? this.textOnSurfaceInverse,
    );
  }

  @override
  ThemeExtension<AppThemeExtension> lerp(
    covariant ThemeExtension<AppThemeExtension>? other,
    double t,
  ) {
    if (other is! AppThemeExtension) return this;
    return AppThemeExtension(
      success: Color.lerp(success, other.success, t)!,
      accent: Color.lerp(accent, other.accent, t)!,
      onAccent: Color.lerp(onAccent, other.onAccent, t)!,
      surfaceVariant: Color.lerp(surfaceVariant, other.surfaceVariant, t)!,
      onSurfaceVariant: Color.lerp(
        onSurfaceVariant,
        other.onSurfaceVariant,
        t,
      )!,
      focus: Color.lerp(focus, other.focus, t)!,
      surfaceInverse: Color.lerp(surfaceInverse, other.surfaceInverse, t),
      textOnSurfaceInverse: Color.lerp(
        textOnSurfaceInverse,
        other.textOnSurfaceInverse,
        t,
      ),
    );
  }
}
