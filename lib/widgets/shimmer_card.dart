import 'package:flutter/material.dart';
import 'package:flutter_movie_explorer/utils/colors/custom_colors.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerCard extends StatelessWidget {
  const ShimmerCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Card(
        color: CustomColors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              shimmerContainer(100, 100),
              const SizedBox(width: 10),
              Column(
                children: [
                  shimmerContainer(20, 200),
                  const SizedBox(height: 10),
                  shimmerContainer(20, 150),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget shimmerContainer(double height, double width) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade600,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: CustomColors.grey,
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }
}
