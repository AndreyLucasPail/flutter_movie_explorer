import 'package:flutter_movie_explorer/model/movie_model.dart';
import 'package:flutter_movie_explorer/service/api/api_service.dart';

class MovieService {
  static final MovieService _instance = MovieService.internal();

  factory MovieService() => _instance;

  MovieService.internal();

  final ApiService _apiService = ApiService();

  Future<List<MovieModel>> getMovies() async {
    final response = await _apiService.request(
      "movie?include_adult=false&include_video=false&language=pt-BR",
    );

    List data = response["results"];

    return data.map((movie) => MovieModel.fromJson(movie)).toList();
  }
}
