import '../model/top_design_course_model.dart';
import 'section_header_widget.dart';
import 'top_in_card.dart';
import 'package:flutter/material.dart';

class TopDesignSection extends StatelessWidget {
  final List<TopDesignCourseModel> courses;

  const TopDesignSection({super.key, required this.courses});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeaderWidget(
          title: 'Top In Design',
          viewAllText: 'See All',
          onViewAll: () {},
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 240,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: courses.length,
            separatorBuilder: (_, __) => const SizedBox(width: 16),
            itemBuilder: (context, index) {
              final course = courses[index];
              return TopInCard(
                title: course.title,
                price: course.price,
                thumbnail: Container(
                  color: Colors.black,
                  alignment: Alignment.center,
                  child: Text(
                    course.title.substring(0, 3).toUpperCase(),
                    style: const TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 6,
                      color: Colors.white,
                    ),
                  ),
                ),
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
