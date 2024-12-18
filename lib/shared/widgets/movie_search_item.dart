import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/api/api_constants.dart';
import 'package:movies/search/data/models/movie_model.dart';

import '../utils/utils.dart';


class MovieSearchItem extends StatelessWidget {
  const MovieSearchItem({
    super.key,
    required this.movie,
  });

  final MovieModel movie;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8.r),
          child: Image.network(
            '${APIConstants.imageBaseUrl}${movie.posterPath}' ??
                'assets/images/placeholder_image.jpg',
            height: 100.h,
            width: 160.w,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(
          width: 10.w,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
                movie.title ?? '',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(fontSize: 15.sp, color: Colors.grey),
              ),
              Text(
                extractYear(movie.releaseDate) ?? '',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(fontSize: 13.sp, color: Colors.grey),
              ),
            ],
          ),
        )
      ],
    );
  }
}
