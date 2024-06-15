import 'package:flutter/material.dart';
import 'package:flutter_movie_explorer/ui/home/home_screen.dart';
import 'package:flutter_movie_explorer/utils/colors/custom_colors.dart';
import 'package:shimmer/shimmer.dart';

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
      backgroundColor: CustomColors.black,
      body: body(),
    );
  }

  Widget body() {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          shimmerContainer(),
          const Text(
            "Movie Explorer",
            style: TextStyle(
              fontSize: 36,
              color: CustomColors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget shimmerContainer() {
    return Shimmer(
      direction: ShimmerDirection.ltr,
      gradient: const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          CustomColors.darkNavy,
          Color(0xFF000435),
          Color(0xFF080E4B),
        ],
      ),
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.blue,
      ),
    );
  }

  void navigateToHome() {
    Navigator.pushReplacementNamed(context, HomeScreen.tag);
  }
}
