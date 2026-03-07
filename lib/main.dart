import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '/app/routes/app_pages.dart';
import '/core/constants/config.dart';
import 'app_config.dart';
import 'app_controller.dart';

void main() async {
  await AppConfig.init();
  Get.put<AppController>(AppController(), permanent: true);
  runApp(
    AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: appName,
      debugShowCheckedModeBanner: false,
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
      theme: ThemeData(fontFamily: 'GIP'),
    );
  }
}
