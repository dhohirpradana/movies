import 'package:dpilem/controllers/account_controller.dart';
import 'package:dpilem/views/components/profile/login_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({Key? key}) : super(key: key);
  final _accountController = Get.put(AccountController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(() {
        if (_accountController.user.value == null) {
          return LoginWidget();
        } else {
          // print(_accountController.user);
          return Padding(
            padding: const EdgeInsets.all(14),
            child: Center(
              child: Column(
                children: [
                  const SizedBox(height: 14),
                  const CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage('https://i.pravatar.cc/300'),
                  ),
                  const SizedBox(height: 14),
                  Text(
                    _accountController.user.value!.name,
                    style: const TextStyle(fontSize: 24),
                  ),
                  Text(
                    "@${_accountController.user.value!.username}",
                    style: const TextStyle(fontSize: 18, color: Colors.white70),
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                    style: TextStyle(fontSize: 18, color: Colors.white70),
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),
          );
        }
      }),
    );
  }
}
