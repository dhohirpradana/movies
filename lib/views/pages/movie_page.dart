import 'package:flutter/material.dart';
import 'package:youtap_movie/views/widget/now_palying_widget.dart';
import 'package:youtap_movie/views/widget/popular_movie_widget.dart';
import 'package:youtap_movie/views/widget/search_widget.dart';
import 'package:youtap_movie/views/widget/upcoming_widget.dart';

class MoviePage extends StatelessWidget {
  const MoviePage({Key? key}) : super(key: key);

  final name = "Dhohir";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(14.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Text("Hello",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w700)),
                    Text(" $name!", style: const TextStyle(fontSize: 24)),
                  ],
                ),
                const Text("Watch your favorite movie",
                    style: TextStyle(fontSize: 14, color: Colors.white54)),
                const SizedBox(height: 16),
                const SearchWidget(),

                // Now Playing
                const SizedBox(height: 16),
                Row(
                  children: const [
                    Text("Now",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w700)),
                    Text(" Playing", style: TextStyle(fontSize: 20))
                  ],
                ),
                const SizedBox(height: 16),
                const SizedBox(height: 300, child: NowPlayingWidget()),

                // Popular
                const SizedBox(height: 16),
                Row(
                  children: const [
                    Text("Popular",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w700)),
                    Text(" Movies", style: TextStyle(fontSize: 20))
                  ],
                ),
                const SizedBox(height: 16),
                const SizedBox(height: 300, child: PopularMovieWidget()),

                // Upcoming
                const SizedBox(height: 16),
                Row(
                  children: const [
                    Text("Upcoming",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w700)),
                    Text(" Movies", style: TextStyle(fontSize: 20))
                  ],
                ),
                const SizedBox(height: 16),
                const SizedBox(height: 300, child: UpcomingWidget()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
