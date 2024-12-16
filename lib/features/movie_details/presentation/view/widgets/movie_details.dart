import 'package:flutter/material.dart';
import 'package:movies_app/core/resources/color_manager.dart';
import 'package:movies_app/features/movie_details/data/models/movies_details_response/movies_details_response.dart';
import 'package:movies_app/features/movie_details/presentation/view/widgets/movie_rating.dart';

class MovieDetails extends StatelessWidget {
  const MovieDetails(
      {super.key,
      this.movieDetailsOverview,
      this.movieDetailsVote,
      required this.moviesDetails});
  final movieDetailsOverview;
  final movieDetailsVote;
  final MoviesDetailsResponse moviesDetails;
  @override
  Widget build(BuildContext context) {
    return Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Image.network(
        "https://image.tmdb.org/t/p/w500/${moviesDetails.posterPath}",
        width: 120,
      ),
      // Image.asset("assets/images/test.png"),
      const SizedBox(
        width: 20,
      ),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Text("${movieDetailsOverview}"),
            // Text("${movieDetailsVote}"),
            Text(
              moviesDetails.overview ?? "",
              // maxLines: 5,
              // overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 13, color: ColorManager.descText),
            ),
            const SizedBox(
              height: 10,
            ),
            // Text("7.7"),
            MovieRating(
              isSmall: false,
              rating: moviesDetails.voteAverage,
            ),
          ],
        ),
      )
    ]);
  }
}
