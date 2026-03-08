import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/components/_.dart';
import 'tabbar_controller.dart';

class TabBarScreen extends GetView<TabBarController> {
  const TabBarScreen({super.key});

  static const String routeName = '/tabbar';

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => AppScaffold(
        body: IndexedStack(
          index: controller.currentIndex.value,
          children: controller.tabItems.map((e) => e.screen).toList(),
        ),
        bottomNavigationBar: AppTabBarWidget(
          items: controller.tabBarItems,
          currentIndex: controller.currentIndex.value,
          onTap: controller.onTabChanged,
        ),
      ),
    );
  }
}
