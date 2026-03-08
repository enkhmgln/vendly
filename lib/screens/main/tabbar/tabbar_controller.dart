import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/components/_.dart';
import '/screens/_.dart';

class TabBarController extends AppBaseController {
  final currentIndex = 0.obs;

  late final List<AppTabBarScreenItemModel> tabItems = [
    AppTabBarScreenItemModel(
      icon: Icons.grid_view_rounded,
      label: 'Нүүр',
      screen: const HomeView(),
    ),
    AppTabBarScreenItemModel(
      icon: Icons.swap_horiz_rounded,
      label: 'Түүх',
      screen: const TransactionsView(),
    ),
    AppTabBarScreenItemModel(
      icon: Icons.description_outlined,
      label: 'Setup',
      badgeCount: 1,
      screen: const SetupView(),
    ),
    AppTabBarScreenItemModel(
      icon: Icons.notifications_outlined,
      label: 'Мэдэгдэл',
      badgeCount: 1,
      screen: const NotificationsView(),
    ),
    AppTabBarScreenItemModel(
      icon: Icons.menu_rounded,
      label: 'Цэс',
      screen: const MoreView(),
    ),
  ];

  List<AppTabBarItemModel> get tabBarItems =>
      tabItems.map((e) => e.toBarItem()).toList();

  void onTabChanged(int index) {
    currentIndex.value = index;
  }
}
