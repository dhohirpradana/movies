import 'package:dpilem/statics/api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/movie_controller.dart';

class ReviewsMovieWidget extends StatefulWidget {
  final int id;
  const ReviewsMovieWidget({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  State<ReviewsMovieWidget> createState() => _ReviewsMovieWidgetState();
}

class _ReviewsMovieWidgetState extends State<ReviewsMovieWidget> {
  final _movieController = Get.put(MovieController());

  @override
  void initState() {
    _movieController.getReviews(widget.id);
    super.initState();
  }

  String _diffDate(String date) {
    DateTime date1 = DateTime.parse(date);
    final date2 = DateTime.now();
    final difference = (date2.difference(date1).inDays.abs() > 0)
        ? date2.difference(date1).inDays.abs()
        : (date2.difference(date1).inHours.abs() > 0)
            ? date2.difference(date1).inHours.abs()
            : date2.difference(date1).inMinutes.abs();
    return "$difference days ago";
  }

  String _avatarUrl(var avatarPath) {
    final String avatar = (avatarPath == null)
        ? "https://i.pravatar.cc/300"
        : (avatarPath.contains("avatar"))
            ? avatarPath.substring(1)
            : "${BaseUrl.tmdbImage}$avatarPath";
    return avatar;
  }

  @override
  Widget build(BuildContext context) {
    return GetX<MovieController>(builder: (_) {
      if (_movieController.reviewsList.isEmpty) {
        return const Center();
      } else {
        return Column(
          children: [
            const SizedBox(height: 50),
            for (var i = 0; i < _movieController.reviewsList.length; i++)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                          radius: 20,
                          backgroundImage: NetworkImage(_avatarUrl(
                              _movieController.reviewsList.reversed
                                  .toList()[i]
                                  .authorDetails["avatar_path"])),
                          backgroundColor: Colors.transparent),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              _movieController.reviewsList.reversed
                                  .toList()[i]
                                  .author,
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500)),
                          const SizedBox(height: 5),
                          Text(
                              _diffDate(_movieController.reviewsList.reversed
                                  .toList()[i]
                                  .updatedAt),
                              style: const TextStyle(color: Colors.white60))
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(_movieController.reviewsList[i].content,
                      style: const TextStyle(color: Colors.white70)),
                  const SizedBox(height: 14)
                ],
              ),
          ],
        );
      }
    });
  }
}
