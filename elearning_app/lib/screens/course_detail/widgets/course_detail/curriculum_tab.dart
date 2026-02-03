import 'package:flutter/material.dart';

class CurriculumTab extends StatelessWidget {
  const CurriculumTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, i) => ListTile(
        leading: CircleAvatar(child: Text("0${i + 1}")),
        title: const Text("Introduction to Design Tokens"),
        subtitle: const Text("15:30 mins"),
        trailing: Icon(Icons.play_circle_fill,
            color: Theme.of(context).primaryColor),
      ),
    );
  }
}
