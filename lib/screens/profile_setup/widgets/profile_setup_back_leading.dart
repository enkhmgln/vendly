import 'package:flutter/material.dart';

import '/app/theme/app_colors.dart';

class ProfileSetupBackLeading extends StatelessWidget {
  const ProfileSetupBackLeading({super.key, required this.onBack});

  final VoidCallback onBack;

  static const double _leadingButtonSize = 40;
  static const double _leadingIconSize = 22;
  static const double _leadingLeftGap = 16;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(width: _leadingLeftGap),
        Material(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(_leadingButtonSize / 2),
          elevation: 1,
          shadowColor: Colors.black.withValues(alpha: 0.08),
          child: InkWell(
            borderRadius: BorderRadius.circular(_leadingButtonSize / 2),
            onTap: onBack,
            child: SizedBox(
              width: _leadingButtonSize,
              height: _leadingButtonSize,
              child: Icon(
                Icons.arrow_back,
                color: AppColors.textPrimary,
                size: _leadingIconSize,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
