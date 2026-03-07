import 'package:flutter/material.dart';

import '/app/theme/app_colors.dart';
import '/app/theme/app_text_styles.dart';

class AppChip extends StatelessWidget {
  const AppChip({
    super.key,
    required this.title,
    required this.selected,
    this.onPressed,
  });

  final String title;
  final bool selected;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        backgroundColor: AppColors.surface,
        foregroundColor: selected ? AppColors.primary : AppColors.textSecondary,
        side: BorderSide(
          width: selected ? 1.5 : 1,
          color: selected
              ? AppColors.primary
              : AppColors.textSecondary.withValues(alpha: 0.6),
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: Text(
        title,
        style: AppTextStyles.bodyMediumMedium.copyWith(
          color: selected ? AppColors.primary : AppColors.textPrimary,
        ),
      ),
    );
  }
}
