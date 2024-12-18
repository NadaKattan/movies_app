import 'package:flutter/material.dart';
import 'package:movies_app/core/resources/color_manager.dart';
import 'package:movies_app/features/watch_list/data/data_source/firebase_functions.dart';
import 'package:movies_app/features/watch_list/presentation/view/widgets/watch_list_movie_card.dart';

class WatchListTab extends StatelessWidget {
  const WatchListTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        padding: const EdgeInsetsDirectional.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 16, top: 50, bottom: 20),
              child: Text(
                "Watchlist",
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w400,
                    color: Colors.white),
              ),
            ),
            SizedBox(
              height: 700,
              child: StreamBuilder(
                stream: FirebaseFunctions.getWatchlistMovies(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                        child: CircularProgressIndicator(
                      color: Colors.yellow,
                    ));
                  }
                  if (snapshot.hasError) {
                    return Center(
                      child: Column(
                        children: [
                          const Text("Something went wrong"),
                          ElevatedButton(
                              onPressed: () {}, child: const Text('try again'))
                        ],
                      ),
                    );
                  }
                  var watchlistMovies =
                      snapshot.data?.docs.map((e) => e.data()).toList() ?? [];
                  if (watchlistMovies.isEmpty) {
                    return Center(
                      child: Text(
                        "No Watchlist Movies",
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(color: ColorManager.starRate),
                      ),
                    );
                  }
                  return ListView.separated(
                    shrinkWrap: true,
                    separatorBuilder: (context, index) => const Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Divider(
                          height: 10,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                    itemBuilder: (context, index) {
                      return WatchListMovieCard(
                        movie: watchlistMovies[index],
                      );
                    },
                    itemCount: watchlistMovies.length,
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
