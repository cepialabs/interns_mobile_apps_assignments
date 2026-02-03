import 'package:flutter/material.dart';
import 'package:touchable_opacity/touchable_opacity.dart';

class SearchBarWidget extends StatelessWidget {
  final VoidCallback onTap;
  final VoidCallback? onFilterTap;

  const SearchBarWidget({super.key, required this.onTap, this.onFilterTap});

  @override
  Widget build(BuildContext context) {
    return TouchableOpacity(
      onTap: onTap,
      activeOpacity: 0.7,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Row(
          children: [
            const Icon(Icons.search, color: Colors.grey),
            const SizedBox(width: 8),

            const Expanded(
              child: Text(
                'Search for courses or skills',
                style: TextStyle(color: Colors.grey, fontSize: 14),
              ),
            ),

            if (onFilterTap != null)
              TouchableOpacity(
                onTap: onFilterTap,
                activeOpacity: 0.7,
                child: const Icon(Icons.tune, color: Color(0xFF2F6FED)),
              ),
          ],
        ),
      ),
    );
  }
}
