import 'package:demo_clean_architecture/data/data_remote/datasource/list_movie_data_source.dart';
import 'package:demo_clean_architecture/di/injection.dart';
import 'package:demo_clean_architecture/domain/entities/list_movie.dart';
import 'package:demo_clean_architecture/domain/repositories/list_movie_repository.dart';

class ListMovieRepositoryImpl extends ListMovieRepository {
  final ListMovieDataSource _dataSource;

  ListMovieRepositoryImpl() : _dataSource = getIt<ListMovieDataSource>();

  @override
  Future<ListMovie> searchMovie(String query, int page) {
    return _dataSource.searchMovie(query, page);
  }
}
