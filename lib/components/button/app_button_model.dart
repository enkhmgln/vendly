import 'package:flutter/material.dart';

enum AppButtonType {
  primary,
  surface,
  outline,
  text,
  accentPrimary,
  glass,
}

enum AppButtonSize {
  large(height: 56, iconSize: 24, fontSize: 17),
  medium(height: 48, iconSize: 24, fontSize: 16),
  small(height: 40, iconSize: 20, fontSize: 14);

  final double height;
  final double iconSize;
  final double fontSize;

  const AppButtonSize({
    required this.height,
    required this.iconSize,
    required this.fontSize,
  });
}

class AppButtonModel {
  AppButtonModel({
    required this.label,
    required this.type,
    required this.size,
    this.isLoading = false,
    this.isEnabled = true,
    this.isExpanded = true,
    this.borderRadius = 28,
    this.prefixIcon,
    this.suffixIcon,
    this.prefixWidget,
  });

  final String label;
  final AppButtonType type;
  final AppButtonSize size;
  bool isLoading;
  bool isEnabled;
  final bool isExpanded;
  final double borderRadius;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final Widget? prefixWidget;
}
