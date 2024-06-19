import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie_explorer/manager/movie_maneger.dart';
import 'package:flutter_movie_explorer/model/movie_model.dart';
import 'package:flutter_movie_explorer/utils/colors/custom_colors.dart';
import 'package:flutter_movie_explorer/widgets/movie_card.dart';
import 'package:flutter_movie_explorer/widgets/shimmer_card.dart';
import 'package:provider/provider.dart';

class SearchScreenArgs {
  SearchScreenArgs({
    this.search,
  });
  final String? search;
}

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  static const String tag = "/searchScreen";

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  MovieModel? movie;
  String? search;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args = ModalRoute.of(context)!.settings.arguments as SearchScreenArgs;

    search = args.search;

    Provider.of<MovieManeger>(context).getSearchMovieData(search!);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: CustomColors.black,
        body: body(),
      ),
    );
  }

  Widget body() {
    return SingleChildScrollView(
      child: Column(
        children: [
          appBar(),
          resultList(),
        ],
      ),
    );
  }

  Widget appBar() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 32.0, 16.0, 16.0),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              padding: const EdgeInsets.all(12.0),
              decoration: const BoxDecoration(
                color: CustomColors.backGrey,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.arrow_back,
                color: CustomColors.orange,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: AutoSizeText(
              "Resultados para: $search",
              style: const TextStyle(
                color: CustomColors.white,
                fontSize: 24,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget resultList() {
    return Consumer<MovieManeger>(
      builder: (context, movieManeger, child) {
        if (movieManeger.searchMovies.isEmpty) {
          return Column(
            children: List.generate(15, (index) => const ShimmerCard()),
          );
        } else {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: movieManeger.searchMovies
                .map((movie) => MovieCard(movie: movie))
                .toList(),
          );
        }
      },
    );
  }
}
