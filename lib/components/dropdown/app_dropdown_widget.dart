import 'package:flutter/material.dart';

import 'app_dropdown_item.dart';
import 'app_dropdown_sheet.dart';

class AppDropdownWidget<T> extends StatelessWidget {
  const AppDropdownWidget({
    super.key,
    required this.label,
    required this.items,
    this.selectedItem,
    this.sheetTitle,
    this.onSelected,
  });

  final String label;
  final List<AppDropdownItem<T>> items;
  final AppDropdownItem<T>? selectedItem;
  final String? sheetTitle;
  final ValueChanged<AppDropdownItem<T>>? onSelected;

  Future<void> _showSheet(BuildContext context) async {
    if (items.isEmpty) return;
    final result = await AppDropdownSheet<T>(
      title: sheetTitle ?? label,
      items: items,
    ).show();
    if (result != null) {
      onSelected?.call(result);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;
    final surface = cs.surfaceContainerHighest;
    final textColor = cs.onSurface;
    final hintColor = cs.outline;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (label.isNotEmpty) ...[
          Text(
            label,
            style: theme.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w500,
              color: hintColor,
            ),
          ),
          const SizedBox(height: 8),
        ],
        Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () => _showSheet(context),
            borderRadius: BorderRadius.circular(12),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              decoration: BoxDecoration(
                color: surface,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: hintColor.withValues(alpha: 0.6),
                  width: 1,
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      selectedItem?.name ?? 'Select',
                      style: theme.textTheme.bodyLarge?.copyWith(
                        color: selectedItem != null ? textColor : hintColor,
                      ),
                    ),
                  ),
                  Icon(Icons.expand_more, color: hintColor, size: 24),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
