import 'package:flutter/material.dart';
import 'package:movies/search/data/data_sources/remote_data_source/search_remote_api_data_source.dart';
import 'package:movies/search/data/models/movie_model.dart';

class SearchViewModel extends ChangeNotifier {
  final  dataSource = SearchRemoteApiDateSource();  // Ensure correct data source class name
  List<MovieModel> movies = [];
  bool isLoading = false;
  String? errorMessage;
  String? queryResult;

  // Method to search movies
  Future<void> getSearchMovies(String query) async {
    // Reset error and previous query result
    errorMessage = null;
    queryResult = query;

    isLoading = true;
    notifyListeners();

    try {
      // Fetch movies from the data source
      movies = await dataSource.getSearchMovies(query);
    } catch (error) {
      // Handle any errors and set error message
      errorMessage = error.toString();
    }

    isLoading = false;
    notifyListeners();  // Notify listeners after updating the state
  }

  // Method to clear search results
  Future<void> clearSearchMovies({bool icon = false}) async {
    // Clear the query, movies, and error message
    queryResult = '';
    movies = [];
    errorMessage = null;
    isLoading = false;  // Reset loading state

    if (icon) {
      notifyListeners();  // Notify listeners if icon is true
    }
  }
}
