import 'package:flutter/material.dart';
import 'package:movies_app/features/movie_details/data/models/similar_movie_response.dart';
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
    final args=ModalRoute.of(context)!.settings.arguments as String?;
    //  ??"575264";
    return Scaffold(
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        title: Text("Dora and the lost city of gold"),
      ),
      body: MovieDetailsView(args??"575264"),
    );
  }
}
