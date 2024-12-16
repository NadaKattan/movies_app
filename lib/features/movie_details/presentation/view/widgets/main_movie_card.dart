import 'package:flutter/material.dart';

class MainMovieCard extends StatelessWidget {
  const MainMovieCard({super.key, required this.movieDetails});
  final movieDetails;
  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: 200,
          // width: double.infinity,
          margin: const EdgeInsetsDirectional.only(end: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            image: DecorationImage(
              // image: AssetImage("assets/images/test2.png"),
              image: NetworkImage(
                "https://image.tmdb.org/t/p/w500/${movieDetails.backdropPath}",
              ),
              fit: BoxFit.fill,
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Align(
          alignment: AlignmentDirectional.centerStart,
          child: Text(
            movieDetails.title,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
        ),
      ],
    );
  }
}
