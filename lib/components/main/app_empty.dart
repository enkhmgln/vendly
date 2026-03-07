import 'package:flutter/material.dart';

import '/app/theme/app_colors.dart';
import '/app/theme/app_text_styles.dart';

class AppEmpty extends StatelessWidget {
  const AppEmpty({super.key, this.icon, this.text = 'No data'});

  final Widget? icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[icon!, const SizedBox(height: 16)],
          Text(
            text,
            textAlign: TextAlign.center,
            style: AppTextStyles.bodyLarge.copyWith(color: AppColors.textSecondary),
          ),
        ],
      ),
    );
  }
}
