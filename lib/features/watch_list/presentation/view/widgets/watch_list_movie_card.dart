import 'package:flutter/material.dart';
import 'package:movies_app/core/resources/color_manager.dart';
import 'package:movies_app/core/routes/routes.dart';
import 'package:movies_app/features/movie_details/data/models/movies_details_response/movies_details_response.dart';

class WatchListMovieCard extends StatelessWidget {
  const WatchListMovieCard({required this.movie, super.key});
  final MoviesDetailsResponse movie;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .pushNamed(Routes.movieDetails, arguments: "${movie.id}");
      },
      child: Row(
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
                  style: TextStyle(fontSize: 15),
                ),
                Text(
                  movie.overview ?? "",
                  style: TextStyle(fontSize: 13, color: ColorManager.descText),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
