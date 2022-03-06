import 'package:demo_clean_architecture/data/model/result_model.dart';
import 'package:demo_clean_architecture/domain/entities/list_movie.dart';

class ListMovieModel extends ListMovie {
  ListMovieModel({
    required int page,
    required List<ResultModel> results,
    required int total_pages,
    required int total_results,
  }) : super(
          page: page,
          results: results,
          total_pages: total_pages,
          total_results: total_results,
        );

  factory ListMovieModel.fromJson(Map<String, dynamic> json) => ListMovieModel(
        page: json['page'],
        results: (json['results'] as List<dynamic>)
            .map((e) => ResultModel.fromJson(e as Map<String, dynamic>))
            .toList(),
        total_pages: json['total_pages'],
        total_results: json['total_results'] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        'page': page,
        'results': results,
        'total_pages': total_pages,
        'total_result': total_results,
      };
}
