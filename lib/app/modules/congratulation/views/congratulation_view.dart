import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/core/const/app_color.dart';
import 'package:quiz_app/widgets/app_text.dart';
import 'package:quiz_app/widgets/gap_widget.dart';
import '../controllers/congratulation_controller.dart';

class CongratulationView extends GetView<CongratulationController> {
  const CongratulationView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: CongratulationController(),
        builder: (context) {
          return Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppText(
                    text: 'Congratulation',
                    minFontSize: 30,
                    maxFontSize: 40,
                    color: AppColor.white,
                    fontWeight: FontWeight.bold,
                  ),
                  GapWidget(
                    height: 0.05,
                  ),
                  AppText(
                    text: 'You Have Earn 500 Point',
                    color: AppColor.white,
                    fontWeight: FontWeight.bold,
                  ),
                  GapWidget(
                    height: 0.05,
                  ),
                  ElevatedButton.icon(
                      onPressed: () {
                        Get.close(2);
                      },
                      icon: Icon(Icons.home),
                      label: AppText(text: "Go To Home"))
                ],
              ),
            ),
          );
        });
  }
}
