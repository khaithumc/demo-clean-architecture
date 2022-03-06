import 'package:demo_clean_architecture/domain/entities/result.dart';
import 'package:equatable/equatable.dart';

class ListMovie extends Equatable {
  final int page;
  final List<Result> results;
  final int total_pages;
  final int total_results;

  ListMovie({
    required this.page,
    required this.results,
    required this.total_pages,
    required this.total_results,
  });

  @override
  List<Object?> get props => [
        page,
        results,
        total_pages,
        total_results,
      ];
}
