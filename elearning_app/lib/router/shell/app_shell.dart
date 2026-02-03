import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../widgets/app_bottom_nav.dart';

class AppShell extends StatelessWidget {
  final Widget child;

  const AppShell({super.key, required this.child});

  int _locationToIndex(BuildContext context) {
    final location = GoRouterState.of(context).uri.toString();

    if (location.startsWith('/')) return 0;

    if (location.startsWith('/explore')) return 1;
    if (location.startsWith('/my-courses')) return 2;
    // if (location.startsWith('/profile')) return 3;
    if (location.startsWith('/profile')) return 3;

    return 0;
  }

  @override
  Widget build(BuildContext context) {
    final currentIndex = _locationToIndex(context);

    return Scaffold(
      body: child,
      bottomNavigationBar: AppBottomNav(
        currentIndex: currentIndex,
        onTap: (index) {
          switch (index) {
            case 0:
              context.go('/');
            case 1:
              context.go('/explore');
            case 2:
              context.go('/my-courses');
            case 3:
              context.go('/profile');
          }
        },
      ),
    );
  }
}
