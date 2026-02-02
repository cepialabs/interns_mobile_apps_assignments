import 'dart:convert';
import 'package:flutter/services.dart';

import '../models/course_model.dart';

class MyCoursesService {
  Future<List<Course>> getMyCourses() async {
    final response = await rootBundle.loadString('assets/data/common.json');
    final data = json.decode(response);

    final allCoursesJson = data['courseCatalog']['allCourses'] as List;

    final purchasedIds = List<int>.from(data['student']['purchasedCourseIds']);

    final progressMap = Map<String, dynamic>.from(
      data['student']['courseProgress'],
    );

    final allCourses = allCoursesJson.map((e) => Course.fromJson(e)).toList();

    return allCourses
        .where((c) => purchasedIds.contains(c.id))
        .map((c) => c.copyWith(progress: progressMap[c.id.toString()] ?? 0.0))
        .toList();
  }

  Future<List<Course>> getContinueLearning() async {
    final courses = await getMyCourses();
    return courses.where((c) => c.progress > 0 && c.progress < 1).toList();
  }
}
