import 'package:flutter/material.dart';

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
    final theme = Theme.of(context);
    final cs = theme.colorScheme;
    final surface = cs.surfaceContainerHighest;
    final hintColor = cs.outline;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (model.label != null && model.label!.isNotEmpty) ...[
          Text(
            model.label!,
            style: theme.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w500,
              color: hintColor,
            ),
          ),
          const SizedBox(height: 8),
        ],
        Container(
          height: height,
          decoration: BoxDecoration(
            color: surface,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: hintColor.withValues(alpha: 0.5),
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
            style: theme.textTheme.bodyLarge,
            decoration: InputDecoration(
              hintText: model.hint,
              hintStyle: theme.textTheme.bodyLarge?.copyWith(color: hintColor),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.all(16),
            ),
          ),
        ),
      ],
    );
  }
}
