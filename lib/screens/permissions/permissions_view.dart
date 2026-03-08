import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/app/theme/app_colors.dart';
import '/app/theme/app_text_styles.dart';
import '/components/_.dart';

import 'permissions_controller.dart';

class PermissionsView extends GetView<PermissionsController> {
  const PermissionsView({super.key});

  static const String routeName = '/permissions';

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppAppBar(),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
              child: Text(
                'Төхөөрөмжийн зөвшөөрөл тохируулах',
                style: AppTextStyles.heading1Bold.copyWith(
                  color: AppColors.textPrimary,
                ),
              ),
            ),
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                itemCount: controller.entries.length,
                separatorBuilder: (_, __) => const SizedBox(height: 20),
                itemBuilder: (context, index) {
                  final entry = controller.entries[index];
                  return Obx(() {
                    final isGranted = controller.granted.value[index];
                    return _PermissionTile(
                      title: entry.title,
                      description: entry.description,
                      optional: entry.optional,
                      value: isGranted,
                      onTap: () => controller.onPermissionTap(index),
                    );
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 16, 24, 32),
              child: Obx(
                () => AppButtonWidget(
                  model: AppButtonModel(
                    label: 'Дараах',
                    type: AppButtonType.primary,
                    size: AppButtonSize.large,
                    isEnabled: controller.canProceed,
                  ),
                  onPressed: controller.canProceed ? controller.onNext : null,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PermissionTile extends StatelessWidget {
  const _PermissionTile({
    required this.title,
    required this.description,
    required this.optional,
    required this.value,
    required this.onTap,
  });

  final String title;
  final String description;
  final bool optional;
  final bool value;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  RichText(
                    text: TextSpan(
                      text: title,
                      style: AppTextStyles.titleMediumBold.copyWith(
                        color: AppColors.textPrimary,
                      ),
                      children: [
                        if (optional)
                          TextSpan(
                            text: ' (Заавал биш)',
                            style: AppTextStyles.titleMediumRegular.copyWith(
                              color: AppColors.textSecondary,
                            ),
                          ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    description,
                    style: AppTextStyles.bodyMedium.copyWith(
                      color: AppColors.textSecondary,
                      height: 1.4,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 16),
            Padding(
              padding: const EdgeInsets.only(top: 2),
              child: AppCheckbox(value: value, onChanged: (_) => onTap()),
            ),
          ],
        ),
      ),
    );
  }
}
