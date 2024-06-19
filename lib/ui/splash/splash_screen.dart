import 'package:flutter/material.dart';
import 'package:flutter_movie_explorer/ui/home/home_screen.dart';
import 'package:flutter_movie_explorer/utils/colors/custom_colors.dart';
import 'package:shimmer/shimmer.dart';
import 'dart:math' as math;

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static const tag = "/";

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 2),
  )..repeat();

  @override
  void initState() {
    super.initState();

    _controller.forward().whenComplete(() => navigateToHome());
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
          AnimatedBuilder(
            animation: _controller,
            builder: (_, child) {
              return Transform.rotate(
                angle: _controller.value * 2 * math.pi,
                child: const Text(
                  "Movie Explorer",
                  style: TextStyle(
                    fontSize: 36,
                    color: CustomColors.orange,
                  ),
                ),
              );
            },
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
