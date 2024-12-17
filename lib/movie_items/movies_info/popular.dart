import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies/movie_items/popular_item.dart';
import '../../api/api_services.dart';

class Popular extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;  // Fixed this line
    var width = MediaQuery.of(context).size.width;    // Fixed this line

    return Container(
      height: height * 0.4,
      width: width ,  // Adjusting width to the whole screen width
      child: Container(
        color: Color(0xFF1E1E1E),
        //margin: EdgeInsets.only(top: 75, left: 20),
        width: width * 0.9,  // Adjusted width
        height: height * 0.3,  // Adjusted height
        child: FutureBuilder(
          future: APIServices.getPopular(),
          builder: (context, snapshot) {
            // Check for loading, error, or data state
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return Center(child: Text("Error: ${snapshot.error}"));
            }
            if (!snapshot.hasData || snapshot.data?.results == null) {
              return Center(child: Text("No data available"));
            }

            final popularList = snapshot.data?.results ?? [];
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index) => PopularItem(popularList[index]),
              itemCount: popularList.length,
            );
          },
        ),
      ),
    );
  }
}
