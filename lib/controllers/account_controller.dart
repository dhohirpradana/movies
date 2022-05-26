import 'package:dio/dio.dart';
import 'package:dpilem/models/user_model.dart';
import 'package:dpilem/statics/api.dart';
import 'package:get/get.dart';

class AccountController extends GetxController {
  User? user;

  final dio = Dio();

  @override
  void onInit() {
    _fetchUserDetail();
    super.onInit();
  }

  void _fetchUserDetail() {
    print("get user");
    dio.get(BaseUrl.detailAccount).then((value) {
      print(value);
      var details = value.data;
      user = details;
    });
  }
}
