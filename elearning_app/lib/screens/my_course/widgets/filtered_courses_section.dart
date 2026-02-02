import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../models/course_model.dart';
import 'course_tile.dart';

class FilteredCoursesSection extends StatelessWidget {
  final Future<List<Course>> coursesFuture;
  final List<Course> Function(List<Course>) applyFilter;

  const FilteredCoursesSection({
    super.key,
    required this.coursesFuture,
    required this.applyFilter,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Course>>(
      future: coursesFuture,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const SizedBox.shrink();
        }

        final courses = applyFilter(snapshot.data!);

        if (courses.isEmpty) {
          return const Padding(
            padding: EdgeInsets.all(24),
            child: Center(child: Text("No courses found")),
          );
        }

        return Column(
          children: courses
              .map(
                (course) => CourseTile(
                  course: course,
                  onTap: () {
                    if (course.isCertified) {
                      context.push('/certificate/${course.id}');
                    } else {
                      context.go('/course-details/${course.id}');
                    }
                  },
                  // onTap: () {
                  //   context.go('/course-details/${course.id}');
                  // },
                ),
              )
              .toList(),
        );
      },
    );
  }
}
