import 'package:flutter/material.dart';
import 'package:flutter_movie_explorer/model/movie_model.dart';
import 'package:flutter_movie_explorer/service/movie_service.dart';

class MovieManeger extends ChangeNotifier {
  final MovieService _movieService = MovieService();

  List<MovieModel> movies = [];

  Future<void> getDataFromMovies() async {
    movies = await _movieService.getMovies();
    notifyListeners();
  }
}
