import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:media/Views/components/bottomNavbar.dart';
import 'package:media/Views/pages/home.dart';
import 'package:media/Views/pages/test.dart';
import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';

void main() => runApp(const MyApp());

final _router = GoRouter(
  initialLocation: '/splash',
  routes: [
    GoRoute(
      path: '/splash',
      name: 'splash',
      pageBuilder: (context, state) => const MaterialPage(child: SplashScreen()),
    ),
    ShellRoute(
      builder: (context, state, child) => Scaffold(
        body: child,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Add FAB action
          },
          shape: CircleBorder(),
          child: const Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: const BottomNavBar(),
      ),
      routes: [
        GoRoute(
          path: '/home',
          name: 'home',
          pageBuilder: (context, state) => const MaterialPage(child: Home()),
        ),
        GoRoute(
          path: '/profile',
          name: 'profile',
          pageBuilder: (context, state) => const MaterialPage(child: Test()),
        ),
      ],
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      debugShowCheckedModeBanner: false,
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FlutterSplashScreen.scale(
      gradient: const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color.fromARGB(255, 0, 0, 0),
          Color.fromARGB(255, 0, 0, 0),
        ],
      ),
      childWidget: SizedBox(
        height: 100,
        child: Image.asset("assets/mediaLogo.png"),
      ),
      duration: const Duration(milliseconds: 1500),
      animationDuration: const Duration(milliseconds: 1000),
      onAnimationEnd: () {
        // Naviguer vers l'écran principal après la fin de l'animation
        GoRouter.of(context).go('/home');
      },
      nextScreen: const Home(), // Vous pouvez également définir un écran suivant ici
    );
  }
}