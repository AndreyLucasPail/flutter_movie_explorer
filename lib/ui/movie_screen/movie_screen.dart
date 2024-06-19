import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie_explorer/model/movie_model.dart';
import 'package:flutter_movie_explorer/utils/colors/custom_colors.dart';

class MovieScreenArgs {
  MovieScreenArgs({this.movie});
  final MovieModel? movie;
}

class MovieScreen extends StatefulWidget {
  const MovieScreen({super.key});

  static const tag = "/movieScreen";

  @override
  State<MovieScreen> createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
  MovieModel? movie;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final args = ModalRoute.of(context)!.settings.arguments as MovieScreenArgs;

    movie = args.movie;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.black,
      body: body(),
    );
  }

  Widget body() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          movieBanner(),
          votesAndReleaseDate(),
          movieTitle(),
          description(),
        ],
      ),
    );
  }

  Widget movieBanner() {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.55,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(32),
              bottomRight: Radius.circular(32),
            ),
            image: DecorationImage(
              fit: BoxFit.fill,
              filterQuality: FilterQuality.high,
              image: NetworkImage(
                "https://image.tmdb.org/t/p/w500${movie!.poster}",
              ),
            ),
          ),
        ),
        Positioned(
          left: 30,
          top: 40,
          child: backButton(),
        ),
      ],
    );
  }

  Widget backButton() {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: CustomColors.black.withOpacity(0.5),
        shape: BoxShape.circle,
      ),
      child: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(
          Icons.arrow_back,
          color: CustomColors.orange,
          size: 30,
          weight: 10,
        ),
      ),
    );
  }

  Widget movieTitle() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
      child: AutoSizeText(
        movie!.title!,
        style: const TextStyle(
          fontSize: 36,
          color: CustomColors.orange,
        ),
      ),
    );
  }

  Widget description() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: AutoSizeText(
        movie!.overview!,
        style: const TextStyle(
          fontSize: 18,
          color: CustomColors.white,
        ),
      ),
    );
  }

  Widget votesAndReleaseDate() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              const Icon(
                Icons.star,
                color: CustomColors.orange,
              ),
              const SizedBox(width: 6),
              Text(
                movie!.votes!.toStringAsFixed(1),
                style: const TextStyle(
                  color: CustomColors.orange,
                  fontSize: 18,
                ),
              ),
            ],
          ),
          const SizedBox(width: 150),
          Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: CustomColors.backGrey,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: [
                const Text(
                  "Data de Lançamento:",
                  style: TextStyle(
                    color: CustomColors.white,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  movie!.releaseDate!,
                  style: const TextStyle(
                    color: CustomColors.white,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
