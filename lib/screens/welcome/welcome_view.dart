import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

import '/app/theme/app_colors.dart';
import '/app/theme/app_text_styles.dart';
import '/components/_.dart';

import 'welcome_controller.dart';

class WelcomeView extends GetView<WelcomeController> {
  const WelcomeView({super.key});

  static const String routeName = '/';

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Obx(() {
            if (!controller.isVideoInitialized.value) {
              return const ColoredBox(color: AppColors.primary);
            }
            return FittedBox(
              fit: BoxFit.cover,
              child: SizedBox(
                width: controller.videoController.value.size.width,
                height: controller.videoController.value.size.height,
                child: VideoPlayer(controller.videoController),
              ),
            );
          }),
          Positioned.fill(
            child: Container(color: AppColors.primary.withValues(alpha: 0.4)),
          ),
          SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 12, 20, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 44,
                        height: 44,
                        child: Image.asset(
                          'assets/images/logo.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                      Obx(
                        () => IconButton(
                          onPressed: controller.togglePlayPause,
                          icon: Icon(
                            controller.isPlaying.value
                                ? Icons.pause
                                : Icons.play_arrow,
                            color: AppColors.background,
                            size: 28,
                          ),
                          style: IconButton.styleFrom(
                            foregroundColor: AppColors.background,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Center(
                      child: Text(
                        'Зарлаа.\nБүртгэлээ.\nАшигтай боллоо.',
                        textAlign: TextAlign.left,
                        style: AppTextStyles.displayBold.copyWith(
                          color: AppColors.background,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(24, 16, 24, 32),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AppButtonWidget(
                        model: AppButtonModel(
                          label: 'Бүртгэл үүсгэх',
                          type: AppButtonType.surface,
                          size: AppButtonSize.large,
                        ),
                        onPressed: controller.goToCreateAccount,
                      ),
                      const SizedBox(height: 14),
                      AppButtonWidget(
                        model: AppButtonModel(
                          label: 'Нэвтрэх',
                          type: AppButtonType.primary,
                          size: AppButtonSize.large,
                        ),
                        onPressed: controller.goToLogin,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
