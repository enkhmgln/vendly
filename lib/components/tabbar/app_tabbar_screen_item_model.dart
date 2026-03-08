import 'package:flutter/material.dart';

import 'app_tabbar_item_model.dart';

class AppTabBarScreenItemModel {
  const AppTabBarScreenItemModel({
    required this.icon,
    required this.label,
    required this.screen,
    this.badgeCount,
  });

  final IconData icon;
  final String label;
  final Widget screen;
  final int? badgeCount;

  AppTabBarItemModel toBarItem() =>
      AppTabBarItemModel(icon: icon, label: label, badgeCount: badgeCount);
}
