import 'package:flutter/material.dart';
import 'package:movies_app/features/movie_details/presentation/view/widgets/main_movie_card.dart';
import 'package:movies_app/features/movie_details/presentation/view/widgets/movie_details.dart';
import 'package:movies_app/features/movie_details/presentation/view/widgets/recommended_movie_card.dart';

class MovieDetailsScreen extends StatelessWidget {
  const MovieDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        title: Text("Dora and the lost city of gold"),
      ),
      body: Column(
        children: [
          MainMovieCard(),
          // MovieDetails(),
          // RecommendedMovieCard(),
        ],
      ),
    );
  }
}
