import 'package:flutter/material.dart';

class MovieRating extends StatelessWidget {
  MovieRating(
      {this.isSmall = true,
      this.mainAxisAlignment,
      required this.rating,
      super.key});
  MainAxisAlignment? mainAxisAlignment;
  bool isSmall;
  final rating;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
      children: [
        Icon(
          Icons.star_rate,
          size: isSmall ? 12 : 18,
          color: Color(0xffFFDD4F),
        ),
        const SizedBox(
          width: 5,
        ),
        Row(
          children: [
            Text(
              "$rating",
              style: TextStyle(fontSize: isSmall ? 10 : 16),
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
