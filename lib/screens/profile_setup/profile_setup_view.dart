import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/app/theme/app_colors.dart';
import '/app/theme/app_text_styles.dart';
import '/components/_.dart';

import 'profile_setup_controller.dart';
import 'widgets/_.dart';

class ProfileSetupView extends GetView<ProfileSetupController> {
  const ProfileSetupView({super.key});

  static const String routeName = '/profile-setup';

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppAppBar(
        leading: ProfileSetupBackLeading(onBack: controller.onBack),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 8, 20, 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Профайл тохируулах',
                    style: AppTextStyles.heading1Bold.copyWith(
                      color: AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Та өөрийн мэдээллээ бөглөнө үү.',
                    style: AppTextStyles.bodyLarge.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Obx(
                    () => AppPageIndicator(
                      currentIndex: controller.currentStep.value,
                      pageCount: ProfileSetupController.totalSteps,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(24, 8, 24, 24),
                child: Obx(() {
                  final step = controller.currentStep.value;
                  if (step == 0) return _buildStep0(context);
                  if (step == 1) return _buildStep1(context);
                  return _buildStep2(context);
                }),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 8, 24, 24),
              child: Obx(
                () => AppButtonWidget(
                  model: AppButtonModel(
                    label: controller.nextButtonLabel,
                    type: AppButtonType.primary,
                    size: AppButtonSize.large,
                    isLoading: controller.isLoading.value,
                  ),
                  onPressed: controller.onNext,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStep0(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Obx(
          () => AppTextFieldWidget(
            model: controller.firstNameModel,
            showError: controller.showValidationErrors.value,
          ),
        ),
        const SizedBox(height: 20),
        Obx(
          () => AppTextFieldWidget(
            model: controller.lastNameModel,
            showError: controller.showValidationErrors.value,
          ),
        ),
        const SizedBox(height: 20),
        Obx(
          () => AppTextFieldWidget(
            model: controller.phoneModel,
            showError: controller.showValidationErrors.value,
          ),
        ),
      ],
    );
  }

  Widget _buildStep1(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 16),
        Text(
          'Профайл зураг',
          style: AppTextStyles.titleMediumMedium.copyWith(
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 16),
        Obx(() {
          final path = controller.avatarFilePath.value;
          final uploading = controller.isLoading.value;
          return Center(
            child: GestureDetector(
              onTap: uploading ? null : controller.pickAvatar,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.surface,
                      border: Border.all(
                        color: AppColors.outline.withValues(alpha: 0.3),
                      ),
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: path != null
                        ? Image.file(File(path), fit: BoxFit.cover)
                        : AppImagePlaceholder(
                            icon: uploading
                                ? const SizedBox(
                                    width: 32,
                                    height: 32,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                    ),
                                  )
                                : Icon(
                                    Icons.add_a_photo_outlined,
                                    size: 40,
                                    color: AppColors.textSecondary,
                                  ),
                          ),
                  ),
                  if (path != null && !controller.isLoading.value)
                    Positioned(
                      right: 0,
                      bottom: 0,
                      child: Material(
                        color: AppColors.error,
                        shape: const CircleBorder(),
                        child: InkWell(
                          onTap: controller.removeAvatar,
                          customBorder: const CircleBorder(),
                          child: const Padding(
                            padding: EdgeInsets.all(6),
                            child: Icon(
                              Icons.close,
                              color: AppColors.background,
                              size: 20,
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          );
        }),
      ],
    );
  }

  Widget _buildStep2(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        AppTextFieldWidget(model: controller.locationModel),
        const SizedBox(height: 20),
        AppTextFieldWidget(model: controller.birthdateModel),
      ],
    );
  }
}
