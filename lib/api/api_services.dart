import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movies/api/api_constants.dart';
import 'package:movies/api/responses/new_release_response.dart';
import 'package:movies/api/responses/popular_response.dart';
import 'package:movies/api/responses/recommended_response.dart';
import 'package:movies/movie_items/movies_info/new_releases.dart';

class APIServices{
  static Future<PopularResponse> getPopular(String categoryId)async{
    final uri = Uri.https(APIConstants.baseURL,APIConstants.popularEndpoint,{
      'apiKey': APIConstants.apiKey,
    });
    final response = await http.get(uri);
    final json = jsonDecode(response.body);
    return PopularResponse.fromJson(json);
  }

  static Future<NewReleaseResponse> getNewRelease(String sourceId)async{
    final uri = Uri.https(APIConstants.baseURL,APIConstants.newReleaseEndpoint,{
      'apiKey': APIConstants.apiKey,
    });
    final response = await http.get(uri);
    final json = jsonDecode(response.body);
    return NewReleaseResponse.fromJson(json);
  }

  static Future<RecommendedResponse> getRecommended(String sourceId)async{
    final uri = Uri.https(APIConstants.baseURL,APIConstants.recommendedEndpoint,{
      'apiKey': APIConstants.apiKey,
    });
    final response = await http.get(uri);
    final json = jsonDecode(response.body);
    return RecommendedResponse.fromJson(json);
  }
}