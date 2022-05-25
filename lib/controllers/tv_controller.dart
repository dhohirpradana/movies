import 'package:dio/dio.dart';
import 'package:dpilem/models/tv_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../statics/api.dart';

class TVController extends GetxController {
  List<TV> popularList = <TV>[].obs;
  List<TV> onTheAirList = <TV>[].obs;

  int popularPage = 1;
  int onTheAirPage = 1;

  final dio = Dio();

  @override
  void onInit() {
    _fetchPopular(popularPage);
    _fetchOnTheAir(onTheAirPage);
    super.onInit();
  }

  void _fetchPopular(int page) async {
    dio.get("${BaseUrl.uriPopularTv}&page=$page").then((value) {
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

  void _fetchOnTheAir(int page) async {
    dio.get("${BaseUrl.uriOnTheAirTv}&page=$page").then((value) {
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
}
