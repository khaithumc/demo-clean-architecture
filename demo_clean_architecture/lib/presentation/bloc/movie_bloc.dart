import 'package:demo_clean_architecture/di/injection.dart';
import 'package:demo_clean_architecture/domain/entities/list_movie.dart';
import 'package:demo_clean_architecture/domain/repositories/list_movie_repository.dart';
import 'package:rxdart/rxdart.dart';

class ListMovieBloc {
  final ListMovieRepository _repository = getIt<ListMovieRepository>();

  final PublishSubject<ListMovie> _fetcher = PublishSubject();

  Stream<ListMovie> get stream => _fetcher.stream;

  void searchMovie(String query, int page) async {
    ListMovie listMovie = await _repository.searchMovie(query, page);
    _fetcher.sink.add(listMovie);
  }

  void dispose() {
    _fetcher.close();
  }
}
