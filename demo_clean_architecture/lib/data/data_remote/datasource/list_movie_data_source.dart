import 'dart:convert';

import 'package:demo_clean_architecture/data/model/list_movie_model.dart';
import 'package:demo_clean_architecture/di/injection.dart';

import 'package:http/http.dart';

abstract class ListMovieDataSource {
  Future<ListMovieModel> searchMovie(String query, int page);
}

class ListMovieDataSourceImpl extends ListMovieDataSource {
  final String apiKey = "0e47cd8143d6b9a833d0258baff7d491";
  final Client _client;

  ListMovieDataSourceImpl() : _client = getIt<Client>();

  @override
  Future<ListMovieModel> searchMovie(String query, int page) async {
    var url = Uri.parse(
      "https://api.themoviedb.org/3/search/movie?api_key=$apiKey&language=en-US&query=$query&page=$page",
    );
    final response =
        await _client.get(url, headers: {'Content-Type': 'application/json'});

    print(response.statusCode);

    if (response.statusCode == 200) {
      return ListMovieModel.fromJson(json.decode(response.body));
    } else {
      throw Exception("Erorr !");
    }
  }
}
