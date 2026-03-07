import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/app/theme/app_colors.dart';
import '/app/theme/app_text_styles.dart';
import 'app_dropdown_item.dart';

class AppDropdownSheet<T> extends StatelessWidget {
  const AppDropdownSheet({super.key, required this.title, required this.items});

  final String title;
  final List<AppDropdownItem<T>> items;

  Future<AppDropdownItem<T>?> show() {
    return Get.bottomSheet<AppDropdownItem<T>>(
      this,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
      ),
      child: DraggableScrollableSheet(
        initialChildSize: 0.5,
        maxChildSize: 0.8,
        minChildSize: 0.3,
        expand: false,
        builder: (context, scrollController) {
          return CustomScrollView(
            controller: scrollController,
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 12),
                    Container(
                      width: 40,
                      height: 4,
                      decoration: BoxDecoration(
                        color: AppColors.outline.withValues(alpha: 0.6),
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      title,
                      style: AppTextStyles.titleMediumBold.copyWith(color: AppColors.textPrimary),
                    ),
                    const SizedBox(height: 8),
                    Divider(
                      height: 1,
                      color: AppColors.outline.withValues(alpha: 0.5),
                    ),
                  ],
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
                  final item = items[index];
                  return Material(
                    color: Colors.transparent,
                    child: ListTile(
                      title: Text(
                        item.name,
                        style: AppTextStyles.bodyLarge.copyWith(color: AppColors.textPrimary),
                      ),
                      onTap: () => Get.back(result: item),
                    ),
                  );
                }, childCount: items.length),
              ),
            ],
          );
        },
      ),
    );
  }
}
