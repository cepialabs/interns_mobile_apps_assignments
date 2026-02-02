import 'package:flutter/material.dart';
import '../../../models/course_model.dart';
import 'recommended_tile.dart';

class RecommendedSection extends StatelessWidget {
  final Future<List<Course>> coursesFuture;
  final void Function(Course) onCourseTap;

  const RecommendedSection({
    super.key,
    required this.coursesFuture,
    required this.onCourseTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Recommended for You",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          FutureBuilder<List<Course>>(
            future: coursesFuture,
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const CircularProgressIndicator();
              }

              final courses = snapshot.data!;

              if (courses.isEmpty) {
                return const Text("No recommendations available");
              }

              return Column(
                children: courses
                    .map(
                      (course) => RecommendedTile(
                        course: course,
                        onTap: () => onCourseTap(course),
                      ),
                    )
                    .toList(),
              );
            },
          ),
        ],
      ),
    );
  }
}
