import 'package:cached_network_image/cached_network_image.dart';
import 'package:dpilem/controllers/tv_controller.dart';
import 'package:dpilem/views/widget/tv/reviews_tv_widget.dart';
import 'package:dpilem/views/widget/star_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:get/get.dart';

import '../../statics/api.dart';

class TVDetailPage extends StatefulWidget {
  final int id;
  const TVDetailPage({Key? key, required this.id}) : super(key: key);

  @override
  State<TVDetailPage> createState() => _TVDetailPageState();
}

class _TVDetailPageState extends State<TVDetailPage> {
  final _tvController = Get.put(TVController());

  @override
  void initState() {
    _tvController.getDetail(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(14),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () => Get.back(),
                        icon: const Icon(CupertinoIcons.back)),
                    const Text("Detail TV",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w400)),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          CupertinoIcons.ticket,
                          color: Colors.transparent,
                        )),
                  ],
                ),
                const SizedBox(height: 24),
                GetX<TVController>(builder: (_) {
                  final details = _tvController.detailList
                      .where((md) => md.id == widget.id);
                  if (details.isEmpty) {
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    final detail = details.last;
                    return Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(40),
                          child: CachedNetworkImage(
                              height: Get.width * 0.85,
                              // width: 150,
                              cacheManager: CacheManager(Config("movieimage",
                                  stalePeriod: const Duration(days: 2))),
                              memCacheHeight: 750,
                              fit: BoxFit.cover,
                              imageUrl: BaseUrl.tmdbImage + detail.posterPath,
                              progressIndicatorBuilder:
                                  (context, url, downloadProgress) => Center(
                                      child: CircularProgressIndicator(
                                          value: downloadProgress.progress)),
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error)),
                        ),
                        const SizedBox(height: 24),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    detail.name,
                                    style: const TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  const Text(
                                    " | ",
                                    style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    detail.originalLanguage.toUpperCase(),
                                    style: const TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Row(
                                children: [
                                  Text(
                                    "${detail.voteAverage} ",
                                    style: const TextStyle(fontSize: 18),
                                  ),
                                  IconTheme(
                                      data: const IconThemeData(
                                        color: Colors.amber,
                                        size: 18,
                                      ),
                                      child: StarWidget(
                                          value: detail.voteAverage / 2)),
                                ],
                              ),
                              const SizedBox(height: 5),
                              Row(
                                children: [
                                  for (var i = 0; i < detail.genres.length; i++)
                                    Row(
                                      children: [
                                        Chip(
                                            label:
                                                Text(detail.genres[i]['name'])),
                                        const SizedBox(width: 5)
                                      ],
                                    )
                                ],
                              ),
                              const SizedBox(height: 14),
                              const Text(
                                "Overview",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w500),
                              ),
                              const SizedBox(height: 10),
                              Text(detail.overview,
                                  style:
                                      const TextStyle(color: Colors.white70)),
                              ReviewsTVWidget(id: widget.id)
                            ],
                          ),
                        ),
                      ],
                    );
                  }
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
