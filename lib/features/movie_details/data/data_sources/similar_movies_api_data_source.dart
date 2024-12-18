import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:movies/core/services/api_constants.dart';
import 'package:movies/features/movie_details/data/data_sources/similar_movies_data_source.dart';
import 'package:movies/features/movie_details/data/models/similar_movie_response.dart';


class SimilarMoviesAPIDataSource extends SimilarMoviesDataSource {
  @override
  Future<SimilarMoviesResponse> getSimilarMoviesDetails(
      String movieId) async {
    // final uri = Uri.parse(
    //       'https://${ApiConstants.baseURL}/3/movie/$movieId?language=en-US/');
    //   final response = await http.get(
    //     uri,
    //     headers: {
    //       'Authorization': 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJlMzU0OWMxMzRhYjc3MTM0ZjgxNGNjMDI2NzhhNGU4NCIsIm5iZiI6MTczNDE3MzYwOS42NjEsInN1YiI6IjY3NWQ2M2E5OTA0NmY3M2YzYWYxYTM2MSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.ATcam_S6i7Twk-Y0_0QNmkxaPTbiuV1CFBERATv2JxY',
    //       'accept': 'application/json',
    //     },
    //   );

    final uri = Uri.https(
        ApiConstants.baseURL,
        "/3/movie/$movieId/similar",
        // "${ApiConstants.detailsURL}$movieId",
        {
          // 'apiKey':ApiConstants.apiKey,
          'language': "en-US",
          "page": "1",
        });
    final response = await http.get(uri, headers: {
      'Authorization':
          'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJlMzU0OWMxMzRhYjc3MTM0ZjgxNGNjMDI2NzhhNGU4NCIsIm5iZiI6MTczNDE3MzYwOS42NjEsInN1YiI6IjY3NWQ2M2E5OTA0NmY3M2YzYWYxYTM2MSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.ATcam_S6i7Twk-Y0_0QNmkxaPTbiuV1CFBERATv2JxY',
    }
        //       'accept': 'application/json',
        );
    try {
      // log("na-1");
      final json = jsonDecode(response.body);
      // log("na-2");
      final SimilarMoviesResponse detailsResponse =
          SimilarMoviesResponse.fromJson(json);
      // log("na-3");
      // log("${detailsResponse.results?.map((e) {
      //   return e?.title;
      // },).toList()}");
      return detailsResponse;
    } catch (e) {
      log(e.toString());
      throw Exception("Failed to get details");
    }
  }
}
