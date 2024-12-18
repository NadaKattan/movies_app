import 'package:flutter/material.dart';
import 'package:movies_app/features/movie_details/data/models/similar_movie_response.dart';
import 'package:movies_app/features/watch_list/data/data_source/firebase_functions.dart';
import 'package:movies_app/features/watch_list/data/models/watch_list_movie_model.dart';

class AddButton extends StatefulWidget {
  final void Function()? onTap;

  const AddButton({this.movie, this.onTap, super.key});
  final movie;
  @override
  State<AddButton> createState() => _AddButtonState();
}

class _AddButtonState extends State<AddButton> {
  Widget addIcon = const Icon(Icons.add);
  bool isClicked = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          isClicked = !isClicked;
          if (isClicked) {
            FirebaseFunctions.addMovieToFirestore(widget.movie);
          } else {
            FirebaseFunctions.deleteMovieFromFirestore(
                widget.movie.movieId as String?);
          }
        });
      },
      child: Container(
          margin: const EdgeInsets.all(0),
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
          // color: ColorManager.unSelectedAdd,
          decoration: BoxDecoration(
              image: DecorationImage(
            image: isClicked
                ? const AssetImage("assets/images/selectedBookmark.png")
                : const AssetImage("assets/images/bookmark.png"),
          )),
          child: const Icon(
            Icons.add,
            size: 16,
          )),
    );
  }
}
