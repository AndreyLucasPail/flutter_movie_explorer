import 'package:flutter/material.dart';
import 'package:flutter_movie_explorer/ui/home/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static const tag = "/";

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(
      const Duration(seconds: 2),
    ).then(
      (value) => navigateToHome(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: body(),
    );
  }

  Widget body() {
    return const Center(
      child: Text(
        "Movie Explorer",
        style: TextStyle(
          fontSize: 36,
          color: Colors.orange,
        ),
      ),
    );
  }

  void navigateToHome() {
    Navigator.pushReplacementNamed(context, HomeScreen.tag);
  }
}
