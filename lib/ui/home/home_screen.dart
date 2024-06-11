import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie_explorer/manager/movie_maneger.dart';
import 'package:flutter_movie_explorer/ui/home/widgets/movie_card.dart';
import 'package:flutter_movie_explorer/utils/colors/custom_colors.dart';
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

    Provider.of<MovieManeger>(context, listen: false).getDataFromMovies();
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
          upComingMovies(),
        ],
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

  Widget upComingMovies() {
    return Consumer<MovieManeger>(builder: (context, movieManeger, child) {
      return CarouselSlider(
        options: CarouselOptions(
          autoPlay: false,
          aspectRatio: 0.95,
          enlargeCenterPage: true,
        ),
        items: movieManeger.movies
            .map((movie) => MovieCard(img: movie.poster))
            .toList(),
      );
    });
  }
}
