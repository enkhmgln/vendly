import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/app/theme/app_colors.dart';
import '/app/theme/app_text_styles.dart';

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
    final colorText = AppColors.background;
    Get.snackbar(
      title ?? '',
      message,
      snackPosition: position,
      backgroundColor: backgroundColor,
      colorText: colorText,
      margin: const EdgeInsets.all(16),
      borderRadius: 12,
      duration: duration,
      titleText: title != null && title.isNotEmpty
          ? Text(
              title,
              style: AppTextStyles.bodySmallBold.copyWith(color: colorText),
            )
          : const SizedBox.shrink(),
      messageText: Text(
        message,
        style: AppTextStyles.caption.copyWith(color: colorText),
      ),
    );
  }

  static void showError(String message, {String? title}) {
    show(message, title: title ?? 'Алдаа', isError: true);
  }

  static void showSuccess(String message, {String? title}) {
    show(message, title: title ?? 'Амжилттай', isError: false);
  }
}
