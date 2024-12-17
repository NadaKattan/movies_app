import 'package:flutter/material.dart';
import 'package:movies/category/movies_list.dart';

import 'home.dart';

void main() {
  runApp(MoviesApp());
}

class MoviesApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.routeName: (_) => HomeScreen(),
        MoviesList.routeName: (_) => MoviesList(),
      },
      initialRoute: HomeScreen.routeName,
    );
  }

}
