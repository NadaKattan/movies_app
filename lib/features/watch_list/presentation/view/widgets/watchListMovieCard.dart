import 'package:flutter/material.dart';
import 'package:movies_app/features/movie_details/data/models/movies_details_response/movies_details_response.dart';


class WatchListMovieCard extends StatelessWidget {
  const WatchListMovieCard({required this.movie, super.key});
  final MoviesDetailsResponse movie;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(movie.title ?? ""),
    );
  }
}
