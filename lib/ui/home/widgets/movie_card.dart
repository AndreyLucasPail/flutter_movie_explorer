import 'package:flutter/material.dart';
import 'package:flutter_movie_explorer/model/movie_model.dart';
import 'package:flutter_movie_explorer/ui/movie_screen/movie_screen.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({super.key, this.movie});

  final MovieModel? movie;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          MovieScreen.tag,
          arguments: MovieScreenArgs(movie: movie),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32),
          image: DecorationImage(
            image:
                NetworkImage("https://image.tmdb.org/t/p/w500${movie!.poster}"),
            fit: BoxFit.fill,
            filterQuality: FilterQuality.high,
          ),
        ),
      ),
    );
  }
}
