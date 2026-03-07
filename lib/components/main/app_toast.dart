import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/app/theme/app_colors.dart';
import '/app/theme/app_theme_extension.dart';

abstract class AppToast {
  AppToast._();

  static void show(
    String message, {
    String? title,
    bool isError = false,
    SnackPosition position = SnackPosition.TOP,
    Duration duration = const Duration(seconds: 3),
  }) {
    final backgroundColor = isError ? AppColors.error : AppColors.success;
    final onAccent = Get.context != null
        ? (Theme.of(Get.context!).extension<AppThemeExtension>()?.onAccent ??
            AppColors.onAccent)
        : AppColors.onAccent;
    Get.snackbar(
      title ?? '',
      message,
      snackPosition: position,
      backgroundColor: backgroundColor,
      colorText: onAccent,
      margin: const EdgeInsets.all(16),
      borderRadius: 12,
      duration: duration,
      titleText: title != null && title.isNotEmpty
          ? Text(
              title,
              style: TextStyle(
                color: onAccent,
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
            )
          : const SizedBox.shrink(),
      messageText: Text(
        message,
        style: TextStyle(color: onAccent, fontSize: 13),
      ),
    );
  }

  static void showError(String message, {String? title}) {
    show(message, title: title ?? 'Error', isError: true);
  }

  static void showSuccess(String message, {String? title}) {
    show(message, title: title ?? 'Success', isError: false);
  }
}
