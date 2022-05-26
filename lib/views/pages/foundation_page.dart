import 'package:flutter/material.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';
import 'package:dpilem/views/pages/movie_page.dart';
import 'package:dpilem/views/pages/profile_page.dart';
import 'package:dpilem/views/pages/tv_page.dart';

class FoundationPage extends StatefulWidget {
  const FoundationPage({Key? key}) : super(key: key);

  @override
  State<FoundationPage> createState() => _FoundationPageState();
}

class _FoundationPageState extends State<FoundationPage> {
  int selected = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: StylishBottomBar(
        items: [
          BubbleBarItem(
              icon: const Icon(Icons.movie), title: const Text('Movie')),
          BubbleBarItem(icon: const Icon(Icons.tv), title: const Text('TV')),
          BubbleBarItem(
              icon: const Icon(Icons.person), title: const Text('Profile')),
        ],

        iconSize: 32,
        barAnimation: BarAnimation.liquid,
        // iconStyle: IconStyle.animated,
        iconStyle: IconStyle.simple,
        hasNotch: true,
        // fabLocation: StylishBarFabLocation.end,
        opacity: 0.3,
        currentIndex: selected,

        //Bubble bar specific style properties
        unselectedIconColor: Colors.grey,
        backgroundColor: Colors.black,
        barStyle: BubbleBarStyle.horizotnal,
        bubbleFillStyle: BubbleFillStyle.outlined,

        onTap: (index) {
          setState(() {
            selected = index!;
          });
        },
      ),
      body: (selected == 0)
          ? const MoviePage()
          : (selected == 1)
              ? const TVPage()
              : ProfilePage(),
    );
  }
}
