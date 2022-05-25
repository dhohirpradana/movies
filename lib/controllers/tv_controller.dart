import 'package:dio/dio.dart';
import 'package:dpilem/models/tv_detail_model.dart';
import 'package:dpilem/models/tv_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/reviews_model.dart';
import '../statics/api.dart';

class TVController extends GetxController {
  List<TV> popularList = <TV>[].obs;
  List<TV> onTheAirList = <TV>[].obs;
  List<TVDetail> detailList = <TVDetail>[].obs;
  List<Reviews> reviewsList = <Reviews>[].obs;

  int popularPage = 1;
  int onTheAirPage = 1;

  final dio = Dio();

  @override
  void onInit() {
    _fetchPopular(popularPage);
    _fetchOnTheAir(onTheAirPage);
    super.onInit();
  }

  void _fetchPopular(int page) {
    dio.get("${BaseUrl.popularTv}&page=$page").then((value) {
      var pupulars = value.data['results'];
      for (Map i in pupulars) {
        popularList.add(TV.fromMap(i as Map<String, dynamic>));
      }
    });
  }

  void fetchMorePopular() {
    debugPrint("get more popular");
    _fetchPopular(popularPage + 1);
    popularPage += 1;
  }

  void _fetchOnTheAir(int page) {
    dio.get("${BaseUrl.onTheAirTv}&page=$page").then((value) {
      var onTheAirs = value.data['results'];
      for (Map i in onTheAirs) {
        onTheAirList.add(TV.fromMap(i as Map<String, dynamic>));
      }
    });
  }

  void fetchMoreOnTheAir() {
    debugPrint("get more on the air");
    _fetchOnTheAir(onTheAirPage + 1);
    onTheAirPage += 1;
  }

  void getDetail(int id) {
    dio.get(BaseUrl.detailTV(id)).then((value) {
      var detail = value.data;
      detailList.add(TVDetail.fromMap(detail));
      // print(detailList);
    });
  }

  void getReviews(int id) {
    dio.get(BaseUrl.reviewsTV(id)).then((value) {
      var reviews = value.data['results'];
      reviewsList.clear();
      for (Map i in reviews) {
        reviewsList.add(Reviews.fromMap(i as Map<String, dynamic>));
      }
      // print(reviewsList);
    });
  }
}
