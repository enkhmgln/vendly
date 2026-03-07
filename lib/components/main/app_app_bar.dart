import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/app/theme/app_colors.dart';
import '/app/theme/app_text_styles.dart';

class AppAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AppAppBar({
    super.key,
    this.titleText,
    this.title,
    this.leading,
    this.actions,
    this.bottom,
    this.backgroundColor,
    this.foregroundColor,
    this.showLeading = true,
  });

  final String? titleText;
  final Widget? title;
  final Widget? leading;
  final List<Widget>? actions;
  final PreferredSizeWidget? bottom;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final bool showLeading;

  static const double _leadingButtonSize = 40;
  static const double _leadingIconSize = 22;
  static const double _leadingLeftGap = 16;

  static Widget get _defaultLeading => Row(
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
              onTap: () => Get.back(),
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

  @override
  Size get preferredSize {
    final bottomHeight = bottom?.preferredSize.height ?? 0;
    return Size.fromHeight(kToolbarHeight + bottomHeight);
  }

  @override
  Widget build(BuildContext context) {
    final resolvedBackground = backgroundColor ?? AppColors.background;
    final resolvedForeground = foregroundColor ?? AppColors.textPrimary;
    final resolvedLeading = showLeading
        ? (leading ?? _defaultLeading)
        : const SizedBox.shrink();

    return AppBar(
      backgroundColor: resolvedBackground,
      foregroundColor: resolvedForeground,
      centerTitle: true,
      elevation: 0,
      automaticallyImplyLeading: showLeading,
      leading: resolvedLeading,
      leadingWidth: showLeading ? _leadingLeftGap + _leadingButtonSize : 0,
      actions: actions,
      bottom: bottom,
      title:
          title ??
          (titleText != null
              ? Text(
                  titleText!,
                  style: AppTextStyles.titleLargeBold.copyWith(
                    color: resolvedForeground,
                  ),
                )
              : null),
    );
  }
}
