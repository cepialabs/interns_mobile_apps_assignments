import 'package:flutter/material.dart';

class MyCoursesHeader extends StatelessWidget {
  const MyCoursesHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16),
      child: Text(
        "My Courses",
        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
      ),
    );
  }
}
