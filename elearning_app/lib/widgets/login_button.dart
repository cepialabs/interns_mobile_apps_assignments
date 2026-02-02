import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  final VoidCallback onTap;
  final String label;
  final TextStyle? textStyle;
  const LoginButton({
    super.key,
    this.label = 'Login',
    required this.onTap,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onTap,
        child: Text(label, style: textStyle),
      ),
    );
  }
}
