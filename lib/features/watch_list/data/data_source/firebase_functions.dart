
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movies_app/features/movie_details/data/models/movies_details_response/movies_details_response.dart';


class FirebaseFunctions {
  static CollectionReference<MoviesDetailsResponse> getMoviesCollection() =>
      FirebaseFirestore.instance.collection('movies').withConverter(
            fromFirestore: (snapshot, options) =>
                MoviesDetailsResponse.fromJson(snapshot.data()!),
            toFirestore: (movieModel, options) => movieModel.toJson(),
          );

  // static CollectionReference<MoviesDetailsResponse> getMovieCollection(movieId) =>
  //     getMoviesCollection().doc(movieId).collection('movie').withConverter(
  //           fromFirestore: (snapshot, options) =>
  //               MoviesDetailsResponse.fromJson(snapshot.data()!),
  //           toFirestore: (movieModel, options) => movieModel.toJson(),
  //         );

  static Future<void> addMovieToFirestore(MoviesDetailsResponse movie) {
    CollectionReference<MoviesDetailsResponse> moviesCollection =
        getMoviesCollection();
    DocumentReference<MoviesDetailsResponse> doc = moviesCollection.doc();
    movie.movieId = doc.id as String?;
    return doc.set(movie);
  }

  // static Future<List<MoviesDetailsResponse>> getAllMoviesFromFirestore(movieId) async {
  //   CollectionReference<MoviesDetailsResponse> moviesCollection = getMoviesCollection();
  //   QuerySnapshot<MoviesDetailsResponse> querySnapshot = await tasksCollection.get();
  //   return querySnapshot.docs.map((docSnapshot) => docSnapshot.data()).toList();
  // }
  static Stream<QuerySnapshot<MoviesDetailsResponse>> getWatchlistMovies() {
    var collection = getMoviesCollection();
    return collection.snapshots();
  }

  static Future<void> deleteMovieFromFirestore(String? movieId) async {
    return getMoviesCollection().doc(movieId).delete();
  }

  // static Future<void> editTaskInFirestore(taskId, taskModel,userId) async {
  //   CollectionReference<MoviesDetailsResponse> tasksCollection = getTaskCollection(userId);
  //    DocumentReference<TaskModel> doc = tasksCollection.doc(taskId);
  //   taskModel.id = doc.id;
  //   return doc.set(taskModel);
  // }
}
