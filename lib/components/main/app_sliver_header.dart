import 'package:flutter/material.dart';

class AppSliverHeader extends StatelessWidget {
  const AppSliverHeader({
    super.key,
    required this.child,
    required this.minExtent,
    required this.maxExtent,
    this.pinned = false,
    this.floating = false,
  });

  final Widget child;
  final double minExtent;
  final double maxExtent;
  final bool pinned;
  final bool floating;

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      pinned: pinned,
      floating: floating,
      delegate: _AppSliverHeaderDelegate(
        child: child,
        minExtent: minExtent,
        maxExtent: maxExtent,
      ),
    );
  }
}

class _AppSliverHeaderDelegate extends SliverPersistentHeaderDelegate {
  _AppSliverHeaderDelegate({
    required this.child,
    required double minExtent,
    required double maxExtent,
  }) : _minExtent = minExtent,
       _maxExtent = maxExtent;

  final Widget child;
  final double _minExtent;
  final double _maxExtent;

  @override
  double get minExtent => _minExtent;

  @override
  double get maxExtent => _maxExtent;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return child;
  }

  @override
  bool shouldRebuild(covariant _AppSliverHeaderDelegate oldDelegate) {
    return oldDelegate.child != child ||
        oldDelegate._minExtent != _minExtent ||
        oldDelegate._maxExtent != _maxExtent;
  }
}
