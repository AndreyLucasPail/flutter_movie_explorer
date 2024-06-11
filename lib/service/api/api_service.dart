import 'package:dio/dio.dart';

class ApiService {
  static final ApiService _instance = ApiService.internal();

  factory ApiService() => _instance;

  ApiService.internal();

  final String apiKey = "8c6cb942cd3a162531c4607c2dedb00c";
  final String token =
      "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI4YzZjYjk0MmNkM2ExNjI1MzFjNDYwN2My"
      "ZGVkYjAwYyIsInN1YiI6IjY2NjA5OTE1ZGU5NWQ3MzJlYWU5OTQzZCIsInNjb3Blcy"
      "I6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.X9ImL62DEqENG5atLZjx_eYnQgt9txK5xwTQL_7FBpU";

  final Dio _dio = Dio();

  Future<Map<String, dynamic>> request(String query) async {
    String url = "https://api.themoviedb.org/3/$query";

    final response = await _dio.get(
      url,
      options: Options(
        headers: {"authorization": "Bearer $token"},
      ),
    );

    if (response.statusCode == 200) {
      print(response.data);
      return response.data;
    } else {
      throw Exception("Failed to load data");
    }
  }
}
