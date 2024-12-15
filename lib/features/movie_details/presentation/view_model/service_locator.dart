import 'package:movies_app/features/movie_details/data/data_sources/movie_details_api_data_source.dart';
import 'package:movies_app/features/movie_details/data/data_sources/movie_details_data_source.dart';

class ServiceLocator {
  static MovieDetailsDataSource movieDetailsDataSource=MovieDetailsAPIDataSource();
}