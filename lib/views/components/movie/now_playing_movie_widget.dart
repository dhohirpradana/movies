import 'package:cached_network_image/cached_network_image.dart';
import 'package:dpilem/views/pages/movie_detail_page.dart';
import 'package:dpilem/views/components/star_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:get/get.dart';
import 'package:dpilem/statics/api.dart';
import '../../../controllers/movie_controller.dart';

class NowPlayingMovieWidget extends StatefulWidget {
  const NowPlayingMovieWidget({Key? key}) : super(key: key);

  @override
  State<NowPlayingMovieWidget> createState() => _NowPlayingMovieWidgetState();
}

class _NowPlayingMovieWidgetState extends State<NowPlayingMovieWidget> {
  final _movieController = Get.put(MovieController());
  final ScrollController _scrollController = ScrollController();

  bool isLoading = false;

  void _getMoreNowPlaying() async {
    if (!isLoading) {
      setState(() {
        isLoading = true;
      });
      _movieController.fetchMoreNowPlaying();

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
        _getMoreNowPlaying();
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
        if (_movieController.nowPlayingList.isEmpty) {
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
            key: const PageStorageKey<String>('now playing controller'),
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: _movieController.nowPlayingList.length,
            itemBuilder: ((context, i) => SizedBox(
                  height: 250,
                  width: 150,
                  child: InkWell(
                    onTap: (() => Get.to(() => MovieDetailPage(
                        id: _movieController.nowPlayingList[i].id))),
                    child: Card(
                        child: Stack(
                      children: [
                        CachedNetworkImage(
                            height: 250,
                            width: 150,
                            cacheManager: CacheManager(Config("movieimage",
                                stalePeriod: const Duration(days: 2))),
                            memCacheHeight: 750,
                            fit: BoxFit.cover,
                            imageUrl: BaseUrl.tmdbImage +
                                _movieController.nowPlayingList[i].posterPath,
                            progressIndicatorBuilder:
                                (context, url, downloadProgress) => Center(
                                    child: CircularProgressIndicator(
                                        value: downloadProgress.progress)),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error)),
                        Align(
                            alignment: FractionalOffset.bottomLeft,
                            child: Container(
                                height: 75,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        _movieController.nowPlayingList[i].title
                                            .toString(),
                                        style: const TextStyle(fontSize: 18),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      const SizedBox(height: 3),
                                      IconTheme(
                                          data: const IconThemeData(
                                            color: Colors.amber,
                                            size: 16,
                                          ),
                                          child: StarWidget(
                                              value: _movieController
                                                      .nowPlayingList[i]
                                                      .voteAverage /
                                                  2)),
                                    ],
                                  ),
                                )))
                      ],
                    )),
                  ),
                )),
            controller: _scrollController,
          );
        }
      },
    );
  }
}
