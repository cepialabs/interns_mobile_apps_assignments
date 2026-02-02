import 'package:flutter/material.dart';

class NAMEField extends StatelessWidget {
  final TextEditingController controller;

  const NAMEField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: const InputDecoration(labelText: 'Name'),
    );
  }
}

// class NAMEField extends StatelessWidget {
//   const NAMEField({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       decoration: const InputDecoration(
//         labelText: 'Full Name',
//         hintText: 'jone doe',
//       ),
//     );
//   }
// }
