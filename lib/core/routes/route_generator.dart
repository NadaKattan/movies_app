import 'package:movies_app/core/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/features/browse/browse_screen.dart';
import 'package:movies_app/features/home_screen/home_screen.dart';
import 'package:movies_app/features/movie_details/movie_details_screen.dart';
import 'package:movies_app/features/search/search_screen.dart';
import 'package:movies_app/features/watch_list/watch_list_screen.dart';

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.search:
        return MaterialPageRoute(builder: (_) => const SearchScreen());
      case Routes.home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
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
          builder: (_) => const BrowseScreen(),
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
