import 'package:cached_network_image/cached_network_image.dart';
import 'package:dpilem/controllers/tv_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:get/get.dart';
import 'package:dpilem/statics/api.dart';
import '../../controllers/movie_controller.dart';

class PopularTVWidget extends StatefulWidget {
  const PopularTVWidget({Key? key}) : super(key: key);

  @override
  State<PopularTVWidget> createState() => _PopularTVWidgetState();
}

class _PopularTVWidgetState extends State<PopularTVWidget> {
  final _tvController = Get.put(TVController());
  final ScrollController _scrollController = ScrollController();

  bool isLoading = false;

  void _getMorePopular() async {
    if (!isLoading) {
      setState(() {
        isLoading = true;
      });
      _tvController.fetchMorePopular();

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
        _getMorePopular();
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
        if (_tvController.popularList.isEmpty) {
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
            key: const PageStorageKey<String>('popular tv controller'),
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: _tvController.popularList.length,
            itemBuilder: ((context, i) => SizedBox(
                  height: 300,
                  width: 150,
                  child: Card(
                      child: Stack(
                    children: [
                      CachedNetworkImage(
                          height: 300,
                          width: 150,
                          cacheManager: CacheManager(Config("tvimage",
                              stalePeriod: const Duration(days: 2))),
                          memCacheHeight: 750,
                          fit: BoxFit.cover,
                          imageUrl: BaseUrl.tmdbImage +
                              _tvController.popularList[i].posterPath,
                          progressIndicatorBuilder:
                              (context, url, downloadProgress) => Center(
                                  child: CircularProgressIndicator(
                                      value: downloadProgress.progress)),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error)),
                      Align(
                          alignment: FractionalOffset.bottomLeft,
                          child: Container(
                              width: 150,
                              decoration: const BoxDecoration(
                                  gradient: LinearGradient(
                                      begin: Alignment.bottomCenter,
                                      end: Alignment.topCenter,
                                      colors: [
                                    Colors.black,
                                    Colors.transparent
                                  ])),
                              child: Padding(
                                padding: const EdgeInsets.all(5),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      _tvController.popularList[i].voteAverage
                                          .toString(),
                                      style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text(
                                      _tvController.popularList[i].name
                                          .toString(),
                                      style: const TextStyle(fontSize: 18),
                                    ),
                                  ],
                                ),
                              )))
                    ],
                  )),
                )),
            controller: _scrollController,
          );
        }
      },
    );
  }
}
