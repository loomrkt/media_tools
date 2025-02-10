import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  static const List<IconData> iconList = [
    Icons.home,
    Icons.person,
  ];

  int _getSelectedIndex(BuildContext context) {
    final routeLocation = GoRouterState.of(context).uri.path;
    return switch (routeLocation) {
      '/profile' => 1,
      _ => 0,
    };
  }

  void _handleTap(BuildContext context, int index) {
    switch (index) {
      case 0:
        context.goNamed('home');
      case 1:
        context.goNamed('profile');
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBottomNavigationBar(
      icons: iconList,
      activeIndex: _getSelectedIndex(context),
      gapLocation: GapLocation.center,
      notchSmoothness: NotchSmoothness.defaultEdge,
      leftCornerRadius: 15,
      rightCornerRadius: 15,
      onTap: (index) => _handleTap(context, index),
      // Add other necessary parameters
    );
  }
}