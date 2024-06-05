import 'package:flutter/material.dart';
import 'package:flutter_movie_explorer/ui/splash/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      initialRoute: SplashScreen.tag,
    );
  }
}
