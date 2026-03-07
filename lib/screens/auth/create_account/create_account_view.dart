import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/app/theme/app_colors.dart';
import '/app/theme/app_text_styles.dart';
import '/core/constants/config.dart';
import '/components/_.dart';

import 'create_account_controller.dart';

class CreateAccountView extends GetView<CreateAccountController> {
  const CreateAccountView({super.key});

  static const String routeName = '/create-account';

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
                      '$appName бүртгэл үүсгэх',
                      textAlign: TextAlign.left,
                      style: AppTextStyles.heading1Bold.copyWith(
                        color: AppColors.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Хурдан, энгийн бүртгэл.\nБизнесээ нэг дороос удирдаарай.',
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
                    const SizedBox(height: 24),
                    Obx(() {
                      final agreed = controller.termsAgreed.value;
                      final showErrors = controller.showValidationErrors.value;
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppCheckbox(
                                value: agreed,
                                onChanged: (_) => controller.toggleTerms(),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 2),
                                  child: RichText(
                                    text: TextSpan(
                                      style: AppTextStyles.bodyMedium.copyWith(
                                        color: AppColors.textPrimary,
                                      ),
                                      children: [
                                        TextSpan(text: '$appName-ийн '),
                                        WidgetSpan(
                                          child: GestureDetector(
                                            onTap: () {},
                                            child: Text(
                                              'Гэрээ',
                                              style: AppTextStyles
                                                  .bodyMediumBold
                                                  .copyWith(
                                                    color:
                                                        AppColors.textPrimary,
                                                    decoration: TextDecoration
                                                        .underline,
                                                    decorationColor:
                                                        AppColors.textPrimary,
                                                  ),
                                            ),
                                          ),
                                        ),
                                        const TextSpan(text: ' болон '),
                                        WidgetSpan(
                                          child: GestureDetector(
                                            onTap: () {},
                                            child: Text(
                                              'Нууцлалын бодлогыг',
                                              style: AppTextStyles
                                                  .bodyMediumBold
                                                  .copyWith(
                                                    color:
                                                        AppColors.textPrimary,
                                                    decoration: TextDecoration
                                                        .underline,
                                                    decorationColor:
                                                        AppColors.textPrimary,
                                                  ),
                                            ),
                                          ),
                                        ),
                                        const TextSpan(
                                          text: ' зөвшөөрч байна.',
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          if (!agreed && showErrors) ...[
                            const SizedBox(height: 6),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Text(
                                    '$appName-ийн Гэрээ болон Нууцлалын бодлогыг зөвшөөрөх шаардлагатай.',
                                    textAlign: TextAlign.left,
                                    style: AppTextStyles.bodySmall.copyWith(
                                      color: AppColors.error,
                                      height: 1.3,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ],
                      );
                    }),
                    const SizedBox(height: 32),
                    Obx(
                      () => AppButtonWidget(
                        model: AppButtonModel(
                          label: 'Бүртгэл үүсгэх',
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
