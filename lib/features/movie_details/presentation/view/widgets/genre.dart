import 'package:flutter/material.dart';
import 'package:movies_app/core/resources/color_manager.dart';

class Genre extends StatelessWidget {
  const Genre({required this.genre,super.key});
  final genre;
  @override
  Widget build(BuildContext context) {
    return Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                border: Border.all(color: ColorManager.white, width: 0.5),
                borderRadius: const BorderRadius.all(Radius.circular(4)),
              ),
              child: Text(genre),
            );
  }
}