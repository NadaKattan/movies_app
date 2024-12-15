import 'package:flutter/material.dart';


class MovieRating extends StatelessWidget {
  MovieRating({this.mainAxisAlignment, required this.rating, super.key});
  MainAxisAlignment? mainAxisAlignment;
  final rating;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
      children: [
        Icon(
          Icons.star_rate,
          size: 18,
          color: Color(0xffFFDD4F),
        ),
        const SizedBox(
          width: 5,
        ),
        Row(
          children: [
            Text(
              "$rating",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(
              width: 5,
            ),
            // Opacity(
            //   opacity: 0.7,
            //   child: Text(
            //     "(2390)",
            //     style: TextStyle(fontSize: 14),
            //   ),
            // ),
          ],
        ),
      ],
    );
  }
}
