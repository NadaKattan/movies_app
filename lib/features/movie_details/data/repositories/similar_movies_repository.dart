

import 'package:movies/features/movie_details/data/data_sources/similar_movies_data_source.dart';
import 'package:movies/features/movie_details/data/models/similar_movie_response.dart';

class SimilarMoviesRepository {
  final SimilarMoviesDataSource dataSource;
  const SimilarMoviesRepository({required this.dataSource});

  Future<SimilarMoviesResponse> getSimilarMoviesDetails(String movieId) async {
    return dataSource.getSimilarMoviesDetails(movieId);
  }
}
