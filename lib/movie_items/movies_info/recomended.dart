import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies/movie_items/recommended_item.dart';
import '../../api/api_services.dart';

class Recomended extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;  // Corrected MediaQuery usage
    var width = MediaQuery.of(context).size.width;

    return Container(
      width: width ,
      height: height * 0.29,
      color: Color(0x70707070).withOpacity(0.2),  // Fixed the alpha value
      child: Padding(
        padding: const EdgeInsets.only(left: 8, right: 8, top: 16, bottom: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Recommended',
              style: TextStyle(fontSize: 15, color: Colors.white),
            ),
            SizedBox(height: 6),
            // FutureBuilder for fetching the recommended list
            Expanded(
              child: FutureBuilder(
                future: APIServices.getRecommended(),
                builder: (context, snapshot) {
                  // Handle different states of FutureBuilder
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());  // Show loading spinner
                  }

                  if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));  // Show error message
                  }

                  // Safely handle null and empty data
                  final recommendedList = snapshot.data?.results ?? [];
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (_, index) => Card(child: RecommendedItem(recommendedList[index])),
                    itemCount: recommendedList.length,
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
