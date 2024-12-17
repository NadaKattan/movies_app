import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/category/movies_list.dart';

import 'home.dart';

void main() {
  runApp(MoviesApp());
}

class MoviesApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      designSize: const Size(412, 870),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          HomeScreen.routeName: (_) => HomeScreen(),
          MoviesList.routeName: (_) => MoviesList(),
        },
        initialRoute: HomeScreen.routeName,
      ),
    );
  }

}
