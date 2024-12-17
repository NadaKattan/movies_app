import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:movies/api/api_constants.dart';
import 'package:movies/api/responses/movies_list_response.dart';
import 'package:movies/api/responses/new_release_response.dart';
import 'package:movies/api/responses/popular_response.dart';
import 'package:movies/api/responses/recommended_response.dart';

class APIServices {
  // Helper method for handling HTTP GET requests and response parsing
  static Future<T> _getData<T>(String endpoint, String apiKey, {Map<String, String>? additionalHeaders, Map<String, String>? queryParameters}) async {
    final uri = Uri.https(APIConstants.baseURL, endpoint, {...?queryParameters, 'api_key': apiKey});
    try {
      // Preparing headers
      final headers = <String, String>{
        'Authorization': 'Bearer ${APIConstants.accessToken}', // Authorization header with Bearer token
        if (additionalHeaders != null) ...additionalHeaders,
      };

      // Sending GET request
      final response = await http.get(uri, headers: headers).timeout(const Duration(seconds: 30));

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);

        if (T == PopularResponse) {
          return PopularResponse.fromJson(json) as T;
        } else if (T == NewReleaseResponse) {
          return NewReleaseResponse.fromJson(json) as T;
        } else if (T == RecommendedResponse) {
          return RecommendedResponse.fromJson(json) as T;
        } else if (T == MoviesListResponse) {
          return MoviesListResponse.fromJson(json) as T;
        } else {
          throw Exception("Unsupported response type");
        }
      } else {
        throw HttpException('Failed to load data, Status Code: ${response.statusCode}');
      }
    } on TimeoutException {
      throw HttpException('Request Timeout');
    } on SocketException {
      throw HttpException('No Internet connection');
    } catch (e) {
      throw HttpException('An error occurred: $e');
    }
  }

  static Future<PopularResponse> getPopular() async {
    return _getData<PopularResponse>(APIConstants.popularEndpoint, APIConstants.apiKey);
  }

  static Future<NewReleaseResponse> getNewRelease() async {
    return _getData<NewReleaseResponse>(APIConstants.newReleaseEndpoint, APIConstants.apiKey);
  }

  static Future<RecommendedResponse> getRecommended() async {
    return _getData<RecommendedResponse>(APIConstants.recommendedEndpoint, APIConstants.apiKey);
  }

  static Future<MoviesListResponse> getMoviesList(int genreId) async {
    // Pass genreId as a query parameter in the request
    final queryParameters = {'with_genres': genreId.toString()}; // use 'with_genres' for movie genre filtering
    return _getData<MoviesListResponse>(
      APIConstants.moviesListEndpoint,
      APIConstants.apiKey,
      queryParameters: queryParameters,
    );
  }
}


