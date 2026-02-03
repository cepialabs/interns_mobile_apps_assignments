import 'package:flutter/material.dart';

class RatingSection extends StatelessWidget {
  const RatingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Course Rating",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 16),
        Row(
          children: [
            Column(
              children: const [
                Text("4.8",
                    style:
                        TextStyle(fontSize: 36, fontWeight: FontWeight.bold)),
                SizedBox(height: 8),
                Text("2,450 reviews",
                    style: TextStyle(color: Colors.grey)),
              ],
            ),
            const SizedBox(width: 24),
            Expanded(
              child: Column(
                children: const [
                  LinearProgressIndicator(value: 0.8),
                  LinearProgressIndicator(value: 0.12),
                  LinearProgressIndicator(value: 0.05),
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}
