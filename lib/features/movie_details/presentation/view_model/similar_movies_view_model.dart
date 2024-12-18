import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:movies/features/movie_details/data/models/similar_movie_response.dart';
import 'package:movies/features/movie_details/data/repositories/similar_movies_repository.dart';
import 'package:movies/features/movie_details/presentation/view_model/service_locator.dart';


class SimilarMoviesViewModel with ChangeNotifier {
  late SimilarMoviesResponse similarMoviesDetails;
  String? errorMessage;
  bool isLoading = false;

  Future<void> getSimilarMoviesDetails(String movieId) async {
    isLoading = true;
    notifyListeners();
    final repository = SimilarMoviesRepository(
        dataSource: ServiceLocator.similarMoviesDataSource);

    try {
      similarMoviesDetails = await repository.getSimilarMoviesDetails(movieId);
    } catch (error) {
      errorMessage = error.toString();
      log(errorMessage ?? "");
    }
    isLoading = false;
    notifyListeners();
  }
}
