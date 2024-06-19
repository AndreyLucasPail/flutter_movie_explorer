import 'package:flutter/material.dart';
import 'package:flutter_movie_explorer/ui/home/home_screen.dart';
import 'package:flutter_movie_explorer/ui/movie_screen/movie_screen.dart';
import 'package:flutter_movie_explorer/ui/search_screen/search_screen.dart';
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
      case HomeScreen.tag:
        return const HomeScreen();
      case MovieScreen.tag:
        return const MovieScreen();
      case SearchScreen.tag:
        return const SearchScreen();
      default:
        return null;
    }
  }
}
