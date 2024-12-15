import 'package:flutter/material.dart';
import 'package:movies_app/features/movie_details/presentation/view/widgets/movie_rating.dart';

class CustomMovieItem extends StatelessWidget {
  CustomMovieItem({required this.ratio, super.key});
  double ratio;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: ratio,
      child: Container(
        margin: const EdgeInsetsDirectional.only(end: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: MediaQuery.sizeOf(context).height * .15,
              // width: 50,

              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                image: DecorationImage(
                  image: AssetImage("assets/images/test.png"),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            MovieRating(
              rating: "7.7",
            ),
            Text("Deadpool 2",
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
    );
  }
}
