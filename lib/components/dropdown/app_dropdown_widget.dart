import 'package:flutter/material.dart';

import '/app/theme/app_colors.dart';
import '/app/theme/app_text_styles.dart';
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (label.isNotEmpty) ...[
          Text(
            label,
            style: AppTextStyles.bodyMediumMedium.copyWith(color: AppColors.textSecondary),
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
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: AppColors.textSecondary.withValues(alpha: 0.6),
                  width: 1,
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      selectedItem?.name ?? 'Select',
                      style: AppTextStyles.bodyLarge.copyWith(
                        color: selectedItem != null
                            ? AppColors.textPrimary
                            : AppColors.textSecondary,
                      ),
                    ),
                  ),
                  Icon(
                    Icons.expand_more,
                    color: AppColors.textSecondary,
                    size: 24,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
