

import 'package:flutter/material.dart';
import 'package:movies_app/features/movie_details/presentation/view/widgets/custom_movie_item.dart';

class FeaturedListView extends StatelessWidget {
  FeaturedListView({this.padding = 16, super.key});
  double padding;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsetsDirectional.only(start: padding),
      scrollDirection: Axis.horizontal,
      itemCount: 10,
      itemBuilder: (context, index) => InkWell(
        onTap: () {
        },
        child: CustomMovieItem(ratio: 1.2 / 2),
      ),
    );
  }
}
