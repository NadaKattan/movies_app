import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies/movie_items/movie_item.dart';

class NewReleases extends StatelessWidget{
  List<MovieItem> movies = List.generate(15, (index) => MovieItem());
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 187,
      color: Color(0xF0707070).withOpacity(0.2),
        child: Padding(
          padding: const EdgeInsets.only(left: 8, right: 8, top: 16, bottom: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('New Releases', style: TextStyle(fontSize: 15, color: Colors.white),),
              SizedBox(height: 6,),
              Expanded(
                child: ListView.builder(
                    itemBuilder: buildMovie,
                    itemCount: movies.length,
                    scrollDirection: Axis.horizontal),
              ),
            ],
          ),
        ));
  }
  Widget buildMovie(BuildContext context, int index){
    return Card(child: MovieItem());
  }
}