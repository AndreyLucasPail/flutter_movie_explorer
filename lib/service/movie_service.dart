import 'package:flutter_movie_explorer/model/movie_model.dart';
import 'package:flutter_movie_explorer/service/api/api_service.dart';

class MovieService {
  static final MovieService _instance = MovieService.internal();

  factory MovieService() => _instance;

  MovieService.internal();

  final ApiService _apiService = ApiService();

  Future<List<MovieModel>> getPopularMovies() async {
    final response = await _apiService.request(
      "movie/popular?language=pt-BR&page=1",
    );

    List data = response["results"];

    return data.map((movie) => MovieModel.fromJson(movie)).toList();
  }

  Future<List<MovieModel>> getNowPlaying() async {
    final response = await _apiService.request(
      "movie/now_playing?language=pt-BR&page=1",
    );

    List data = response["results"];

    return data.map((movie) => MovieModel.fromJson(movie)).toList();
  }

  Future<List<MovieModel>> searchMovies(String query) async {
    final response = await _apiService.request(
      "search/movie?query=$query&include_adult=false&language=pt-BR&page=1",
    );

    List data = response["results"];

    return data.map((movies) => MovieModel.fromJson(movies)).toList();
  }
}
