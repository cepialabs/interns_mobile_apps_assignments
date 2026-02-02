import 'package:flutter/material.dart';
import '../../../models/course_model.dart';
import '../../../services/my_courses_service.dart';

class CertificateScreen extends StatelessWidget {
  final int courseId;

  const CertificateScreen({super.key, required this.courseId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Certificate')),
      body: FutureBuilder<List<Course>>(
        future: MyCoursesService().getMyCourses(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final course = snapshot.data!.firstWhere((c) => c.id == courseId);

          return Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: Column(
                    children: [
                      const Icon(
                        Icons.workspace_premium,
                        size: 64,
                        color: Colors.green,
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'Certificate of Completion',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(course.title, textAlign: TextAlign.center),
                    ],
                  ),
                ),

                const Spacer(),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Download coming soon')),
                      );
                    },
                    icon: const Icon(Icons.download),
                    label: const Text('Download Certificate'),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
