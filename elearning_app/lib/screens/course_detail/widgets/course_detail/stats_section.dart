import 'package:flutter/material.dart';
import '../../../../models/course_model.dart';

class StatsSection extends StatelessWidget {
  final CourseModel course;
  const StatsSection({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        statCard(Icons.access_time, course.duration ?? "", "Duration"),
        statCard(Icons.bar_chart, course.level ?? "", "Level"),
        statCard(Icons.people, course.students ?? "", "Students"),
      ],
    );
  }

  Widget statCard(IconData icon, String value, String label) => Container(
    width: 100,
    padding: const EdgeInsets.all(12),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
    ),
    child: Column(
      children: [
        Icon(icon, color: Colors.blue),
        const SizedBox(height: 6),
        Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
        Text(label, style: const TextStyle(color: Colors.grey)),
      ],
    ),
  );
}
