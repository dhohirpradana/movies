import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/movie_controller.dart';

class MoviePage extends StatelessWidget {
  const MoviePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final movieController = Get.put(MovieController());
    return Scaffold(
      body: Center(
        child: GetX<MovieController>(
          builder: (_) {
            if (movieController.popularList.isEmpty) {
              return const CircularProgressIndicator();
            } else {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (var i = 0; i < movieController.popularList.length; i++)
                    Text(movieController.popularList[i].title),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
