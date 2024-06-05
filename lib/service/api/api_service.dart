import 'package:dio/dio.dart';

class ApiService {
  static final ApiService _instance = ApiService.internal();

  factory ApiService() => _instance;

  ApiService.internal();

  final String apiKey = "8c6cb942cd3a162531c4607c2dedb00c";

  final Dio _dio = Dio();

  Future<Map<String, dynamic>> request(String query) async {
    String url = "https://api.themoviedb.org/3/discover/$query";

    final response = await _dio.get(
      url,
      options: Options(
        headers: {"authorization": apiKey},
      ),
    );

    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception("Failed to load data");
    }
  }
}
