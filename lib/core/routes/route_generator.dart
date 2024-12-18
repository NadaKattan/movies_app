
import 'package:flutter/material.dart';
import 'package:movies/category/movies_list.dart';
import 'package:movies/core/routes/routes.dart';
import 'package:movies/features/movie_details/presentation/view/movie_details_screen.dart';
import 'package:movies/features/watch_list/presentation/view/watch_list_screen.dart';
import 'package:movies/home.dart';
import 'package:movies/search/view/screens/search_tab.dart';
import 'package:movies/tabs/browse_tab.dart';


class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.search:
        return MaterialPageRoute(builder: (_) => const SearchTab());
      case Routes.moviesList:
        return MaterialPageRoute(builder: (_) => MoviesList(),
          settings: settings,);
      case Routes.home:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case Routes.watchList:
        return MaterialPageRoute(
          builder: (_) => const WatchListScreen(),
          settings: settings,
        );
      case Routes.movieDetails:
        return MaterialPageRoute(
          builder: (_) => const MovieDetailsScreen(),
          settings: settings,
        );
      case Routes.browse:
        return MaterialPageRoute(
          builder: (_) => BrowseTab(),
          settings: settings,
        );
      default:
        return _undefinedRoute();
    }
  }

  static Route<dynamic> _undefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text('No Route Found'),
        ),
        body: const Center(child: Text('No Route Found')),
      ),
    );
  }
}
