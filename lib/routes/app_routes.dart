import 'package:flutter/material.dart';
import 'package:flutter_movie_explorer/ui/splash/splash_screen.dart';

class AppRoutes {
  static Route generateRoutes(RouteSettings settings) {
    Widget screen = getScreenNullable(settings) ?? const SplashScreen();

    return MaterialPageRoute(builder: (context) => screen, settings: settings);
  }

  static Widget? getScreenNullable(RouteSettings settings) {
    switch (settings.name) {
      case SplashScreen.tag:
        return const SplashScreen();
      default:
        return null;
    }
  }
}
