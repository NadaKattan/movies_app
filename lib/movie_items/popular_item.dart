import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies/api/responses/popular_response.dart';

class PopularItem extends StatelessWidget{

  PopularItem(this.pop);
  PopularResults pop;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: Colors.blue,
      ),
      width: width * 0.212,
      child: Stack(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: Image.asset('assets/images/poster.jpg',fit: BoxFit.fill,width: 96.87,height: 127.74, )),
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: Image.asset('assets/images/awesomebookmark.png',width: 27,height: 36, ),
          )
        ],
      ),
    );
  }

}