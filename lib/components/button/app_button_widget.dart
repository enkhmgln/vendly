import 'dart:ui' show ImageFilter;

import 'package:flutter/material.dart';

import '/app/theme/app_colors.dart';
import 'app_button_model.dart';

class AppButtonWidget extends StatelessWidget {
  const AppButtonWidget({super.key, required this.model, this.onPressed});

  final AppButtonModel model;
  final VoidCallback? onPressed;

  VoidCallback? get _effectiveOnPressed =>
      (model.isLoading || !model.isEnabled) ? null : onPressed;

  ({Color fore, Color back, Color border}) _resolveColors(
    BuildContext context,
  ) {
    if (!model.isEnabled) {
      return (
        fore: AppColors.outline,
        back: AppColors.surface,
        border: AppColors.transparent,
      );
    }
    switch (model.type) {
      case AppButtonType.primary:
        return (
          fore: AppColors.onPrimary,
          back: AppColors.primary,
          border: AppColors.transparent,
        );
      case AppButtonType.surface:
        return (
          fore: AppColors.textPrimary,
          back: AppColors.background,
          border: AppColors.transparent,
        );
      case AppButtonType.outline:
        return (
          fore: AppColors.primary,
          back: AppColors.transparent,
          border: AppColors.primary,
        );
      case AppButtonType.text:
        return (
          fore: AppColors.primary,
          back: AppColors.transparent,
          border: AppColors.transparent,
        );
      case AppButtonType.accentPrimary:
      case AppButtonType.glass:
        return (
          fore: AppColors.onPrimary,
          back: AppColors.primary,
          border: AppColors.transparent,
        );
    }
  }

  Widget _buildChild(Color foreColor) {
    if (model.isLoading) {
      return SizedBox.square(
        dimension: model.size.iconSize,
        child: CircularProgressIndicator(
          strokeWidth: 2,
          valueColor: AlwaysStoppedAnimation<Color>(foreColor),
        ),
      );
    }
    final text = Text(
      model.label,
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
      style: TextStyle(
        fontSize: model.size.fontSize,
        fontWeight: FontWeight.w700,
        color: foreColor,
      ),
    );
    final hasPrefix = model.prefixWidget != null || model.prefixIcon != null;
    final hasSuffix = model.suffixIcon != null;
    if (!hasPrefix && !hasSuffix) return text;
    return Row(
      mainAxisSize: model.isExpanded ? MainAxisSize.max : MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (model.prefixWidget != null) ...[
          model.prefixWidget!,
          const SizedBox(width: 12),
        ] else if (model.prefixIcon != null) ...[
          Icon(model.prefixIcon, size: model.size.iconSize, color: foreColor),
          const SizedBox(width: 12),
        ],
        Flexible(child: text),
        if (model.suffixIcon != null) ...[
          const SizedBox(width: 12),
          Icon(model.suffixIcon, size: model.size.iconSize, color: foreColor),
        ],
      ],
    );
  }

  EdgeInsets get _padding {
    return switch (model.size) {
      AppButtonSize.small => const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      AppButtonSize.medium => const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 12,
      ),
      AppButtonSize.large => const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 16,
      ),
    };
  }

  @override
  Widget build(BuildContext context) {
    final c = _resolveColors(context);
    final child = _buildChild(c.fore);
    final height = model.size.height;

    Widget button;
    switch (model.type) {
      case AppButtonType.glass:
        button = _buildGlassButton(context, child, height, c);
        break;
      case AppButtonType.primary:
      case AppButtonType.surface:
      case AppButtonType.accentPrimary:
        button = ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: c.back,
            foregroundColor: c.fore,
            disabledBackgroundColor: c.back,
            disabledForegroundColor: c.fore,
            elevation: 0,
            padding: _padding,
            minimumSize: Size(0, height),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(model.borderRadius),
            ),
          ),
          onPressed: _effectiveOnPressed,
          child: child,
        );
        break;
      case AppButtonType.outline:
        button = OutlinedButton(
          style: OutlinedButton.styleFrom(
            foregroundColor: c.fore,
            backgroundColor: c.back,
            disabledForegroundColor: c.fore,
            disabledBackgroundColor: c.back,
            side: BorderSide(color: c.border),
            padding: _padding,
            minimumSize: Size(0, height),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(model.borderRadius),
            ),
          ),
          onPressed: _effectiveOnPressed,
          child: child,
        );
        break;
      case AppButtonType.text:
        button = TextButton(
          style: TextButton.styleFrom(
            foregroundColor: c.fore,
            disabledForegroundColor: c.fore,
            padding: _padding,
            minimumSize: Size(0, height),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(model.borderRadius),
            ),
          ),
          onPressed: _effectiveOnPressed,
          child: child,
        );
        break;
    }
    return SizedBox(
      height: height,
      width: model.isExpanded ? double.infinity : null,
      child: button,
    );
  }

  Widget _buildGlassButton(
    BuildContext context,
    Widget child,
    double height,
    ({Color fore, Color back, Color border}) c,
  ) {
    const blurSigma = 8.0;
    final enabled = model.isEnabled && !model.isLoading;
    final overlayColor = c.fore.withValues(alpha: 0.12);
    return ClipRRect(
      borderRadius: BorderRadius.circular(model.borderRadius),
        child: Material(
        color: AppColors.transparent,
        child: InkWell(
          onTap: _effectiveOnPressed,
          borderRadius: BorderRadius.circular(model.borderRadius),
          child: SizedBox(
            height: height,
            width: model.isExpanded ? double.infinity : null,
            child: enabled
                ? Stack(
                    fit: StackFit.expand,
                    children: [
                      BackdropFilter(
                        filter: ImageFilter.blur(
                          sigmaX: blurSigma,
                          sigmaY: blurSigma,
                        ),
                        child: const SizedBox.expand(),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            model.borderRadius,
                          ),
                          color: overlayColor,
                        ),
                      ),
                      Center(child: child),
                    ],
                  )
                : Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(model.borderRadius),
                      color: c.back,
                    ),
                    alignment: Alignment.center,
                    child: child,
                  ),
          ),
        ),
      ),
    );
  }
}
