import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../api/api_services.dart';
import '../movie_items/movies_list_ item.dart';
import 'category_model.dart';

class MoviesList extends StatelessWidget {
  static const String routeName = "/movieslist";

  @override
  Widget build(BuildContext context) {
    late CategoryModel category = ModalRoute.of(context)!.settings.arguments as CategoryModel;
    return Scaffold(
      backgroundColor: const Color(0xFF1E1E1E),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1E1E1E),
        foregroundColor: Colors.white,
        title: Text(
          category.name,
          style: const TextStyle(color: Colors.white),
        ),
      ),
      body: FutureBuilder(
        future: APIServices.getMoviesList(category.id), // Call the API service to get movies
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator()); // Show loading indicator while waiting
          } else if (snapshot.hasError) {
            return const Center(child: Text('Failed to load movies. Please try again later.'));
          } else if (!snapshot.hasData) {
            return const Center(child: Text('No movies found.'));
          } else {
            final moviesList = snapshot.data?.results ?? []; // Safely extract the movie list
            return ListView.separated(
              itemBuilder: (_, index) => MoviesListItem(moviesList[index]), // Ensure correct type
              itemCount: moviesList.length,
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(height: 10); // Space between each item (you can adjust the height as needed)
              },
            );
          }
        },
      ),
    );
  }
}
