import 'package:flutter/material.dart';
import 'package:movies_app/features/movie_details/data/models/similar_movie_response.dart';
import 'package:movies_app/features/movie_details/presentation/view/widgets/custom_movie_item.dart';

class FeaturedListView extends StatelessWidget {
  FeaturedListView({required this.similarMovies,this.padding = 16, super.key});
  final SimilarMoviesResponse similarMovies;
  double padding;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsetsDirectional.only(start: padding),
      scrollDirection: Axis.horizontal,
      itemCount: similarMovies.results?.length,
      itemBuilder: (context, index) => CustomMovieItem(movie: similarMovies.results![index],ratio: 1.2 / 2),
    );
  }
}
