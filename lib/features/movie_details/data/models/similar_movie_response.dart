import 'package:movies_app/features/movie_details/data/models/movies_details_response/movies_details_response.dart';


class SimilarMoviesResponse {
  int? page;
  List<MoviesDetailsResponse>? results;
  int? totalPages;
  int? totalResults;

  SimilarMoviesResponse({this.page, this.results, this.totalPages, this.totalResults});

  SimilarMoviesResponse.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    if (json['results'] != null) {
      results = <MoviesDetailsResponse>[];
      json['results'].forEach((v) {
        results!.add(MoviesDetailsResponse.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['page'] = page;

    data['total_pages'] = totalPages;
    data['total_results'] = totalResults;
    return data;
  }
}
