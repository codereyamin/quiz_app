import 'dart:async';

import 'package:get/get.dart';
import 'package:quiz_app/app/routes/app_pages.dart';

class SplashController extends GetxController {
  gotoHomeScreen() {
    Timer(Duration(seconds: 2), () {
      Get.offAllNamed(Routes.HOME);
    });
  }

  @override
  void onInit() {
    gotoHomeScreen();
    super.onInit();
  }
}
