import 'package:flutter/material.dart';
import 'package:flutter_movie_explorer/model/movie_model.dart';
import 'package:flutter_movie_explorer/utils/colors/custom_colors.dart';
import 'package:palette_generator/palette_generator.dart';

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
  Color? backgroundColor;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final args = ModalRoute.of(context)!.settings.arguments as MovieScreenArgs;

    movie = args.movie;

    if (movie != null) {
      updateBackgroundColor("https://image.tmdb.org/t/p/w500${movie!.poster}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: body(),
    );
  }

  Widget body() {
    return SingleChildScrollView(
      child: Column(
        children: [
          movieBanner(),
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

  Future<void> updateBackgroundColor(String url) async {
    final PaletteGenerator paletteGenerator =
        await PaletteGenerator.fromImageProvider(
      NetworkImage(
        url,
      ),
    );

    setState(() {
      backgroundColor =
          paletteGenerator.dominantColor?.color ?? CustomColors.black;
    });
  }
}
