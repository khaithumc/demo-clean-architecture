import 'package:demo_clean_architecture/data/data_remote/datasource/list_movie_data_source.dart';
import 'package:demo_clean_architecture/data/repositories/list_movie_repository_impl.dart';
import 'package:demo_clean_architecture/domain/repositories/list_movie_repository.dart';
import 'package:demo_clean_architecture/presentation/bloc/movie_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';

GetIt $initGetIt(GetIt getIt) {
  getIt.registerSingleton<Client>(Client());

  registerDataSource(getIt);
  registerRepository(getIt);
  registerBloc(getIt);
  return getIt;
}

void registerDataSource(GetIt getIt) {
  getIt.registerLazySingleton<ListMovieDataSource>(
      () => ListMovieDataSourceImpl());
}

void registerRepository(GetIt getIt) {
  getIt.registerLazySingleton<ListMovieRepository>(
      () => ListMovieRepositoryImpl());
}

void registerBloc(GetIt getIt) {
  getIt.registerFactory<ListMovieBloc>(() => ListMovieBloc());
}
