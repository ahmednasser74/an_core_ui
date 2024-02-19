import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class AppCacheNetworkImage extends StatelessWidget {
  const AppCacheNetworkImage({
    Key? key,
    required this.imageUrl,
    this.errorWidget,
  }) : super(key: key);
  final String imageUrl;
  final Widget? errorWidget;

  @override
  Widget build(BuildContext context) {
    if (imageUrl.startsWith('http')) {
      return CachedNetworkImage(
        imageUrl: imageUrl,
        fit: BoxFit.cover,
        errorWidget: (context, url, error) => errorWidget ?? const SizedBox.shrink(),
      );
    }
    return Image.file(
      File(imageUrl),
      fit: BoxFit.cover,
      errorBuilder: (context, error, stackTrace) => errorWidget ?? const SizedBox.shrink(),
    );
  }
}
