import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/app/routes/app_pages.dart';
import '/app/theme/app_theme.dart';
import '/app/theme/theme_manager.dart';
import '/core/constants/config.dart';
import 'app_config.dart';
import 'app_controller.dart';

void main() async {
  await AppConfig.init();
  Get.put<AppController>(AppController(), permanent: true);
  runApp(MainApp(themeMode: ThemeManager.getStoredMode()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key, this.themeMode = ThemeMode.system});

  final ThemeMode themeMode;

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: appName,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeMode,
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
    );
  }
}
