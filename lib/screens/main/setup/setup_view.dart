import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/app/theme/app_colors.dart';
import '/app/theme/app_text_styles.dart';

import 'setup_controller.dart';

class SetupView extends GetView<SetupController> {
  const SetupView({super.key});

  static const String routeName = '/setup';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Text(
          'Setup',
          style: AppTextStyles.titleLargeBold.copyWith(
            color: AppColors.textSecondary,
          ),
        ),
      ),
    );
  }
}
