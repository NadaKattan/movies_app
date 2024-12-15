import 'package:movies_app/features/movie_details/data/models/movies_details_response/movies_details_response.dart';

abstract class MovieDetailsDataSource {
  Future<MoviesDetailsResponse> getMovieDetails(String movieId);
}
