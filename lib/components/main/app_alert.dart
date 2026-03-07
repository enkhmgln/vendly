import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/app/theme/app_colors.dart';
import '/app/theme/app_text_styles.dart';
import '/components/button/_.dart';

enum AppAlertType {
  success(title: 'Success', icon: Icons.check_circle_outline),
  error(title: 'Error', icon: Icons.error_outline),
  warning(title: 'Warning', icon: Icons.warning_amber_outlined);

  const AppAlertType({required this.title, required this.icon});
  final String title;
  final IconData icon;
}

class AppAlert extends StatelessWidget {
  const AppAlert({
    super.key,
    required this.type,
    required this.bodyText,
    this.titleText,
    this.acceptText,
    this.cancelText,
    this.dismissable = true,
  });

  final AppAlertType type;
  final String bodyText;
  final String? titleText;
  final String? acceptText;
  final String? cancelText;
  final bool dismissable;

  Future<bool?> show() {
    return Get.dialog<bool>(this, barrierDismissible: dismissable);
  }

  @override
  Widget build(BuildContext context) {
    final iconColor = switch (type) {
      AppAlertType.success => AppColors.primary,
      AppAlertType.error => AppColors.error,
      AppAlertType.warning => AppColors.primary,
    };

    return Dialog(
      backgroundColor: AppColors.surface,
      insetPadding: const EdgeInsets.symmetric(horizontal: 24),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 64,
              height: 64,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: iconColor.withValues(alpha: 0.15),
              ),
              child: Icon(type.icon, size: 32, color: iconColor),
            ),
            const SizedBox(height: 20),
            Text(
              titleText ?? type.title,
              textAlign: TextAlign.center,
              style: AppTextStyles.titleMediumBold.copyWith(color: AppColors.textPrimary),
            ),
            const SizedBox(height: 12),
            Text(
              bodyText,
              textAlign: TextAlign.center,
              maxLines: 6,
              style: AppTextStyles.bodyMedium.copyWith(color: AppColors.textSecondary),
            ),
            if (acceptText != null || cancelText != null) ...[
              const SizedBox(height: 24),
              Row(
                children: [
                  if (cancelText != null) ...[
                    Expanded(
                      child: AppButtonWidget(
                        model: AppButtonModel(
                          label: cancelText!,
                          type: AppButtonType.outline,
                          size: AppButtonSize.medium,
                        ),
                        onPressed: () => Get.back(result: false),
                      ),
                    ),
                    if (acceptText != null) const SizedBox(width: 12),
                  ],
                  if (acceptText != null)
                    Expanded(
                      child: AppButtonWidget(
                        model: AppButtonModel(
                          label: acceptText!,
                          type: AppButtonType.primary,
                          size: AppButtonSize.medium,
                        ),
                        onPressed: () => Get.back(result: true),
                      ),
                    ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
}
