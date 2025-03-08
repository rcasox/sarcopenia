import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sarcopenia/screens/intro_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: GoRouter(
        initialLocation: '/',
        routes: [GoRoute(path: '/', builder: (_, __) => const IntroScreen())],
      ),
    );
  }
}
