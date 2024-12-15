import 'package:flutter/material.dart';
import 'package:movies_app/features/movie_details/presentation/view/widgets/featured_list_view.dart';
import 'package:movies_app/features/movie_details/presentation/view/widgets/main_movie_card.dart';
import 'package:movies_app/features/movie_details/presentation/view/widgets/movie_details.dart';
import 'package:movies_app/features/movie_details/presentation/view/widgets/movie_details_view.dart';
import 'package:movies_app/features/movie_details/presentation/view/widgets/recommended_movie_cards.dart';

class MovieDetailsScreen extends StatefulWidget {
  const MovieDetailsScreen({super.key});

  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        title: Text("Dora and the lost city of gold"),
      ),
      body: MovieDetailsView("575264"),
    );
  }
}
