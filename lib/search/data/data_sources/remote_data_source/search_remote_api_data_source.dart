import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movies/api/api_constants.dart';
import 'package:movies/search/data/data_sources/remote_data_source/search_remote_data_sources.dart';
import '../../models/movie_model.dart';
import '../../models/search_model_response.dart';


class SearchRemoteApiDateSource implements SearchRemoteDataSources {
  @override
  Future<List<MovieModel>> getSearchMovies(String query) async {
    final uri = Uri.https(
        APIConstants.baseURL, APIConstants.searchEndPoint, {'query': query});
    final response = await http
        .get(uri, headers: {'Authorization': APIConstants.accessToken});
    final responseBody = response.body;
    final json = jsonDecode(responseBody);
    final searchMoviesResponse = SearchModelResponse.fromJson(json);
    if (response.statusCode == 200 && searchMoviesResponse.results != null) {
      return searchMoviesResponse.results!;
    } else {
      throw Exception('Failed to fetch movies');
    }
  }
}
