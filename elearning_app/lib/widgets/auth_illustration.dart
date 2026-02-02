import 'package:flutter/material.dart';

class AuthIllustration extends StatelessWidget {
  final String imagePath;

  const AuthIllustration({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Image.network(
        imagePath,
        height: 180, // Image size
        fit: BoxFit.contain,
      ),
    );
  }
}
