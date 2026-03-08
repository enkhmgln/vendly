import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/app/theme/app_colors.dart';
import '/app/theme/app_text_styles.dart';

import 'notifications_controller.dart';

class NotificationsView extends GetView<NotificationsController> {
  const NotificationsView({super.key});

  static const String routeName = '/notifications';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Text(
          'Notifications',
          style: AppTextStyles.titleLargeBold.copyWith(
            color: AppColors.textSecondary,
          ),
        ),
      ),
    );
  }
}
