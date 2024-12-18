import 'package:movies_app/features/movie_details/data/models/movies_details_response/movies_details_response.dart';
import 'package:movies_app/features/watch_list/data/models/watch_list_movie_model.dart';

class SimilarMoviesResponse {
  int? page;
  List<MoviesDetailsResponse>? results;
  int? totalPages;
  int? totalResults;

  SimilarMoviesResponse({this.page, this.results, this.totalPages, this.totalResults});

  SimilarMoviesResponse.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    if (json['results'] != null) {
      results = <MoviesDetailsResponse>[];
      json['results'].forEach((v) {
        results!.add(MoviesDetailsResponse.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['page'] = page;

    data['total_pages'] = totalPages;
    data['total_results'] = totalResults;
    return data;
  }
}

// class Results {
//   bool? adult;
//   bool? isSelected;
//   String? backdropPath;
//   List<int>? genreIds;
//   var id;
//   String? movieId;
//   String? originalLanguage;
//   String? originalTitle;
//   String? overview;
//   double? popularity;
//   String? posterPath;
//   String? releaseDate;
//   String? title;
//   bool? video;
//   double? voteAverage;
//   int? voteCount;

//   Results(
//       {this.adult,
//         this.backdropPath,
//         this.genreIds,
//         this.id,
//         this.originalLanguage,
//         this.originalTitle,
//         this.overview,
//         this.popularity,
//         this.posterPath,
//         this.isSelected,
//         this.releaseDate,
//         this.title,
//         this.video,
//         this.voteAverage,
//         this.voteCount,this.movieId});

//   Results.fromJson(Map<String, dynamic> json) {
//     adult = json['adult'];
//     backdropPath = json['backdrop_path'];
//     genreIds = json['genre_ids'].cast<int>();
//     id = json['id'];
//     originalLanguage = json['original_language'];
//     originalTitle = json['original_title'];
//     overview = json['overview'];
//     popularity = json['popularity'];
//     posterPath = json['poster_path'];
//     releaseDate = json['release_date'];
//     title = json['title'];
//     video = json['video'];
//     voteAverage = json['vote_average'];
//     voteCount = json['vote_count'];
//     isSelected = json['isSelected'];
//     movieId=json["movieId"];
//   }
//   Map<String, dynamic> toJson() { // Fix the typo here
//     return {
//       "adult":adult,
//       "originalLanguage":originalLanguage,
//       "originalTitle":originalTitle,
//       "popularity":popularity,
//       "title": title,
//       "posterPath": posterPath,
//       "releaseDate":releaseDate,
//       "video":video,
//       "voteAverage":voteAverage,
//       "voteCount":voteCount,
//       "isSelected": isSelected,
//       "id": id,
//       "movieid":movieId,
//       'backdroppath':backdropPath,
//       'genreIds':genreIds,
//       'overview':overview
//     };
//   }
// }