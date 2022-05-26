import 'package:dpilem/controllers/account_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({Key? key}) : super(key: key);

  final _accountController = Get.put(AccountController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // body: GetX<AccountController>(builder: (_) {
        //   if (_accountController.user == null) {
        //     return const Center(child: CircularProgressIndicator());
        //   } else {
        //     print(_accountController.user);
        //     return Center(
        //       child: Text(_accountController.user!.name),
        //     );
        //   }
        // }),
        );
  }
}
