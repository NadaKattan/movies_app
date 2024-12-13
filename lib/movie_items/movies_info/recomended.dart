import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies/movie_items/recommended_item.dart';

class Recomended extends StatelessWidget{
  List<RecommendedItem> movies = List.generate(15, (index) => RecommendedItem());

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 246,
        color: Color(0xF0707070).withOpacity(0.2),
        child: Padding(
          padding: const EdgeInsets.only(left: 8, right: 8, top: 16, bottom: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Recomended', style: TextStyle(fontSize: 15, color: Colors.white),),
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
    return Card(
      color: Color(0xF0343534).withOpacity(1),
        child: Column(
              children: [
                RecommendedItem(),
        Container(
          color: Color(0xF0343534).withOpacity(1),
          //margin: EdgeInsets.only(top: 127),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.star,color: Color(0xFFFFA90A),size: 20,),
                  Text('7.7',style: TextStyle(color: Colors.white),),
                ],
              ),
              Text('Movie Name',style: TextStyle(color: Colors.white),),
              Row(
                children: [
                  Text('2018',style: TextStyle(color: Color(0xFFB5B4B4), fontSize: 8), ),
                  SizedBox(width: 4,),
                  Text('R',style: TextStyle(color: Color(0xFFB5B4B4), fontSize: 8),),
                  SizedBox(width: 4,),
                  Text('1h',style: TextStyle(color: Color(0xFFB5B4B4), fontSize: 8),),
                ],
              ),
            ],
          ),
        ),
              ],
            ));
  }
}