import 'package:flutter/cupertino.dart';
import 'package:movies/movie_items/movie_item.dart';
import 'package:movies/movie_items/movies_info/new_releases.dart';
import 'package:movies/movie_items/movies_info/popular.dart';
import 'package:movies/movie_items/movies_info/recomended.dart';

class HomeTab extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Popular(),
        SizedBox(height: 10,),
        NewReleases(),
        SizedBox(height: 15,),
        Recomended(),
      ]);
  }

}