import 'package:flutter/material.dart';

import '/app/theme/app_theme_extension.dart';
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
    final theme = Theme.of(context);
    final ext = theme.extension<AppThemeExtension>();
    final cs = theme.colorScheme;
    final surfaceVariant = ext?.surfaceVariant ?? cs.surfaceContainerHighest;
    final onSurfaceVariant = ext?.onSurfaceVariant ?? cs.outline;
    final focus = ext?.focus ?? cs.primary;

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
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: onSurfaceVariant,
                  fontWeight: FontWeight.w400,
                  fontSize: 15,
                ),
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
              cursorColor: focus,
              onChanged: widget.onChanged,
              onFieldSubmitted: widget.onSubmitted,
              style: theme.textTheme.bodyLarge?.copyWith(
                color: m.enabled ? cs.onSurface : onSurfaceVariant,
                fontSize: 16,
              ),
              decoration: InputDecoration(
                hintText: m.hint,
                hintStyle: TextStyle(color: onSurfaceVariant, fontSize: 16),
                errorText: errorText,
                filled: true,
                fillColor:
                    m.enabled ? surfaceVariant : surfaceVariant.withValues(alpha: 0.6),
                border: border,
                enabledBorder: border,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(_borderRadius),
                  borderSide: BorderSide.none,
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(_borderRadius),
                  borderSide: BorderSide(color: cs.error),
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
                            color: onSurfaceVariant,
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
