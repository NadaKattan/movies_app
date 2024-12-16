import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/core/resources/color_manager.dart';
import 'package:movies_app/core/widgets/loading_indicator.dart';
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
      // CachedNetworkImage(
      //   imageUrl: "https://image.tmdb.org/t/p/w500/${moviesDetails.posterPath}",
      //   placeholder: (context, url) => const LoadingIndicator(),
      //   errorWidget: (context, url, error) => const Icon(
      //     Icons.image_not_supported_outlined,
      //     color: Colors.white,
      //   ),
      //   width: 120,
      //   // fit: BoxFit.cover,
      // ),
      Image.network(
        moviesDetails.posterPath != null
            ? "https://image.tmdb.org/t/p/w500/${moviesDetails.posterPath}"
            : "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR5edgCipIZyA6SePOcnA-ZEWaAVv0wwLnvUw&s",
        width: 120,
      ),
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
