import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/app/data/local/local_data.dart';
import 'package:quiz_app/app/routes/app_pages.dart';
import 'package:quiz_app/widgets/app_text.dart';
import 'package:quiz_app/widgets/gap_widget.dart';

class HomeController extends GetxController {
  var hasInternet = false.obs;
  RxInt heightScore = RxInt(0);

  fetchLocalData() async {
    heightScore.value = await LocalData().getHeightScore();
  }

  internetListener() {
    Connectivity().onConnectivityChanged.listen(
      (ConnectivityResult result) {
        if (result == ConnectivityResult.none) {
          hasInternet.value = false;
        } else {
          hasInternet.value = true;
        }
      },
    );
  }

  newQuiz() {
    if (hasInternet.value) {
      Get.toNamed(Routes.QUIZ);
    } else {
      Get.dialog(Dialog(
        child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const GapWidget(
                height: 0.05,
              ),
              const AppText(text: "Error"),
              const GapWidget(
                height: 0.05,
              ),
              const AppText(text: "You Have No Internet"),
              const GapWidget(
                height: 0.05,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: const AppText(text: "Ok"),
                ),
              ),
              const GapWidget(
                height: 0.05,
              ),
            ]),
      ));
    }
  }

  @override
  void onInit() {
    fetchLocalData();
    internetListener();

    super.onInit();
  }
}
