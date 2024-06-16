import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie_explorer/manager/movie_maneger.dart';
import 'package:flutter_movie_explorer/ui/home/widgets/movie_card.dart';
import 'package:flutter_movie_explorer/ui/home/widgets/popular_card.dart';
import 'package:flutter_movie_explorer/utils/colors/custom_colors.dart';
import 'package:flutter_movie_explorer/widgets/shimmer_card.dart';
import 'package:flutter_movie_explorer/widgets/shimmer_loading.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const tag = "/homeScreen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();

    Provider.of<MovieManeger>(context, listen: false).getDataFromPlayingNow();
    Provider.of<MovieManeger>(context, listen: false)
        .getDataFromPopularMovies();
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
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            CustomColors.darkNavy,
            Color(0xFF000435),
            Color(0xFF080E4B),
          ],
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            appBar(),
            search(),
            header("Filmes em Cartaz"),
            upComingMovies(),
            const SizedBox(height: 20),
            header("Filmes Populares"),
            popularMovies(),
          ],
        ),
      ),
    );
  }

  Widget appBar() {
    return const Padding(
      padding: EdgeInsets.fromLTRB(0, 16.0, 0, 30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Movie Explorer",
            style: TextStyle(
              fontSize: 34,
              color: CustomColors.orange,
              fontWeight: FontWeight.w600,
              letterSpacing: 1.5,
            ),
          )
        ],
      ),
    );
  }

  Widget search() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextFormField(
        cursorColor: CustomColors.orange,
        decoration: InputDecoration(
          filled: true,
          fillColor: CustomColors.black,
          hintText: "Procure por Filmes",
          hintStyle: const TextStyle(
            color: CustomColors.grey,
            fontSize: 18,
            letterSpacing: 1,
          ),
          prefixIcon: const Icon(
            Icons.search,
            color: CustomColors.grey,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32),
            borderSide: const BorderSide(
              color: CustomColors.orange,
              width: 2,
            ),
          ),
        ),
      ),
    );
  }

  Widget header(String text) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 12.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
            style: const TextStyle(
              color: CustomColors.orange,
              fontSize: 24,
            ),
          )
        ],
      ),
    );
  }

  Widget upComingMovies() {
    return Consumer<MovieManeger>(
      builder: (context, movieManeger, child) {
        if (movieManeger.movies.isEmpty) {
          return CarouselSlider.builder(
            itemCount: 5,
            itemBuilder: (context, index, realIndex) {
              return const ShimmerLoading();
            },
            options: CarouselOptions(
              autoPlay: false,
              aspectRatio: 1.0,
              enlargeCenterPage: true,
            ),
          );
        } else {
          return CarouselSlider(
            options: CarouselOptions(
              autoPlay: false,
              aspectRatio: 1.0,
              enlargeCenterPage: true,
            ),
            items: movieManeger.movies
                .map((movie) => MovieCard(movie: movie))
                .toList(),
          );
        }
      },
    );
  }

  Widget popularMovies() {
    return Consumer<MovieManeger>(
      builder: (context, movieManeger, child) {
        if (movieManeger.movies.isEmpty) {
          return Column(
            children: List.generate(5, (index) => const ShimmerCard()),
          );
        } else {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: movieManeger.movies
                .map(
                  (movie) => Popularcard(movie: movie),
                )
                .toList(),
          );
        }
      },
    );
  }
}
