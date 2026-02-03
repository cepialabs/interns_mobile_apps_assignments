import 'continue_learning_model.dart';
import 'development_course_model.dart';
import 'top_design_course_model.dart';
import 'trending_course_model.dart';

class HomeDataModel {
  final ContinueLearningModel continueLearning;
  final List<TrendingCourseModel> trendingCourses;
  final List<TopDesignCourseModel> topDesignCourses;
  final List<DevelopmentCourseModel> developmentCourses;

  HomeDataModel({
    required this.continueLearning,
    required this.trendingCourses,
    required this.topDesignCourses,
    required this.developmentCourses,
  });

  factory HomeDataModel.fromJson(Map<String, dynamic> json) {
    return HomeDataModel(
      continueLearning: ContinueLearningModel.fromJson(
        json['continue_learning'],
      ),
      trendingCourses: (json['trending_courses'] as List)
          .map((e) => TrendingCourseModel.fromJson(e))
          .toList(),
      topDesignCourses: (json['top_design_courses'] as List)
          .map((e) => TopDesignCourseModel.fromJson(e))
          .toList(),
      developmentCourses: (json['development_courses'] as List)
          .map((e) => DevelopmentCourseModel.fromJson(e))
          .toList(),
    );
  }
}
