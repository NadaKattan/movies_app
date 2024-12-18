import 'package:flutter/material.dart';
import 'package:movies/core/widgets/error_indicator.dart';
import 'package:movies/core/widgets/loading_indicator.dart';
import 'package:movies/features/movie_details/data/models/movies_details_response.dart';
import 'package:movies/features/movie_details/presentation/view/widgets/main_movie_card.dart';
import 'package:movies/features/movie_details/presentation/view/widgets/movie_details.dart';
import 'package:movies/features/movie_details/presentation/view/widgets/similar_movies_view.dart';
import 'package:movies/features/movie_details/presentation/view_model/movie_details_view_model.dart';

import 'package:provider/provider.dart';

class MovieDetailsView extends StatefulWidget {
  const MovieDetailsView(this.movieId, {super.key});
  final String movieId;

  @override
  State<MovieDetailsView> createState() => _MovieDetailsViewState();
}

class _MovieDetailsViewState extends State<MovieDetailsView> {
  final viewModel = MovieDetailsViewModel();

  @override
  void initState() {
    super.initState();
    viewModel.getMovieDetails(widget.movieId);
  }

  @override
  Widget build(BuildContext context) {
    // viewModel.getMovieDetails(widget.movieId);
    return ChangeNotifierProvider(
      create: (_) => viewModel,
      child: Consumer<MovieDetailsViewModel>(
        builder: (context, value, child) {
          if (viewModel.isLoading) {
            return const LoadingIndicator();
          } else if (viewModel.errorMessage != null) {
            return const ErrorIndicator();
          } else {
            final MoviesDetailsResponse movieDetails = viewModel.movieDetails;
            return CustomScrollView(
              slivers: [
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Column(
                    children: [
                      Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: MainMovieCard(movieDetails: movieDetails)),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: MovieDetails(
                          moviesDetails: movieDetails,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      // RecommendedMovieCards(),
                      const SimilarMoviesView("575264"),
                    ],
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
