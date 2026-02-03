import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../models/course_model.dart';
import '../../services/my_courses_service.dart';
import '../../services/explore_service.dart';
import 'widgets/my_courses_header.dart';
import 'widgets/continue_learning_section.dart';
import 'widgets/category.dart';
import 'widgets/recommended_section.dart';

class MyCoursesScreen extends StatefulWidget {
  const MyCoursesScreen({super.key});

  @override
  State<MyCoursesScreen> createState() => _MyCoursesScreenState();
}

class _MyCoursesScreenState extends State<MyCoursesScreen> {
  final MyCoursesService _myCoursesService = MyCoursesService();
  final ExploreService _exploreService = ExploreService();

  late Future<List<Course>> _myCoursesFuture;
  late Future<List<Course>> _recommendedFuture;

  // String _selectedFilter = "My Courses";

  final List<String> _filters = [
    "My Courses",
    "In Progress",
    "Completed",
    "Certifications",
  ];

  @override
  void initState() {
    super.initState();
    _myCoursesFuture = _myCoursesService.getMyCourses();
    _recommendedFuture = _exploreService.getPopularCourses();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF7F7F7),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyCoursesHeader(),
              ContinueLearningSection(
                coursesFuture: _myCoursesFuture,
                onContinue: (course) {
                  context.go('/course-details/${course.id}');
                },
              ),

              Category(
                filters: _filters,
                selected: null, // no local selection anymore
                onSelect: (value) async {
                  final courses = await _myCoursesFuture;

                  context.push(
                    '/my-courses/list',
                    extra: {'filter': value, 'courses': courses},
                  );
                },
              ),

              RecommendedSection(
                coursesFuture: _recommendedFuture,
                onCourseTap: (course) {
                  context.go('/course-details/${course.id}');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
