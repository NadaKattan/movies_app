import 'package:flutter/material.dart';
import 'package:movies/core/widgets/error_indicator.dart';
import 'package:movies/core/widgets/loading_indicator.dart';
import 'package:movies/features/movie_details/data/models/similar_movie_response.dart';
import 'package:movies/features/movie_details/presentation/view/widgets/recommended_movie_cards.dart';
import 'package:movies/features/movie_details/presentation/view_model/similar_movies_view_model.dart';

import 'package:provider/provider.dart';

class SimilarMoviesView extends StatefulWidget {
  const SimilarMoviesView(this.movieId, {super.key});
  final String movieId;

  @override
  State<SimilarMoviesView> createState() => _SimilarMoviesViewState();
}

class _SimilarMoviesViewState extends State<SimilarMoviesView> {
  final viewModel = SimilarMoviesViewModel();
  @override
  void initState() {
    super.initState();
    viewModel.getSimilarMoviesDetails(widget.movieId);
  }

  @override
  Widget build(BuildContext context) {
    // viewModel.getMovieDetails(widget.movieId);
    return ChangeNotifierProvider(
      create: (_) => viewModel,
      child: Consumer<SimilarMoviesViewModel>(
        builder: (context, value, child) {
          if (viewModel.isLoading) {
            return const LoadingIndicator();
          } else if (viewModel.errorMessage != null) {
            return const ErrorIndicator();
          } else {
            final SimilarMoviesResponse similarMovies = viewModel.similarMoviesDetails;
            return RecommendedMovieCards(similarMovies: similarMovies,);
          }
        },
      ),
    );
  }
}
