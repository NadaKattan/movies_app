import 'package:flutter/material.dart';
import 'package:movies/core/resources/color_manager.dart';
import 'package:movies/core/routes/routes.dart';
import 'package:movies/features/movie_details/data/models/movies_details_response.dart';


class WatchListMovieCard extends StatelessWidget {
  const WatchListMovieCard({required this.movie, super.key});
  final MoviesDetailsResponse movie;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      overlayColor: const WidgetStatePropertyAll(Colors.transparent),
      onTap: () {
        Navigator.of(context)
            .pushNamed(Routes.movieDetails, arguments: "${movie.id}");
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 100,
            width: 120,
            margin: const EdgeInsetsDirectional.only(end: 12),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              image: DecorationImage(
                // image: AssetImage("assets/images/test2.png"),
                image: NetworkImage(
                  movie.backdropPath != null
                      ? "https://image.tmdb.org/t/p/w500/${movie.backdropPath}"
                      : "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR5edgCipIZyA6SePOcnA-ZEWaAVv0wwLnvUw&s",
                ),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  movie.title ?? "",
                  style: const TextStyle(fontSize: 15),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  movie.releaseDate ?? "",
                  style:
                      const TextStyle(fontSize: 13, color: ColorManager.grey),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  movie.overview ?? "",
                  style:
                      const TextStyle(fontSize: 13, color: ColorManager.grey),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
