import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies/api/responses/popular_response.dart';

class PopularItem extends StatelessWidget {
  final PopularResults pop;

  PopularItem(this.pop);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;  // Fixed the usage of MediaQuery
    var width = MediaQuery.of(context).size.width;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Color(0xFF1E1E1E),
      ),
      width: width,
      height: height * 0.3,  // Adjusted the height to make the widget more balanced
      child: Stack(
        children: [
          // Use CachedNetworkImage for poster
          CachedNetworkImage(
            imageUrl: pop.posterPath != null && pop.posterPath!.isNotEmpty
                ? 'https://image.tmdb.org/t/p/w500${pop.posterPath}'  // Full URL to poster image
                : "assets/images/poster.jpg",  // Fallback if posterPath is null or empty
            width: double.infinity,
            height: height*0.34,
            fit: BoxFit.cover,
            placeholder: (context, url) => Center(child: CircularProgressIndicator()), // Placeholder while loading
            errorWidget: (context, url, error) => Icon(Icons.error), // Error handling for broken images
          ),
          Container(
            margin: EdgeInsets.only(top: 165, left: 20),
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: CachedNetworkImage(
                    imageUrl: pop.posterPath != null && pop.posterPath!.isNotEmpty
                        ? 'https://image.tmdb.org/t/p/w500${pop.posterPath}'  // Full URL to poster image
                        : "assets/images/poster.jpg",  // Fallback if posterPath is null or empty
                    width: width * 0.3,
                    height: height*0.22,
                    fit: BoxFit.fill,
                    placeholder: (context, url) => Center(child: CircularProgressIndicator()), // Placeholder while loading
                    errorWidget: (context, url, error) => Icon(Icons.error), // Error handling for broken images
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: Image.asset('assets/images/awesomebookmark.png', width: 27, height: 36),
                ),
              ],
            ),
              // Add bookmark icon
          ),
          // Title and Metadata (Year, Rating, Duration)
          Container(
            margin: EdgeInsets.only(top: 333, left: 10, right: 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  pop.title ?? 'Unknown Title',  // Fallback text if title is null
                  style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
                  overflow: TextOverflow.ellipsis, // Prevent text overflow
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      pop.releaseDate != null ? pop.releaseDate!.substring(0, 4) : 'Unknown Year',
                      style: TextStyle(color: Color(0xFFB5B4B4), fontSize: 10),
                    ),
                    SizedBox(width: 20),
                    Text(
                      'R',  // Placeholder rating, replace with actual data if available
                      style: TextStyle(color: Color(0xFFB5B4B4), fontSize: 10),
                    ),
                    SizedBox(width: 20),
                    Text(
                      '1h 30m',  // Placeholder duration, replace with actual data if available
                      style: TextStyle(color: Color(0xFFB5B4B4), fontSize: 10),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Play icon in the center
          Center(
            child: Icon(
              CupertinoIcons.play_circle_fill,
              color: Colors.white,
              size: 90,
            ),
          ),
        ],
      ),
    );
  }
}
