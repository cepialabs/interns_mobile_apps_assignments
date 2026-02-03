import '../model/trending_course_model.dart';
import 'network_image_widget.dart';
import 'section_header_widget.dart';
import 'trending_course_card.dart';
import 'package:flutter/material.dart';

class TrendingSection extends StatelessWidget {
  final List<TrendingCourseModel> courses;

  const TrendingSection({super.key, required this.courses});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeaderWidget(
          title: 'Trending Now',
          viewAllText: 'See All',
          onViewAll: () {},
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 250,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: courses.length,
            separatorBuilder: (_, __) => const SizedBox(width: 16),
            itemBuilder: (context, index) {
              final course = courses[index];
              return TrendingCourseCard(
                title: course.title,
                rating: course.rating,
                students: course.students,
                thumbnail: NetworkImageWidget(url: course.thumbnail),
                onTap: () {},
              );
            },
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
