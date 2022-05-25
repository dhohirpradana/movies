import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:get/get.dart';
import 'package:dpilem/statics/api.dart';
import '../../controllers/movie_controller.dart';

class UpcomingWidget extends StatefulWidget {
  const UpcomingWidget({Key? key}) : super(key: key);

  @override
  State<UpcomingWidget> createState() => _UpcomingWidgetState();
}

class _UpcomingWidgetState extends State<UpcomingWidget> {
  final _movieController = Get.put(MovieController());
  final ScrollController _scrollController = ScrollController();

  bool isLoading = false;

  void _getMoreUpcoming() async {
    if (!isLoading) {
      setState(() {
        isLoading = true;
      });
      _movieController.fetchMoreUpcoming();

      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _getMoreUpcoming();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetX<MovieController>(
      builder: (_) {
        if (_movieController.upcomingList.isEmpty) {
          return ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: 3,
            itemBuilder: ((context, i) => const Card(
                child: SizedBox(
                    width: 150,
                    child: Center(child: CircularProgressIndicator())))),
          );
        } else {
          return ListView.builder(
            key: const PageStorageKey<String>('upcoming controller'),
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: _movieController.upcomingList.length,
            itemBuilder: ((context, i) => Card(
                    child: SizedBox(
                  width: 150,
                  child: CachedNetworkImage(
                      cacheManager: CacheManager(Config("movieimage",
                          stalePeriod: const Duration(days: 2))),
                      memCacheHeight: 750,
                      fit: BoxFit.cover,
                      imageUrl: BaseUrl.tmdbImage +
                          _movieController.upcomingList[i].posterPath,
                      progressIndicatorBuilder:
                          (context, url, downloadProgress) => Center(
                              child: CircularProgressIndicator(
                                  value: downloadProgress.progress)),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error)),
                ))),
            controller: _scrollController,
          );
        }
      },
    );
  }
}
