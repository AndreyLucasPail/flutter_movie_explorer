import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie_explorer/model/movie_model.dart';
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
      child: Card(
        color: CustomColors.white,
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
                      "https://image.tmdb.org/t/p/w200${movie!.poster}",
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
                        color: CustomColors.black,
                        fontSize: 24,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Container(
                      decoration: BoxDecoration(
                        color: CustomColors.orange,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: AutoSizeText(
                          "TMDB: ${movie!.votes!.toStringAsFixed(2)}",
                          style: const TextStyle(
                            color: CustomColors.black,
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
    );
  }
}
