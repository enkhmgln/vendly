import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/app/theme/app_colors.dart';
import '/app/theme/app_text_styles.dart';
import '/components/_.dart';
import '/core/constants/config.dart';

import 'login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  static const String routeName = '/login';

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
              child: Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '$appName нэвтрэх',
                      textAlign: TextAlign.left,
                      style: AppTextStyles.heading1Bold.copyWith(
                        color: AppColors.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Бүртгэлтэй и-мэйл, нууц үгээ оруулан нэвтрэнэ үү.',
                      textAlign: TextAlign.left,
                      style: AppTextStyles.bodyLarge.copyWith(
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(24, 8, 24, 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Obx(
                      () => AppTextFieldWidget(
                        model: controller.emailModel,
                        showError: controller.showValidationErrors.value,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Obx(
                      () => AppTextFieldWidget(
                        model: controller.passwordModel,
                        showError: controller.showValidationErrors.value,
                      ),
                    ),
                    const SizedBox(height: 32),
                    Obx(
                      () => AppButtonWidget(
                        model: AppButtonModel(
                          label: 'Нэвтрэх',
                          type: AppButtonType.primary,
                          size: AppButtonSize.large,
                          isLoading: controller.isLoading.value,
                        ),
                        onPressed: controller.onSubmit,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
