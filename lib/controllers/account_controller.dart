import 'package:dio/dio.dart';
import 'package:dpilem/models/user_model.dart';
import 'package:dpilem/statics/api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountController extends GetxController {
  var user = Rxn<User>();
  RxString? requestToken;

  final dio = Dio();

  @override
  void onInit() {
    createSession();
    // _fetchUserDetail();
    super.onInit();
  }

  void createSession() {
    dio.get(BaseUrl.tmdbSession).then((value) {
      var res = value.data;
      if (res['success']) {
        requestToken = RxString(res['request_token']);
      }
      print(requestToken);
    });
  }

  void login(String usn, String pwd) {
    if (requestToken == null) {
      createSession();
    }
    try {
      dio.get(BaseUrl.login(requestToken!.value, usn, pwd)).then((value) {
        var res = value.data;
        if (res['success']) {
          user = Rxn(User(
              id: 1111, avatar: {}, username: usn, name: "Dhohir Pradana"));
        }
        update();
        print(user);
      });
    } catch (e) {
      print("login failed!");
    }
  }

  // Details Account Belum

  // void _fetchUserDetail() {
  //   print("get user");
  //   dio.get(BaseUrl.detailAccount).then((value) {
  //     print(value);
  //     var details = value.data;
  //     user = Rxn(User.fromMap(details));
  //     update();
  //   }).catchError((error) => debugPrint(error.toString()));
  // }
}
