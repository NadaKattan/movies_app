import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies/movie_items/movie_item.dart';
import '../../api/api_services.dart';

class NewReleases extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;  // Corrected usage of MediaQuery
    var width = MediaQuery.of(context).size.width;

    return Container(
      width: width ,
      height: height * 0.2,  // Adjusted the height to make it more proportional
      color: Color(0x70707070).withOpacity(0.2),  // Corrected the alpha value
      child: Padding(
        padding: const EdgeInsets.only(left: 8, right: 8, top: 16, bottom: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'New Releases',
              style: TextStyle(fontSize: 15, color: Colors.white),
            ),
            SizedBox(height: 6),
            // Use FutureBuilder directly for fetching data and rendering
            Expanded( // Moved Expanded widget here to wrap the ListView
              child: FutureBuilder(
                future: APIServices.getNewRelease(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());  // Loading state
                  }

                  if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));  // Error handling
                  }

                  final releaseList = snapshot.data?.results ?? [];  // Safely handle null

                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: releaseList.length,
                    itemBuilder: (_, index) => Card(child: MovieItem(releaseList[index])),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
