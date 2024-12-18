import 'package:flutter/material.dart';
import 'package:movies/features/watch_list/presentation/view/widgets/watch_list_tab.dart';


class WatchListScreen extends StatelessWidget {
  const WatchListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const WatchListTab(),
    );
  }
}