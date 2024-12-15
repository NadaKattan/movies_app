import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:movies_app/features/movie_details/data/models/movies_details_response/movies_details_response.dart';
import 'package:movies_app/features/movie_details/data/repositories/movie_details_repository.dart';
import 'package:movies_app/features/movie_details/presentation/view_model/service_locator.dart';



class MovieDetailsViewModel with ChangeNotifier{
  late MoviesDetailsResponse movieDetails;
  String? errorMessage;
  bool isLoading = false;

  Future<void> getMovieDetails(String movieId) async {
    isLoading = true;
    notifyListeners();
    final repository = MovieDetailsRepository(
      dataSource: ServiceLocator.movieDetailsDataSource
    );

    try {
      movieDetails = await repository.getMovieDetails(movieId);
    }catch (error) {
      errorMessage = error.toString();
      log(errorMessage??"");
    }
    isLoading = false;
    notifyListeners();
  }
}