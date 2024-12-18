import 'package:flutter/material.dart';
import 'package:movies_app/features/watch_list/data/data_source/firebase_functions.dart';
import 'package:movies_app/features/watch_list/presentation/view/widgets/watchListMovieCard.dart';

class WatchListTab extends StatelessWidget {
  const WatchListTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        padding: EdgeInsetsDirectional.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16, top: 50, bottom: 20),
              child: Text(
                "Watchlist",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400,color: Colors.white),
              ),
            ),
            Container(
              height: 700,
              child: StreamBuilder(
                stream: FirebaseFunctions.getWatchlistMovies(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                        child: CircularProgressIndicator(
                          color: Colors.yellow,
                        ));
                  }
                  if (snapshot.hasError) {
                    return Center(
                      child: Column(
                        children: [
                          Text("Something went wrong"),
                          ElevatedButton(
                              onPressed: () {}, child: Text('try again'))
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
                            ?.copyWith(color: Colors.yellow),
                      ),
                    );
                  }
                  return ListView.separated(
                    shrinkWrap: true,
                    separatorBuilder: (context, index) => Divider(height: 10,),
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