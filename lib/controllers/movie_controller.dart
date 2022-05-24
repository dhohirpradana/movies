import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:youtap_movie/models/movie/popular_model.dart';

class MovieController extends GetxController {
  var popularList = <Popular>[].obs;
  var upcomingList = <Popular>[].obs;
  var nowPlayingList = <Popular>[].obs;

  final dio = Dio();

  final uriPopular =
      "https://api.themoviedb.org/3/movie/popular?api_key=4a8d660fdeebedfe22bc20d751c367ac";
  final uriNowPlaying =
      "https://api.themoviedb.org/3/movie/now_playing?api_key=4a8d660fdeebedfe22bc20d751c367ac";
  final uriUpcoming =
      "https://api.themoviedb.org/3/movie/upcoming?api_key=4a8d660fdeebedfe22bc20d751c367ac";

  @override
  void onInit() {
    fetchPopular(uriPopular);
    fetchUpcoming(uriUpcoming);
    fetchNowPlaying(uriNowPlaying);
    super.onInit();
  }

  void fetchPopular(url) async {
    dio.get(url).then((value) {
      var populars = value.data['results'];
      for (Map i in populars) {
        popularList.add(Popular.fromMap(i as Map<String, dynamic>));
      }
    }).catchError((error) => print(error));
  }

  void fetchUpcoming(url) async {
    dio.get(url).then((value) {
      var upcomings = value.data['results'];
      for (Map i in upcomings) {
        upcomingList.add(Popular.fromMap(i as Map<String, dynamic>));
      }
    }).catchError((error) => print(error));
  }

  void fetchNowPlaying(url) async {
    dio.get(url).then((value) {
      var nowPlayings = value.data['results'];
      for (Map i in nowPlayings) {
        nowPlayingList.add(Popular.fromMap(i as Map<String, dynamic>));
      }
    }).catchError((error) => print(error));
  }
}
