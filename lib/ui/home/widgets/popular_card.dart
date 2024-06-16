import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie_explorer/model/movie_model.dart';
import 'package:flutter_movie_explorer/ui/movie_screen/movie_screen.dart';
import 'package:flutter_movie_explorer/utils/colors/custom_colors.dart';

class Popularcard extends StatelessWidget {
  const Popularcard({
    super.key,
    this.movie,
  });

  final MovieModel? movie;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 10.0,
            sigmaY: 10.0,
          ),
          child: InkWell(
            onTap: () {
              Navigator.pushNamed(
                context,
                MovieScreen.tag,
                arguments: MovieScreenArgs(movie: movie),
              );
            },
            child: Card(
              color: CustomColors.white.withOpacity(0.3),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        image: DecorationImage(
                          image: NetworkImage(
                            "https://image.tmdb.org/t/p/w500${movie!.poster}",
                          ),
                          fit: BoxFit.fill,
                          filterQuality: FilterQuality.high,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AutoSizeText(
                            "${movie!.title}",
                            overflow: TextOverflow.ellipsis,
                            minFontSize: 16,
                            maxLines: 2,
                            style: const TextStyle(
                              color: CustomColors.white,
                              fontSize: 24,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Container(
                            decoration: BoxDecoration(
                              color: CustomColors.orange,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: AutoSizeText(
                                "TMDB: ${movie!.votes!.toStringAsFixed(2)}",
                                style: const TextStyle(
                                  color: CustomColors.white,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
