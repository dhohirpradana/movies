import 'package:dio/dio.dart';
import 'package:dpilem/models/movie_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../statics/api.dart';

class MovieController extends GetxController {
  List<Movie> popularList = <Movie>[].obs;
  List<Movie> upcomingList = <Movie>[].obs;
  List<Movie> nowPlayingList = <Movie>[].obs;

  int nowPlayingPage = 1;
  int popularPage = 1;
  int upcomingPage = 1;

  final dio = Dio();

  @override
  void onInit() {
    _fetchPopular(popularPage);
    _fetchNowPlaying(nowPlayingPage);
    _fetchUpcoming(upcomingPage);
    super.onInit();
  }

  void _fetchPopular(int page) async {
    dio.get("${BaseUrl.uriPopular}&page=$page").then((value) {
      var populars = value.data['results'];
      for (Map i in populars) {
        popularList.add(Movie.fromMap(i as Map<String, dynamic>));
      }
    });
  }

  void fetchMorePopular() {
    debugPrint("get more popular");
    _fetchPopular(popularPage + 1);
    popularPage += 1;
  }

  void _fetchUpcoming(int page) async {
    dio.get("${BaseUrl.uriUpcoming}&page=$page").then((value) {
      var upcomings = value.data['results'];
      for (Map i in upcomings) {
        upcomingList.add(Movie.fromMap(i as Map<String, dynamic>));
      }
    });
  }

  void fetchMoreUpcoming() {
    debugPrint("get more upcoming");
    _fetchUpcoming(upcomingPage + 1);
    upcomingPage += 1;
  }

  void _fetchNowPlaying(int page) async {
    dio.get("${BaseUrl.uriNowPlaying}&page=$page").then((value) {
      var nowPlayings = value.data['results'];
      for (Map i in nowPlayings) {
        nowPlayingList.add(Movie.fromMap(i as Map<String, dynamic>));
      }
    });
  }

  void fetchMoreNowPlaying() {
    debugPrint("get more now playing");
    _fetchNowPlaying(nowPlayingPage + 1);
    nowPlayingPage += 1;
  }
}
