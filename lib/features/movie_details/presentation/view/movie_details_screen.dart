import 'package:flutter/material.dart';
import 'package:movies_app/core/routes/routes.dart';
import 'package:movies_app/features/movie_details/presentation/view/widgets/movie_details_view.dart';

class MovieDetailsScreen extends StatefulWidget {
  const MovieDetailsScreen({super.key});

  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as String?;
    //  ??"575264";
    return Scaffold(
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        title: const Text(
          "Movies App",
          style: TextStyle(fontSize: 20),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(Routes.watchList);
              },
              icon: const Icon(Icons.watch))
        ],
      ),
      body: MovieDetailsView(args ?? "575264"),
    );
  }
}
