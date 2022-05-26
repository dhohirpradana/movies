import 'package:dpilem/views/widget/tv/on_the_air_tv_widget.dart';
import 'package:dpilem/views/widget/tv/popular_tv_widget.dart';
import 'package:dpilem/views/widget/search_widget.dart';
import 'package:flutter/material.dart';

class TVPage extends StatelessWidget {
  const TVPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 14),
                Row(
                  children: const [
                    Text("Dpilem TV",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w700)),
                    // Text(" There!", style: TextStyle(fontSize: 24)),
                  ],
                ),
                const Text("Watch TV Online",
                    style: TextStyle(fontSize: 14, color: Colors.white54)),
                const SizedBox(height: 16),
                const SearchWidget(),

                // On The Air
                const SizedBox(height: 16),
                Row(
                  children: const [
                    Text("On The Air",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w700)),
                    Text(" TV", style: TextStyle(fontSize: 20))
                  ],
                ),
                const SizedBox(height: 16),
                const SizedBox(height: 250, child: OnTheAirTVWidget()),

                // Popular
                const SizedBox(height: 16),
                Row(
                  children: const [
                    Text("Popular",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w700)),
                    Text(" TV", style: TextStyle(fontSize: 20))
                  ],
                ),
                const SizedBox(height: 16),
                const SizedBox(height: 250, child: PopularTVWidget()),
                const SizedBox(height: 14)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
