import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class AppRefresher extends StatelessWidget {
  const AppRefresher({
    super.key,
    required this.controller,
    required this.child,
    this.onRefresh,
    this.onLoading,
    this.enablePullDown = true,
    this.enablePullUp = false,
  });

  final RefreshController controller;
  final Widget child;

  final Future<void> Function()? onRefresh;

  final Future<void> Function()? onLoading;
  final bool enablePullDown;
  final bool enablePullUp;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return SmartRefresher(
      controller: controller,
      enablePullDown: enablePullDown,
      enablePullUp: enablePullUp,
      onRefresh: onRefresh,
      onLoading: onLoading,
      header: MaterialClassicHeader(
        color: cs.primary,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      footer: CustomFooter(
        builder: (footerContext, mode) {
          if (mode == LoadStatus.loading) {
            final primary = Theme.of(footerContext).colorScheme.primary;
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Center(
                child: SizedBox.square(
                  dimension: 24,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    valueColor: AlwaysStoppedAnimation<Color>(primary),
                  ),
                ),
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
      child: child,
    );
  }
}
