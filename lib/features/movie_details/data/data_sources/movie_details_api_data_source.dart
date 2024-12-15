import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:movies_app/core/services/api_constants.dart';
import 'package:movies_app/features/movie_details/data/data_sources/movie_details_data_source.dart';
import 'package:movies_app/features/movie_details/data/models/movies_details_response/movies_details_response.dart';

class MovieDetailsAPIDataSource extends MovieDetailsDataSource {
  @override
  Future<MoviesDetailsResponse> getMovieDetails(String movieId) async {
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
      "/3/movie/$movieId",
      // "${ApiConstants.detailsURL}$movieId",
      {
        // 'apiKey':ApiConstants.apiKey,
            'language':"en"
          }
    );
    final response = await http.get(uri,
    headers: {
    'Authorization': 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJlMzU0OWMxMzRhYjc3MTM0ZjgxNGNjMDI2NzhhNGU4NCIsIm5iZiI6MTczNDE3MzYwOS42NjEsInN1YiI6IjY3NWQ2M2E5OTA0NmY3M2YzYWYxYTM2MSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.ATcam_S6i7Twk-Y0_0QNmkxaPTbiuV1CFBERATv2JxY',}
    //       'accept': 'application/json',
    );
    try{
      log("na-1");
    final json = jsonDecode(response.body);
    log("na-2");
    final MoviesDetailsResponse detailsResponse = MoviesDetailsResponse.fromJson(json);
    log("hello1");
    log(detailsResponse.overview??"");
    log("${detailsResponse.voteAverage}");
    return detailsResponse;
    }
    catch(e){
      log(e.toString());
      throw Exception("Failed to get details");
    }
    // return detailsResponse;
    // if (response.statusCode == 200) {
    //   log(detailsResponse.overview??"");
    //   log("${detailsResponse.voteAverage}");
    //   log("hello2");
    //   return detailsResponse;
    // } else {
    //   log("Failed to get details");
    //   throw Exception("Failed to get details");
    // }
  }
}
