import 'dart:convert';
import 'package:flutter/services.dart';

// import '../models/featured_course_model.dart';
import '../models/category_model.dart';
import '../models/course_model.dart';
// import '../models/popular_course_model.dart';

class ExploreService {
  Future<Map<String, dynamic>> _loadData() async {
    final response = await rootBundle.loadString('assets/data/common.json');
    return json.decode(response);
  }

  Future<List<Course>> _getAllCourses() async {
    final data = await _loadData();
    final coursesJson = data['courseCatalog']['allCourses'] as List;

    return coursesJson.map((e) => Course.fromJson(e)).toList();
  }

  Future<List<Category>> getCategories() async {
    final data = await _loadData();
    final categoriesJson = data['courseCatalog']['categories'] as List;

    return categoriesJson.map((e) => Category.fromJson(e)).toList();
  }

  Future<List<Course>> getFeaturedCourses() async {
    final data = await _loadData();
    final featuredIds = List<int>.from(
      data['courseCatalog']['featuredCourseIds'],
    );

    final allCourses = await _getAllCourses();

    return allCourses.where((c) => featuredIds.contains(c.id)).toList();
  }

  Future<List<Course>> getPopularCourses() async {
    final data = await _loadData();
    final popularIds = List<int>.from(
      data['courseCatalog']['popularCourseIds'],
    );

    final allCourses = await _getAllCourses();

    return allCourses.where((c) => popularIds.contains(c.id)).toList();
  }
}
