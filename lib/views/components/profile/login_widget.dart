import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/account_controller.dart';

class LoginWidget extends StatelessWidget {
  LoginWidget({Key? key}) : super(key: key);
  final _accountController = Get.put(AccountController());
  final TextEditingController _controllerUsn = TextEditingController();
  final TextEditingController _controllerPwd = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: const Text(
            "LOGIN",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 193, 96, 248),
                fontSize: 36),
            textAlign: TextAlign.left,
          ),
        ),
        SizedBox(height: size.height * 0.03),
        Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.symmetric(horizontal: 40),
          child: TextField(
            controller: _controllerUsn,
            decoration: const InputDecoration(labelText: "Username"),
          ),
        ),
        SizedBox(height: size.height * 0.03),
        Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.symmetric(horizontal: 40),
          child: TextField(
            controller: _controllerPwd,
            decoration: const InputDecoration(labelText: "Password"),
            obscureText: true,
          ),
        ),
        SizedBox(height: size.height * 0.05),
        Container(
          alignment: Alignment.centerRight,
          margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
          // ignore: deprecated_member_use
          child: RaisedButton(
            onPressed: () {
              _accountController.login(
                  _controllerUsn.text, _controllerPwd.text);
            },
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(80.0)),
            textColor: Colors.white,
            padding: const EdgeInsets.all(0),
            child: Container(
              alignment: Alignment.center,
              height: 50.0,
              width: size.width * 0.5,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(80.0),
                  gradient: const LinearGradient(colors: [
                    Color.fromARGB(255, 193, 96, 248),
                    Color.fromARGB(255, 221, 153, 238)
                  ])),
              padding: const EdgeInsets.all(0),
              child: const Text(
                "LOGIN",
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
