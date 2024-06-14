import 'package:flutter/material.dart';
import 'package:flutter_movie_explorer/utils/colors/custom_colors.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLoading extends StatelessWidget {
  const ShimmerLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade600,
      child: Container(
        decoration: BoxDecoration(
          color: CustomColors.grey,
          borderRadius: BorderRadius.circular(32),
        ),
      ),
    );
  }
}
