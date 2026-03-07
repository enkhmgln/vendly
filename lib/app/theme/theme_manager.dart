import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/core/constants/config.dart';
import '/core/shared/store_manager.dart';

abstract class ThemeManager {
  ThemeManager._();

  static ThemeMode getStoredMode() {
    final value = DeviceStoreManager.shared.data<String>(kThemeMode);
    if (value == null) return ThemeMode.system;
    switch (value) {
      case 'light':
        return ThemeMode.light;
      case 'dark':
        return ThemeMode.dark;
      default:
        return ThemeMode.system;
    }
  }

  static bool get isDarkStored {
    final value = DeviceStoreManager.shared.data<String>(kThemeMode);
    return value == 'dark';
  }

  static Future<void> saveAndApply(ThemeMode mode) async {
    final String value;
    switch (mode) {
      case ThemeMode.light:
        value = 'light';
        break;
      case ThemeMode.dark:
        value = 'dark';
        break;
      case ThemeMode.system:
        value = 'system';
        break;
    }
    await DeviceStoreManager.shared.write(kThemeMode, value);
    Get.changeThemeMode(mode);
  }

  static Future<void> toggleDark() async {
    final next = Get.isDarkMode ? ThemeMode.light : ThemeMode.dark;
    await saveAndApply(next);
  }
}
