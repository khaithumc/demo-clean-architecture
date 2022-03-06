import 'dart:core';
import 'package:demo_clean_architecture/domain/entities/result.dart';

class ResultModel extends Result {
  ResultModel({
    required String poster_path,
    required bool adult,
    required String overview,
    required String release_date,
    required List<int> genre_ids,
    required int id,
    required String original_title,
    required String original_language,
    required String title,
    required String backdrop_path,
    required double popularity,
    required int vote_count,
    required bool video,
    required dynamic vote_average,
  }) : super(
          poster_path: poster_path,
          adult: adult,
          overview: overview,
          release_date: release_date,
          genre_ids: genre_ids,
          id: id,
          original_title: original_title,
          original_language: original_language,
          title: title,
          backdrop_path: backdrop_path,
          popularity: popularity,
          vote_count: vote_count,
          video: video,
          vote_average: vote_average,
        );

  factory ResultModel.fromJson(Map<String, dynamic> json) {
    var genreIdsFromJson = json['genre_ids'];
    return ResultModel(
      poster_path: json['poster_path'] ?? "",
      adult: json['adult'],
      overview: json['overview'],
      release_date: json['release_date'] ?? "",
      genre_ids: List<int>.from(genreIdsFromJson),
      id: json['id'],
      original_title: json['original_title'],
      original_language: json['original_language'],
      title: json['title'],
      backdrop_path: json['backdrop_path'] ?? "",
      popularity: json['popularity'],
      vote_count: json['vote_count'],
      video: json['video'],
      vote_average: json['vote_average'],
    );
  }

  Map<String, dynamic> toJson() => {
        'poster_path': poster_path,
        'adult': adult,
        'overview': overview,
        'release_date': release_date,
        'genre_ids': genre_ids,
        'id': id,
        'original_title': original_title,
        'original_language': original_language,
        'title': title,
        'backdrop_path': backdrop_path,
        'popularity': popularity,
        'vote_count': vote_count,
        'video': video,
        'vote_avarage': vote_average,
      };
}
