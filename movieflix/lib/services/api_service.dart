import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movieflix/models/movie_detail_model.dart';
import 'package:movieflix/models/movie_model.dart';

class ApiService {
  static const String baseUrl = "https://movies-api.nomadcoders.workers.dev";

  static Future<List<MovieModel>> getMovieList(String parser) async {
    List<MovieModel> movieInstances = [];
    final url = Uri.parse('$baseUrl/$parser');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final Map<String, dynamic> moviesData = jsonDecode(response.body);
      final List<dynamic> movies = moviesData['results'];

      for (var movie in movies) {
        final instance = MovieModel.fromJson(movie);
        movieInstances.add(instance);
      }
      return movieInstances;
    }
    print(movieInstances);
    throw Error();
  }

  static Future<MovieDetailModel> getMovieDetailsById(int id) async {
    final url = Uri.parse("$baseUrl/movie?id=$id");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final movie = jsonDecode(response.body);
      return MovieDetailModel.fromJson(movie);
    }
    throw Error();
  }
}
