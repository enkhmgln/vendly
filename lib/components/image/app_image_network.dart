import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'app_image_placeholder.dart';

class AppImageNetwork extends StatelessWidget {
  const AppImageNetwork({
    super.key,
    required this.imageUrl,
    this.fit = BoxFit.cover,
    this.placeholderSize = 40,
    this.width,
    this.height,
  });

  final String imageUrl;
  final BoxFit fit;
  final double placeholderSize;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      fit: fit,
      width: width,
      height: height,
      placeholder: (_, _) => SizedBox(
        width: width,
        height: height,
        child: AppImagePlaceholder(iconSize: placeholderSize),
      ),
      errorWidget: (_, _, _) => SizedBox(
        width: width,
        height: height,
        child: AppImagePlaceholder(iconSize: placeholderSize),
      ),
    );
  }
}
