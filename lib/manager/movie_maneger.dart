import 'package:flutter/material.dart';
import 'package:flutter_movie_explorer/model/movie_model.dart';
import 'package:flutter_movie_explorer/service/movie_service.dart';

class MovieManeger extends ChangeNotifier {
  final MovieService _movieService = MovieService();

  List<MovieModel> popularMovies = [];
  List<MovieModel> nowPlaying = [];
  List<MovieModel> searchMovies = [];

  Future<void> getDataFromPopularMovies() async {
    popularMovies = await _movieService.getPopularMovies();
    notifyListeners();
  }

  Future<void> getDataFromPlayingNow() async {
    nowPlaying = await _movieService.getNowPlaying();
    notifyListeners();
  }

  Future<void> getSearchMovieData(String query) async {
    searchMovies = await _movieService.searchMovies(query);
    notifyListeners();
  }
}
