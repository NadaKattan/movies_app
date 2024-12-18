
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movies/features/movie_details/data/models/movies_details_response.dart';



class FirebaseFunctions {
  static CollectionReference<MoviesDetailsResponse> getMoviesCollection() =>
      FirebaseFirestore.instance.collection('movies').withConverter(
            fromFirestore: (snapshot, options) =>
                MoviesDetailsResponse.fromJson(snapshot.data()!),
            toFirestore: (movieModel, options) => movieModel.toJson(),
          );

  static Future<void> addMovieToFirestore(MoviesDetailsResponse movie) {
    CollectionReference<MoviesDetailsResponse> moviesCollection =
        getMoviesCollection();
    DocumentReference<MoviesDetailsResponse> doc = moviesCollection.doc();
    movie.movieId = doc.id as String?;
    return doc.set(movie);
  }

 
  static Stream<QuerySnapshot<MoviesDetailsResponse>> getWatchlistMovies() {
    var collection = getMoviesCollection();
    return collection.snapshots();
  }

  static Future<void> deleteMovieFromFirestore(String? movieId) async {
    return getMoviesCollection().doc(movieId).delete();
  }

}
