import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:quiz_app/core/const/app_color.dart';
import 'package:quiz_app/widgets/app_text.dart';
import 'package:quiz_app/widgets/gap_widget.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: SplashController(),
        builder: (context) {
          return Scaffold(
            backgroundColor: AppColor.white,
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: Get.width / 10 * 2,
                    height: Get.width / 10 * 2,
                    child: const CircularProgressIndicator(
                        color: AppColor.primary, strokeWidth: 5),
                  ),
                  const GapWidget(
                    height: 0.08,
                  ),
                  const AppText(
                    text: "Loading.....",
                    color: AppColor.primary,
                  ),
                ],
              ),
            ),
          );
        });
  }
}
