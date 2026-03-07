import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'app_icon_model.dart';

class AppIconWidget extends StatelessWidget {
  const AppIconWidget({super.key, required this.model});

  final AppIconModel model;

  @override
  Widget build(BuildContext context) {
    final w = model.width ?? 24.0;
    final h = model.height ?? 24.0;
    final color = model.color ?? Theme.of(context).colorScheme.onSurface;

    switch (model.type) {
      case AppIconType.svg:
        return SvgPicture.asset(
          model.icon,
          width: w,
          height: h,
          colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
        );
      case AppIconType.asset:
        return Image.asset(model.icon, width: w, height: h, color: model.color);
    }
  }
}
