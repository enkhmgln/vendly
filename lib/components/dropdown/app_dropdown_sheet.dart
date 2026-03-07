import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
    final theme = Theme.of(context);
    final cs = theme.colorScheme;
    final background = cs.surface;
    final textColor = cs.onSurface;

    return Container(
      decoration: BoxDecoration(
        color: background,
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
                        color: cs.outline.withValues(alpha: 0.6),
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      title,
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: textColor,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Divider(
                      height: 1,
                      color: cs.outline.withValues(alpha: 0.5),
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
                        style: theme.textTheme.bodyLarge?.copyWith(
                          color: textColor,
                        ),
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
