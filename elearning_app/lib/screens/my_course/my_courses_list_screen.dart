import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../models/course_model.dart';
import 'widgets/course_tile.dart';

class MyCoursesListScreen extends StatefulWidget {
  final List<Course> courses;
  final String initialFilter;

  const MyCoursesListScreen({
    super.key,
    required this.courses,
    required this.initialFilter,
  });

  @override
  State<MyCoursesListScreen> createState() => _MyCoursesListScreenState();
}

class _MyCoursesListScreenState extends State<MyCoursesListScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _tabIndexFromFilter(String filter) {
    switch (filter) {
      case 'In Progress':
        return 1;
      case 'Completed':
        return 2;
      case 'Certifications':
      case 'Certified':
        return 3;
      default:
        return 0; // All
    }
  }

  @override
  void initState() {
    super.initState();

    final initialIndex = _tabIndexFromFilter(widget.initialFilter);

    _tabController = TabController(
      length: 4,
      vsync: this,
      initialIndex: initialIndex,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  List<Course> _filteredCourses(int index) {
    switch (index) {
      case 1: // In Progress
        return widget.courses
            .where((c) => c.progress > 0 && c.progress < 1.0)
            .toList();

      case 2: // Completed
        return widget.courses.where((c) => c.progress >= 1.0).toList();

      case 3: // Certified
        return widget.courses.where((c) => c.isCertified).toList();

      default: // All
        return widget.courses;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
        title: Text(widget.initialFilter),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'All'),
            Tab(text: 'In Progress'),
            Tab(text: 'Completed'),
            Tab(text: 'Certified'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: List.generate(4, (index) {
          final courses = _filteredCourses(index);

          if (courses.isEmpty) {
            return const Center(child: Text('No courses found'));
          }

          return ListView.builder(
            itemCount: courses.length,
            itemBuilder: (context, i) {
              return CourseTile(
                course: courses[i],
                onTap: () {
                  if (courses[i].isCertified) {
                    context.push('/certificate/${courses[i].id}');
                  } else {
                    context.go('/course-details/${courses[i].id}');
                  }
                },
              );
            },
          );
        }),
      ),
    );
  }
}
