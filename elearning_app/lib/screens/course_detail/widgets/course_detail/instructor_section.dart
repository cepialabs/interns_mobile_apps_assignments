import 'package:flutter/material.dart';
import '../../../../models/course_model.dart';

class InstructorSection extends StatelessWidget {
  final CourseModel course;
  const InstructorSection({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: CircleAvatar(
        backgroundImage: NetworkImage(course.instructorImage ?? ""),
      ),
      title: Text(course.instructorName ?? ""),
      subtitle: Text(course.instructorRole ?? ""),
    );
  }
}
