import 'package:flutter/material.dart';
import 'package:movies_app/core/resources/color_manager.dart';
import 'package:movies_app/core/routes/routes.dart';
import 'package:movies_app/core/widgets/add_button.dart';
import 'package:movies_app/features/movie_details/presentation/view/widgets/movie_rating.dart';
import 'package:movies_app/features/watch_list/data/models/watch_list_movie_model.dart';

class CustomMovieItem extends StatelessWidget {
  CustomMovieItem({required this.movie, required this.ratio, super.key});
  final movie;
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
          color: ColorManager.cardBackground,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    height: MediaQuery.sizeOf(context).height * .15,
                    // width: 50,
                    decoration: BoxDecoration(
                      // borderRadius: BorderRadius.all(Radius.circular(20)),
                      image: DecorationImage(
                        image: NetworkImage(movie.posterPath != null
                            ? "https://image.tmdb.org/t/p/w500/${movie.posterPath}"
                            : "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR5edgCipIZyA6SePOcnA-ZEWaAVv0wwLnvUw&s"),
                        // image: AssetImage("assets/images/test.png"),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  AddButton(movie: movie,),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MovieRating(
                      rating: "${movie.voteAverage}",
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      movie.title ?? "",
                      style: const TextStyle(
                        fontSize: 10,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      "${movie.releaseDate}",
                      style: const TextStyle(fontSize: 8, color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
