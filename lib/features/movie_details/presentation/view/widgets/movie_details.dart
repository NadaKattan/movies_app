import 'package:flutter/material.dart';
import 'package:movies/core/resources/color_manager.dart';
import 'package:movies/core/widgets/add_button.dart';
import 'package:movies/features/movie_details/data/models/movies_details_response.dart';
import 'package:movies/features/movie_details/presentation/view/widgets/genre.dart';
import 'package:movies/features/movie_details/presentation/view/widgets/movie_rating.dart';



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
      Stack(
        children: [
          // Icon(Icons.add),
          Image.network(
            moviesDetails.posterPath != null
                ? "https://image.tmdb.org/t/p/w500/${moviesDetails.posterPath}"
                : "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR5edgCipIZyA6SePOcnA-ZEWaAVv0wwLnvUw&s",
            width: 120,
          ),
           AddButton(movie: moviesDetails,),
        ],
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
            SizedBox(
              height: 30,
              child: ListView.separated(
                separatorBuilder: (context, index) => const SizedBox(
                  width: 10,
                ),
                scrollDirection: Axis.horizontal,
                itemCount: moviesDetails.genres?.length ?? 0,
                itemBuilder: (context, index) =>
                    Genre(genre: moviesDetails.genres?[index].name),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              moviesDetails.overview ?? "",
              // maxLines: 5,
              // overflow: TextOverflow.ellipsis,
              style:
                  const TextStyle(fontSize: 13, color: ColorManager.descText),
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