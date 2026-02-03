import 'package:flutter/material.dart';

class EmptyCartView extends StatelessWidget {
  const EmptyCartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Your cart is empty",
          style: Theme.of(context).textTheme.bodyMedium),
    );
  }
}
