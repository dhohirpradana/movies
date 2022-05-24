import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:youtap_movie/models/movie/popular_model.dart';

import '../statics/api.dart';

class MovieController extends GetxController {
  var popularList = <Popular>[].obs;
  var upcomingList = <Popular>[].obs;
  var nowPlayingList = <Popular>[].obs;

  final dio = Dio();

  @override
  void onInit() {
    fetchPopular(1);
    fetchUpcoming(1);
    fetchNowPlaying(1);
    super.onInit();
  }

  void fetchPopular(int page) async {
    dio.get("${BaseUrl.uriPopular}&page=$page").then((value) {
      var populars = value.data['results'];
      for (Map i in populars) {
        popularList.add(Popular.fromMap(i as Map<String, dynamic>));
      }
    }).catchError((error) => print(error));
  }

  void fetchUpcoming(int page) async {
    dio.get("${BaseUrl.uriUpcoming}&page=$page").then((value) {
      var upcomings = value.data['results'];
      for (Map i in upcomings) {
        upcomingList.add(Popular.fromMap(i as Map<String, dynamic>));
      }
    }).catchError((error) => print(error));
  }

  void fetchNowPlaying(int page) async {
    dio.get("${BaseUrl.uriNowPlaying}&page=$page").then((value) {
      var nowPlayings = value.data['results'];
      for (Map i in nowPlayings) {
        nowPlayingList.add(Popular.fromMap(i as Map<String, dynamic>));
      }
    }).catchError((error) => print(error));
  }
}
