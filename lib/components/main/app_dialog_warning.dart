import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/app/theme/app_colors.dart';
import '/app/theme/app_text_styles.dart';
import '/components/button/_.dart';
import 'app_dialog.dart';

class AppDialogWarning extends StatelessWidget {
  const AppDialogWarning({
    super.key,
    required this.title,
    this.confirmLabel = 'Yes',
    this.cancelLabel = 'No',
  });

  final String title;
  final String confirmLabel;
  final String cancelLabel;

  Future<bool?> show() {
    return Get.dialog<bool>(this);
  }

  @override
  Widget build(BuildContext context) {
    return AppDialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.warning_amber_rounded, size: 56, color: AppColors.primary),
          const SizedBox(height: 16),
          Text(
            title,
            textAlign: TextAlign.center,
            style: AppTextStyles.bodyLarge.copyWith(
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              Expanded(
                child: AppButtonWidget(
                  model: AppButtonModel(
                    label: confirmLabel,
                    type: AppButtonType.primary,
                    size: AppButtonSize.medium,
                  ),
                  onPressed: () => Get.back(result: true),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: AppButtonWidget(
                  model: AppButtonModel(
                    label: cancelLabel,
                    type: AppButtonType.outline,
                    size: AppButtonSize.medium,
                  ),
                  onPressed: () => Get.back(result: false),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
