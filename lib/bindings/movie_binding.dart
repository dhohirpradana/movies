import 'package:get/get.dart';

import '../controllers/movie_controller.dart';

class MovieBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MovieController>(() => MovieController());
    // Get.put<Service>(() => Api());
  }
}
