import 'package:flutter/material.dart';

import '/app/theme/app_colors.dart';
import '/app/theme/app_text_styles.dart';
import '/components/button/_.dart';
import 'app_otp_timer_model.dart';

class AppOtpTimerWidget extends StatelessWidget {
  const AppOtpTimerWidget({
    super.key,
    required this.model,
    this.resendLabel = 'Resend code',
    this.onResend,
  });

  final AppOtpTimerModel model;
  final String resendLabel;
  final VoidCallback? onResend;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: model,
      builder: (context, _) {
        if (model.isTimerEnded) {
          return AppButtonWidget(
            model: AppButtonModel(
              label: resendLabel,
              type: AppButtonType.text,
              size: AppButtonSize.small,
              isExpanded: false,
            ),
            onPressed: onResend,
          );
        }
        return Text(
          '${model.minute}:${model.second}',
          style: AppTextStyles.bodyMediumMedium.copyWith(color: AppColors.primary),
        );
      },
    );
  }
}
