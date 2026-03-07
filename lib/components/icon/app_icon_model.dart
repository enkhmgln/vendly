import 'package:flutter/material.dart';

enum AppIconType { svg, asset }

class AppIconModel {
  const AppIconModel({
    required this.type,
    required this.icon,
    this.color,
    this.width,
    this.height,
  });

  final AppIconType type;
  final String icon;
  final Color? color;
  final double? width;
  final double? height;
}
