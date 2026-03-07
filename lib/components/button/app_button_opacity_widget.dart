import 'package:flutter/material.dart';

class AppButtonOpacityWidget extends StatefulWidget {
  const AppButtonOpacityWidget({super.key, required this.child, this.onTap});

  final Widget child;
  final VoidCallback? onTap;

  @override
  State<AppButtonOpacityWidget> createState() => _AppButtonOpacityWidgetState();
}

class _AppButtonOpacityWidgetState extends State<AppButtonOpacityWidget> {
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 150),
      opacity: _pressed ? 0.6 : 1,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: widget.onTap,
        onTapDown: (_) => setState(() => _pressed = true),
        onTapUp: (_) => setState(() => _pressed = false),
        onTapCancel: () => setState(() => _pressed = false),
        child: widget.child,
      ),
    );
  }
}
