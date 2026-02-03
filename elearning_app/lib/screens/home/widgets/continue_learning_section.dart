import '../model/continue_learning_model.dart';

import 'continue_learn_card.dart';
import 'network_image_widget.dart';
import 'section_header_widget.dart';
import 'package:flutter/material.dart';

class ContinueLearningSection extends StatelessWidget {
  final ContinueLearningModel data;

  const ContinueLearningSection({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeaderWidget(
          title: 'Continue Learning',
          viewAllText: 'View All',
          onViewAll: () {},
        ),
        const SizedBox(height: 10),
        ContinueLearnCard(
          title: data.title,
          instructor: data.instructor,
          progress: data.progress,
          lastLesson: data.lastLesson,
          thumbnail: NetworkImageWidget(url: data.thumbnail),
          onResume: () {},
        ),
        const SizedBox(height: 30),
      ],
    );
  }
}
