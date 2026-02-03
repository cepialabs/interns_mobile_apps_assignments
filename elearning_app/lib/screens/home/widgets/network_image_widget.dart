import 'package:flutter/material.dart';

class NetworkImageWidget extends StatelessWidget {
  final String url;
  final BoxFit fit;

  const NetworkImageWidget({
    super.key,
    required this.url,
    this.fit = BoxFit.cover,
  });

  @override
  Widget build(BuildContext context) {
    return Image.network(
      url,
      fit: fit,
      loadingBuilder: (context, child, progress) {
        if (progress == null) return child;
        return const Center(child: CircularProgressIndicator(strokeWidth: 2));
      },
      errorBuilder: (_, __, ___) => const Icon(Icons.broken_image, size: 40),
    );
  }
}
