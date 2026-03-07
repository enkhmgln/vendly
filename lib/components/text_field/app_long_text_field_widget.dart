import 'package:flutter/material.dart';

import '/app/theme/app_colors.dart';
import '/app/theme/app_text_styles.dart';
import 'app_text_field_model.dart';

class AppLongTextFieldWidget extends StatelessWidget {
  const AppLongTextFieldWidget({
    super.key,
    required this.model,
    this.height = 120,
    this.onChanged,
  });

  final AppTextFieldModel model;
  final double height;
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (model.label != null && model.label!.isNotEmpty) ...[
          Text(
            model.label!,
            style: AppTextStyles.bodyMediumMedium.copyWith(color: AppColors.textSecondary),
          ),
          const SizedBox(height: 8),
        ],
        Container(
          height: height,
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: AppColors.outline.withValues(alpha: 0.5),
              width: 1,
            ),
          ),
          child: TextFormField(
            controller: model.controller,
            focusNode: model.focusNode,
            maxLines: null,
            readOnly: model.readOnly,
            enabled: model.enabled,
            textInputAction: TextInputAction.newline,
            onChanged: onChanged,
            style: AppTextStyles.bodyLarge,
            decoration: InputDecoration(
              hintText: model.hint,
              hintStyle: AppTextStyles.bodyLarge.copyWith(color: AppColors.textSecondary),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.all(16),
            ),
          ),
        ),
      ],
    );
  }
}
