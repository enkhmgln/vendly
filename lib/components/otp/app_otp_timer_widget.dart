import 'package:flutter/material.dart';

import '/app/theme/app_theme_extension.dart';
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
        final accent = Theme.of(context).extension<AppThemeExtension>()?.accent;
        return Text(
          '${model.minute}:${model.second}',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w600,
            color: accent ?? Theme.of(context).colorScheme.primary,
          ),
        );
      },
    );
  }
}
