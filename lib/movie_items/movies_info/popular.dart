import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies/movie_items/popular_item.dart';

class Popular extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    return Container(
      height: height * 0.4,
      width: double.infinity,
      //color: Colors.brown,
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(top: 20),
            child: Image.asset(
                'assets/images/poster.jpg',
              width: double.infinity,
              height: height * 0.3,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 175, left: 20),
            width: width * 0.3,
            height: double.infinity,
            child: FittedBox(
              fit: BoxFit.fill,
                child: PopularItem()),
          ),
          Container(
            margin: EdgeInsets.only(top: 330, left: 10),
            child: Column(
              children: [
                Text('Movie Name',style: TextStyle(color: Color(0xFFFFFFFF), fontSize: 14),),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('2018',style: TextStyle(color: Color(0xFFB5B4B4), fontSize: 10), ),
                    SizedBox(width: 20,),
                    Text('R',style: TextStyle(color: Color(0xFFB5B4B4), fontSize: 10),),
                    SizedBox(width: 20,),
                    Text('1h',style: TextStyle(color: Color(0xFFB5B4B4), fontSize: 10),),
                  ],
                ),
              ],
            ),
          ),
          Center(child: Icon(CupertinoIcons.play_circle_fill, color: Colors.white,size: 90,)),
        ],
      ),
    );
  }

}