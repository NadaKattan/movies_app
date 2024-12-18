// import 'package:movies_app/features/movie_details/data/models/movie_model.dart';
// import 'package:movies_app/features/movie_details/data/models/movies_details_response/movies_details_response.dart';

// class WatchListMovieModel {
//   var id;
//   String? posterPath;
//   String? title;
//   String? date;
//   bool? isSelected;
//   // int? movieId;
//   List<Genres>? genres;
//   String? backdropPath;
//   String? overview;


//   WatchListMovieModel(
//       {required this.isSelected,
//         this.id="",
//         required this.posterPath,
//         required this.backdropPath,
//         required this.genres,
//         // required this.movieId,
//         required this.overview,
//         required this.title,
//         required this.date,
//       });

//   Map<String, dynamic> toJson() { // Fix the typo here
//     return {
//       "moivename": title,
//       "poster": posterPath,
//       "isSelected": isSelected,
//       "date": date,
//       "id": id,
//       // 'movieid':movieId,
//       'backdroppath':backdropPath,
//       'geners':genres,
//       'overview':overview
//     };
//   }

//   WatchListMovieModel.fromJson(Map<String, dynamic> json)
//       : this(
//     title: json['moivename'],
//     // movieId: json['movieid'],
//     posterPath: json['poster'],
//     date: json['date'],
//     id: json['id'],
//     backdropPath: json['backdroppath'],
//     genres: json['geners'],
//     overview: json['overview'],
//     isSelected: json['isSelected'],
//   );
// }