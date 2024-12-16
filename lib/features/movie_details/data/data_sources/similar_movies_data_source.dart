import 'package:movies_app/features/movie_details/data/models/similar_movie_response.dart';


abstract class SimilarMoviesDataSource {
  Future<SimilarMoviesResponse> getSimilarMoviesDetails(String movieId);
}
