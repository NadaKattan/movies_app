import 'package:flutter/material.dart';
import 'package:movies_app/features/movie_details/data/models/similar_movie_response.dart';
import 'package:movies_app/features/movie_details/presentation/view/widgets/featured_list_view.dart';

class RecommendedMovieCards extends StatelessWidget {
  const RecommendedMovieCards({this.similarMovies,super.key});
  final similarMovies;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Align(
          alignment: AlignmentDirectional.centerStart,
          child: Text(
            "More Like This",
            style: TextStyle(fontSize: 18),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.25,
          child: FeaturedListView(
            similarMovies: similarMovies,
            padding: 0,
          ),
        )
      ],
    );
  }
}
