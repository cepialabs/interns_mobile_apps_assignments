import 'package:flutter/material.dart';
import '../../../models/course_model.dart';

class ContinueLearningSection extends StatelessWidget {
  final Future<List<Course>> coursesFuture;
  final void Function(Course) onContinue;

  const ContinueLearningSection({
    super.key,
    required this.coursesFuture,
    required this.onContinue,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Continue Learning",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 210,
            child: FutureBuilder<List<Course>>(
              future: coursesFuture,
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                }

                final courses = snapshot.data!
                    .where((c) => c.progress > 0 && c.progress < 1)
                    .toList();

                if (courses.isEmpty) {
                  return const Center(child: Text("No courses in progress"));
                }

                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: courses.length,
                  itemBuilder: (context, index) {
                    final course = courses[index];
                    return _ContinueCard(course: course, onTap: onContinue);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _ContinueCard extends StatelessWidget {
  final Course course;
  final void Function(Course) onTap;

  const _ContinueCard({required this.course, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      margin: const EdgeInsets.only(right: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(course.image, height: 100, fit: BoxFit.cover),
          const SizedBox(height: 8),
          Text(course.title, maxLines: 1, overflow: TextOverflow.ellipsis),
          const SizedBox(height: 8),
          LinearProgressIndicator(value: course.progress),
          const SizedBox(height: 8),
          ElevatedButton(
            onPressed: () => onTap(course),
            child: const Text("Continue"),
          ),
        ],
      ),
    );
  }
}
