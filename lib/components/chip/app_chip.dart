import 'package:flutter/material.dart';

class AppChip extends StatelessWidget {
  const AppChip({
    super.key,
    required this.title,
    required this.selected,
    this.onPressed,
  });

  final String title;
  final bool selected;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final surface = cs.surfaceContainerHighest;
    final textColor = cs.onSurface;
    final hintColor = cs.outline;

    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        backgroundColor: surface,
        foregroundColor: selected ? cs.primary : hintColor,
        side: BorderSide(
          width: selected ? 1.5 : 1,
          color: selected ? cs.primary : hintColor.withValues(alpha: 0.6),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Text(
        title,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
          fontWeight: FontWeight.w500,
          color: selected ? cs.primary : textColor,
        ),
      ),
    );
  }
}
