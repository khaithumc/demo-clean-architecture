import 'package:demo_clean_architecture/domain/entities/list_movie.dart';

abstract class ListMovieRepository {
  Future<ListMovie> searchMovie(String query, int page);
}
