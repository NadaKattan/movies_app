import 'package:flutter/material.dart';
import 'package:movies_app/features/watch_list/presentation/view/watchList_tab.dart';

class WatchListScreen extends StatelessWidget {
  const WatchListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: WatchListTab(),
    );
  }
}
