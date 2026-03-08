import 'package:flutter/material.dart';

class AppTabBarItemModel {
  const AppTabBarItemModel({
    required this.icon,
    required this.label,
    this.badgeCount,
  });

  final IconData icon;
  final String label;

  final int? badgeCount;
}
