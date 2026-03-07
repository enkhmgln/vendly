import 'package:flutter/material.dart';

class AppImagePlaceholder extends StatelessWidget {
  const AppImagePlaceholder({
    super.key,
    this.icon,
    this.iconSize = 48,
    this.backgroundColor,
  });

  final Widget? icon;
  final double iconSize;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final color = backgroundColor ?? cs.surfaceContainerHighest;
    return Container(
      alignment: Alignment.center,
      color: color,
      child: icon ??
          Icon(
            Icons.image_outlined,
            size: iconSize,
            color: cs.outline,
          ),
    );
  }
}
