import 'package:flutter/material.dart';
import 'package:get/get.dart';

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

  static Widget get _defaultLeading => IconButton(
        icon: const Icon(Icons.chevron_left),
        onPressed: () => Get.back(),
      );

  @override
  Size get preferredSize {
    final bottomHeight = bottom?.preferredSize.height ?? 0;
    return Size.fromHeight(kToolbarHeight + bottomHeight);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final appBarTheme = theme.appBarTheme;
    final resolvedBackground =
        backgroundColor ?? appBarTheme.backgroundColor ?? theme.colorScheme.surface;
    final resolvedForeground =
        foregroundColor ?? appBarTheme.foregroundColor ?? theme.colorScheme.onSurface;
    final resolvedLeading = showLeading ? (leading ?? _defaultLeading) : const SizedBox.shrink();

    return AppBar(
      backgroundColor: resolvedBackground,
      foregroundColor: resolvedForeground,
      centerTitle: true,
      elevation: 0,
      automaticallyImplyLeading: showLeading,
      leading: resolvedLeading,
      leadingWidth: showLeading ? null : 0,
      actions: actions,
      bottom: bottom,
      title:
          title ??
          (titleText != null
              ? Text(
                  titleText!,
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: resolvedForeground,
                  ),
                )
              : null),
    );
  }
}
