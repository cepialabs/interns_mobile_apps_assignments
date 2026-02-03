import 'network_image_widget.dart';
import 'package:flutter/material.dart';
import '../model/development_course_model.dart';
import '../widgets/development_card.dart';
import '../widgets/section_header_widget.dart';

class DevelopmentSection extends StatelessWidget {
  final List<DevelopmentCourseModel> courses;

  const DevelopmentSection({super.key, required this.courses});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeaderWidget(
          title: 'Development',
          viewAllText: 'See All',
          onViewAll: () {},
        ),
        const SizedBox(height: 10),
        Column(
          children: courses.map((course) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: DevelopmentCard(
                title: course.title,
                subtitle: course.subtitle,
                isBestSeller: course.isBestSeller,
                thumbnail: NetworkImageWidget(url: course.thumbnail),

                onTap: () {},
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
