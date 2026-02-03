import 'package:flutter/material.dart';
import '../../../../models/course_model.dart';

class TitleSection extends StatelessWidget {
  final CourseModel course;
  const TitleSection({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(course.title, style: theme.textTheme.headlineMedium),
        const SizedBox(height: 6),
        Text(course.description ?? "", style: theme.textTheme.bodyMedium),
        const SizedBox(height: 16),
      ],
    );
  }
}
