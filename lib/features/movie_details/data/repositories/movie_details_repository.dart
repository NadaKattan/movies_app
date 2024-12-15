

import 'package:movies_app/features/movie_details/data/data_sources/movie_details_data_source.dart';
import 'package:movies_app/features/movie_details/data/models/movies_details_response/movies_details_response.dart';

class MovieDetailsRepository {

  final MovieDetailsDataSource dataSource;
  const MovieDetailsRepository({required this.dataSource});

  Future<MoviesDetailsResponse> getMovieDetails(String movieId) async {
    return dataSource.getMovieDetails(movieId);
  }
}