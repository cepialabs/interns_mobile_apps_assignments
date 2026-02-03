import 'package:flutter/material.dart';
import '../../../../models/course_model.dart';

class CartItemTile extends StatelessWidget {
  final CourseModel course;
  final VoidCallback onDelete;

  const CartItemTile({super.key, required this.course, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.only(bottom: 16),
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(
            course.image,
            width: 60,
            height: 60,
            fit: BoxFit.cover,
          ),
        ),
        title: Text(
          course.title,
          style: theme.textTheme.headlineMedium?.copyWith(fontSize: 16),
        ),
        subtitle: Text("\$${course.price}", style: theme.textTheme.bodyMedium),
        trailing: IconButton(
          icon: const Icon(Icons.delete, color: Colors.red),
          onPressed: onDelete,
        ),
      ),
    );
  }
}
