import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppDialog extends StatelessWidget {
  const AppDialog({
    super.key,
    this.insetPadding,
    this.borderRadius = 12,
    required this.child,
  });

  final EdgeInsets? insetPadding;
  final double borderRadius;
  final Widget child;

  static Future<T?> show<T>(Widget child, {EdgeInsets? insetPadding}) {
    return Get.dialog<T>(AppDialog(insetPadding: insetPadding, child: child));
  }

  @override
  Widget build(BuildContext context) {
    final surface = Theme.of(context).colorScheme.surface;
    return Dialog(
      backgroundColor: surface,
      surfaceTintColor: surface,
      insetPadding: insetPadding ?? const EdgeInsets.symmetric(horizontal: 24),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Padding(padding: const EdgeInsets.all(24), child: child),
    );
  }
}
