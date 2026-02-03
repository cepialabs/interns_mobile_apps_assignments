import 'package:flutter/material.dart';
import '../../../../models/user_model.dart';

class StatsRow extends StatelessWidget {
  final UserModel user;
  const StatsRow({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    Widget item(String number, String title) => Column(
      children: [
        Text(
          number,
          style: TextStyle(
            color: theme.primaryColor,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(title, style: theme.textTheme.bodyMedium),
      ],
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        item(user.courses.toString(), "Courses"),
        item(user.certificates.toString(), "Certificates"),
        item("${user.learningHours}h", "Learning Time"),
      ],
    );
  }
}
