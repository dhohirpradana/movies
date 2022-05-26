import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skeletons/skeletons.dart';
import 'package:dpilem/views/pages/foundation_page.dart';

import 'controllers/account_controller.dart';

final _accountController = Get.put(AccountController());
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    _accountController.createSession();
    return SkeletonTheme(
      child: GetMaterialApp(
        theme: ThemeData(
          textTheme: TextTheme(
            headline6: GoogleFonts.exo2(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        darkTheme: ThemeData(
          brightness: Brightness.dark,
          /* dark theme settings */
        ),
        themeMode: ThemeMode.dark,
        title: 'YouTap App',
        debugShowCheckedModeBanner: false,
        defaultTransition: Transition.rightToLeft,
        home: const FoundationPage(),
      ),
    );
  }
}
