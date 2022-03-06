import 'package:equatable/equatable.dart';

class Result extends Equatable {
  final String poster_path;
  final bool adult;
  final String overview;
  final String release_date;
  final List<int> genre_ids;
  final int id;
  final String original_title;
  final String original_language;
  final String title;
  final String backdrop_path;
  final double popularity;
  final int vote_count;
  final bool video;
  final dynamic vote_average;

  Result({
    required this.poster_path,
    required this.adult,
    required this.overview,
    required this.release_date,
    required this.genre_ids,
    required this.id,
    required this.original_title,
    required this.original_language,
    required this.title,
    required this.backdrop_path,
    required this.popularity,
    required this.vote_count,
    required this.video,
    required this.vote_average,
  });

  @override
  List<Object?> get props => [
        poster_path,
        adult,
        overview,
        release_date,
        genre_ids,
        id,
        original_title,
        original_language,
        title,
        backdrop_path,
        popularity,
        vote_count,
        video,
        vote_average,
      ];
}
