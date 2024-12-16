import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/core/routes/routes.dart';
import 'package:movies_app/features/movie_details/data/models/similar_movie_response.dart';
import 'package:movies_app/features/movie_details/presentation/view/widgets/movie_rating.dart';

class CustomMovieItem extends StatelessWidget {
  CustomMovieItem({required this.movie, required this.ratio, super.key});
  final Results movie;
  double ratio;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      overlayColor: const WidgetStatePropertyAll(Colors.transparent),
      onTap: () {
        Navigator.of(context)
            .pushNamed(Routes.movieDetails, arguments: "${movie.id}");
      },
      child: AspectRatio(
        aspectRatio: ratio,
        child: Container(
          margin: const EdgeInsetsDirectional.only(end: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: MediaQuery.sizeOf(context).height * .15,
                // width: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  image: DecorationImage(
                    // image:
                    //         CachedNetworkImage(
                    //   imageUrl: news.urlToImage!,
                    //   // ?? "https://static.vecteezy.com/system/resources/previews/004/141/669/non_2x/no-photo-or-blank-image-icon-loading-images-or-missing-image-mark-image-not-available-or-image-coming-soon-sign-simple-nature-silhouette-in-frame-isolated-illustration-vector.jpg",
                    //   placeholder: (context, url) => const LoadingIndicator(),
                    //   errorWidget: (context, url, error) =>
                    //       const Icon(Icons.image_not_supported_outlined),
                    //   width: double.infinity,
                    //   // fit: BoxFit.cover,
                    // ),
                    image: NetworkImage(movie.backdropPath != null
                        ? "https://image.tmdb.org/t/p/w500/${movie.backdropPath}"
                        : "https://image.tmdb.org/t/p/w500//jYl0UuJFcmhymv9ZNO14lPLDY1Z.jpg"),
                    // image: AssetImage("assets/images/test.png"),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              MovieRating(
                rating: "${movie.voteAverage}",
              ),
              Text(movie.title ?? "",
                  style: TextStyle(
                    fontSize: 10,
                  )),
              Text(
                "2018  R  1h 59m",
                style: TextStyle(fontSize: 8, color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
