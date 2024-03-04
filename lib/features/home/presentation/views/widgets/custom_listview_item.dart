import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomBookImage extends StatelessWidget {
  const CustomBookImage({super.key, required this.imgURL});
  final String imgURL;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: AspectRatio(
        aspectRatio: 2.8 / 4,
        child: CachedNetworkImage(
          placeholder: (context, text) =>
              const Center(child: CircularProgressIndicator()),
          errorWidget: (context, url, error) => const Icon(
            Icons.error,
          ),
          fit: BoxFit.fill,
          imageUrl: imgURL,
        ),
      ),
    );
  }
}
