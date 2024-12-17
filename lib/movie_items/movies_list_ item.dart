import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:movies/api/responses/movies_list_response.dart';  // For network images

class MoviesListItem extends StatelessWidget {
  late final MovieList mov;

  MoviesListItem(this.mov);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;  // Correct usage of MediaQuery
    var width = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10,),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),  // Updated border radius for consistency
        color: Color(0xFF343534).withOpacity(1),
      ),
      width: width * 0.5,  // Adjusted width for the container
      height: height * 0.2,  // Adjusted height for better display
      child: Row(
        children: [
          // Stack widget wrapped inside an Expanded to avoid layout issues
          Expanded(
            child: Stack(
              children: [
                // Using CachedNetworkImage for the poster (assuming it's a network image URL)
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: CachedNetworkImage(
                    imageUrl: mov.posterPath != null
                        ? 'https://image.tmdb.org/t/p/w500${mov.posterPath}'  // Construct full URL for poster
                        : 'assets/images/placeholder.jpg',  // Fallback if poster path is null
                    fit: BoxFit.fill,  // Ensures image covers the area
                    width: width * 0.5,  // Use the full width of the container
                    height: height ,  // Use the full height of the container
                    placeholder: (context, url) => Center(child: CircularProgressIndicator()),  // Loading placeholder
                    errorWidget: (context, url, error) => Center(child: Icon(Icons.error)),  // Error widget
                  ),
                ),
                // Bookmark icon (positioned)
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: Image.asset(
                    'assets/images/awesomebookmark.png',
                    width: 27,
                    height: 36,
                  ),
                ),
              ],
            ),
          ),
          // Text content below the image
          Container(
            width: width * 0.5,
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Rating row with star icon and vote average
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.star, color: Color(0xFFFFA90A), size: 20),
                    Text(
                      mov.voteAverage != null
                          ? mov.voteAverage!.toStringAsFixed(1)  // Format the vote average to one decimal
                          : 'N/A',
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ],
                ),
                // Movie title
                Text(
                  mov.title ?? 'No Title',  // Default to 'No Title' if title is null
                  style: TextStyle(fontSize: 20,color: Colors.white, fontWeight: FontWeight.bold),
                ),
                // Movie details (release date, rating, and duration)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      mov.releaseDate ?? 'Unknown',  // Default to 'Unknown' if release date is null
                      style: TextStyle(color: Color(0xFFB5B4B4), fontSize: 15),
                    ),
                    SizedBox(width: 4),
                    Text(
                      'R',  // Assuming the rating is R, but it could be dynamic
                      style: TextStyle(color: Color(0xFFB5B4B4), fontSize: 15),
                    ),
                    SizedBox(width: 4),
                    Text(
                      '1h',  // Assuming the movie duration is 1 hour, this could be dynamic too
                      style: TextStyle(color: Color(0xFFB5B4B4), fontSize: 15),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
