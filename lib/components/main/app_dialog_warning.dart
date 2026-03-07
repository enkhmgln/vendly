import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
    final cs = Theme.of(context).colorScheme;

    return AppDialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.warning_amber_rounded, size: 56, color: cs.primary),
          const SizedBox(height: 16),
          Text(
            title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.w600,
              color: cs.onSurface,
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
