import 'package:flutter/material.dart';
import 'package:touchable_opacity/touchable_opacity.dart';

class SectionHeaderWidget extends StatelessWidget {
  final String title;
  final VoidCallback? onViewAll;
  final String viewAllText;

  const SectionHeaderWidget({
    super.key,
    required this.title,
    this.onViewAll,
    this.viewAllText = 'View All',
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        const Spacer(),

        // Show only if callback is provided
        if (onViewAll != null)
          TouchableOpacity(
            onTap: onViewAll,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              child: Text(
                viewAllText,
                style: const TextStyle(
                  color: Colors.blueAccent,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
