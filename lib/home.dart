import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies/tabs/bookmark_tab.dart';
import 'package:movies/tabs/browse_tab.dart';
import 'package:movies/tabs/home_tab.dart';
import 'package:movies/tabs/search_tab.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "/home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  List<Widget> tabs = [
    HomeTab(),
    SearchTab(),
    BrowseTab(),
    BookmarkTab(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1E1E1E),
      body: tabs[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Color(0xFFFFA90A),
        unselectedItemColor: Colors.white,
        backgroundColor: Color(0xFF1A1A1A),
          currentIndex: currentIndex,
          onTap: (index){
            currentIndex = index;
            setState(() {});
          },
          items:
          [BottomNavigationBarItem(icon: ImageIcon(AssetImage('assets/images/home.png')),label: 'HOME'),
            BottomNavigationBarItem(icon: ImageIcon(AssetImage('assets/images/search.png')),label: 'SEARCH'),
            BottomNavigationBarItem(icon: ImageIcon(AssetImage('assets/images/movie.png')),label: 'BROWSE'),
            BottomNavigationBarItem(icon: ImageIcon(AssetImage('assets/images/bookmarks.png')),label: 'WATCHLIST'),
            ],
      ),
    );
  }
}