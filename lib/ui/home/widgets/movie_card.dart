import 'package:flutter/material.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({super.key, this.img});

  final String? img;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        image: DecorationImage(
          image: NetworkImage("https://image.tmdb.org/t/p/w500$img"),
          fit: BoxFit.fill,
          filterQuality: FilterQuality.high,
        ),
      ),
    );
  }
}
