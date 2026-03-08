import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/app/theme/app_colors.dart';
import '/app/theme/app_text_styles.dart';

import 'more_controller.dart';

class MoreView extends GetView<MoreController> {
  const MoreView({super.key});

  static const String routeName = '/more';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Text(
          'More',
          style: AppTextStyles.titleLargeBold.copyWith(
            color: AppColors.textSecondary,
          ),
        ),
      ),
    );
  }
}
