import 'package:flutter/material.dart';

import '/app/theme/app_colors.dart';
import '/app/theme/app_text_styles.dart';
import 'app_text_field_model.dart';
import '/core/utils/validator.dart';

class AppTextFieldWidget extends StatefulWidget {
  const AppTextFieldWidget({
    super.key,
    required this.model,
    this.onChanged,
    this.onSubmitted,
    this.suffixWidget,
  });

  final AppTextFieldModel model;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;

  /// Optional trailing widget inside the field (e.g. success checkmark).
  final Widget? suffixWidget;

  @override
  State<AppTextFieldWidget> createState() => _AppTextFieldWidgetState();
}

class _AppTextFieldWidgetState extends State<AppTextFieldWidget> {
  @override
  void initState() {
    super.initState();
    final m = widget.model;
    if (m.validators != null && m.validators!.isNotEmpty) {
      Validator(
        validations: m.validators!,
      ).setValidation(controller: m.controller, errorNotifier: m.errorText);
    }
    m.errorText.addListener(_onErrorChanged);
  }

  @override
  void didUpdateWidget(covariant AppTextFieldWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.model != widget.model) {
      oldWidget.model.errorText.removeListener(_onErrorChanged);
      widget.model.errorText.addListener(_onErrorChanged);
    }
  }

  @override
  void dispose() {
    widget.model.errorText.removeListener(_onErrorChanged);
    super.dispose();
  }

  void _onErrorChanged() {
    if (mounted) setState(() {});
  }

  static const _borderRadius = 12.0;

  @override
  Widget build(BuildContext context) {
    final m = widget.model;

    return ValueListenableBuilder<String?>(
      valueListenable: m.errorText,
      builder: (context, errorText, _) {
        final border = OutlineInputBorder(
          borderRadius: BorderRadius.circular(_borderRadius),
          borderSide: BorderSide.none,
        );
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (m.label != null && m.label!.isNotEmpty) ...[
              Text(
                m.label!,
                style: AppTextStyles.bodyMedium.copyWith(color: AppColors.textSecondary),
              ),
              const SizedBox(height: 8),
            ],
            TextFormField(
              controller: m.controller,
              focusNode: m.focusNode,
              keyboardType: m.keyboardType,
              obscureText: m.obscureText,
              enabled: m.enabled,
              readOnly: m.readOnly,
              autofocus: m.autofocus,
              maxLength: m.maxLength,
              maxLines: m.maxLines,
              autocorrect: false,
              cursorColor: AppColors.primary,
              onChanged: widget.onChanged,
              onFieldSubmitted: widget.onSubmitted,
              style: AppTextStyles.bodyLarge.copyWith(
                color: m.enabled
                    ? AppColors.textPrimary
                    : AppColors.textSecondary,
              ),
              decoration: InputDecoration(
                hintText: m.hint,
                hintStyle: AppTextStyles.bodyLarge.copyWith(color: AppColors.textSecondary),
                errorText: errorText,
                filled: true,
                fillColor: m.enabled
                    ? AppColors.surface
                    : AppColors.surface.withValues(alpha: 0.6),
                border: border,
                enabledBorder: border,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(_borderRadius),
                  borderSide: BorderSide.none,
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(_borderRadius),
                  borderSide: BorderSide(color: AppColors.error),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 14,
                ),
                suffixIcon: widget.suffixWidget != null
                    ? Padding(
                        padding: const EdgeInsets.only(right: 12),
                        child: widget.suffixWidget,
                      )
                    : m.keyboardType == TextInputType.visiblePassword
                    ? Padding(
                        padding: const EdgeInsets.only(right: 4),
                        child: IconButton(
                          icon: Icon(
                            m.obscureText
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined,
                            color: AppColors.textSecondary,
                            size: 22,
                          ),
                          onPressed: () {
                            setState(() {
                              m.obscureText = !m.obscureText;
                            });
                          },
                        ),
                      )
                    : null,
              ),
            ),
          ],
        );
      },
    );
  }
}
