import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:movies/api/responses/new_release_response.dart';
import 'package:movies/core/routes/routes.dart';
import 'package:movies/core/widgets/add_button.dart';
import 'package:movies/features/watch_list/data/data_sources/firebase_functions.dart';

class MovieItem extends StatefulWidget {
  final NewResults release;

  MovieItem(this.release);

  @override
  State<MovieItem> createState() => _MovieItemState();
}

class _MovieItemState extends State<MovieItem> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;  // Correct usage of MediaQuery
    var width = MediaQuery.of(context).size.width;

    return InkWell(
      onTap: () {
        Navigator.of(context)
            .pushNamed(Routes.movieDetails, arguments: "${widget.release.id}");
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),  // Better border radius
          color: Colors.transparent,  // The background color can be modified or made transparent
        ),
        width: width * 0.212,  // Adjusted width for the item
        height: height * 0.3,  // Adjusted height for better display
        child: Stack(
          children: [
            // CachedNetworkImage for the poster (assuming it's a network image)
            ClipRRect(
              borderRadius: BorderRadius.circular(8),  // Consistent border radius
              child: CachedNetworkImage(
                imageUrl: widget.release.posterPath != null
                    ? 'https://image.tmdb.org/t/p/w500${widget.release.posterPath}'  // Full URL for the image
                    : 'assets/images/placeholder.jpg',  // Placeholder in case of null or error
                fit: BoxFit.fill,  // To cover the available space
                width: double.infinity,
                height: double.infinity,
                placeholder: (context, url) => Center(child: CircularProgressIndicator()),  // Loading placeholder
                errorWidget: (context, url, error) => Center(child: Icon(Icons.error)),  // Error widget
              ),
            ),
            // Bookmark icon (positioned)
            ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: AddButton(movie: widget.release,),
              ),
          ],
        ),
      ),
    );
  }
}
