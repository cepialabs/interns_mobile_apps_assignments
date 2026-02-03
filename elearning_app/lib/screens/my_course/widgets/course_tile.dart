import 'package:flutter/material.dart';
import '../../../models/course_model.dart';

class CourseTile extends StatelessWidget {
  final Course course;
  final VoidCallback onTap;

  const CourseTile({super.key, required this.course, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // IMAGE
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                course.image,
                width: 64,
                height: 64,
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(width: 12),

            // MAIN CONTENT
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    course.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),

                  const SizedBox(height: 8),

                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // LEFT: status / progress
                      Expanded(
                        child: Row(
                          children: [
                            if (course.progress >= 1.0) ...[
                              _statusChip('Completed'),

                              if (course.isCertified) ...[
                                const SizedBox(width: 8),
                                _statusChip('Certified'),
                              ],
                            ] else if (course.isCertified) ...[
                              _statusChip('Certified'),
                            ] else ...[
                              Expanded(
                                child: LinearProgressIndicator(
                                  value: course.progress,
                                  minHeight: 6,
                                ),
                              ),
                            ],
                          ],
                        ),
                      ),

                      // RIGHT: percentage (vertically centered)
                      if (course.progress < 1.0) ...[
                        const SizedBox(width: 8),
                        Text(
                          '${(course.progress * 100).toInt()}%',
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: Colors.blueGrey,
                          ),
                        ),
                      ],
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _statusChip(String text) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
    decoration: BoxDecoration(
      color: Colors.green.withValues(alpha: 0.1),
      borderRadius: BorderRadius.circular(12),
    ),
    child: Text(
      text,
      style: const TextStyle(
        color: Colors.green,
        fontSize: 12,
        fontWeight: FontWeight.w600,
      ),
    ),
  );
}
