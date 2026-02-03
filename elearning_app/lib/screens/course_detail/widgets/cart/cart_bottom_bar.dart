import 'package:flutter/material.dart';

class CartBottomBar extends StatelessWidget {
  final double totalPrice;
  const CartBottomBar({super.key, required this.totalPrice});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
      ),
      child: Row(
        children: [
          Text("Total: \$${totalPrice.toStringAsFixed(2)}",
              style: theme.textTheme.headlineMedium?.copyWith(fontSize: 18)),
          const Spacer(),
          ElevatedButton(
            onPressed: () {},
            child: const Text("Checkout"),
          )
        ],
      ),
    );
  }
}
