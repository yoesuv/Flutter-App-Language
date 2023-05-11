import 'package:app_language/src/ui/home_screen.dart';
import 'package:flutter/material.dart';

class AppRoute {
  static Route<dynamic> routes(RouteSettings settings) {
    switch (settings.name) {
      case '/' :
        return MaterialPageRoute(builder: (context) {
          return const HomeScreen();
        });
      default:
        return MaterialPageRoute(builder: (context) {
          return const Scaffold(
            body: Center(
              child: Text('Page Not Found'),
            ),
          );
        });
    }
  }
}