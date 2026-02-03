import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BannerSection extends StatelessWidget {
  final String image;
  const BannerSection({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.network(image,
            height: 240, width: double.infinity, fit: BoxFit.cover),
        Positioned(
          top: 50,
          left: 16,
          child: CircleAvatar(
            backgroundColor: Colors.black54,
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => context.pop(), // ✅ go_router used
            ),
          ),
        ),
      ],
    );
  }
}
