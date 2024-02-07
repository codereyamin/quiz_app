import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:quiz_app/core/const/app_color.dart';
import 'package:quiz_app/core/const/app_const.dart';
import 'package:quiz_app/widgets/app_text.dart';
import 'package:quiz_app/widgets/gap_widget.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppText(
          text: AppConst.appName,
          fontWeight: FontWeight.bold,
          color: AppColor.white,
          minFontSize: 30,
          maxFontSize: 40,
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: AppColor.white,
                    borderRadius: BorderRadius.circular(5)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const AppText(text: "Heights Score :"),
                    AppText(text: "${controller.heightScore.value}"),
                  ],
                ),
              ),
            ),
            const GapWidget(
              height: 0.080,
            ),
            ElevatedButton.icon(
                onPressed: () {
                  controller.newQuiz();
                },
                icon: const Icon(Icons.arrow_forward_ios),
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(20),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                label: const AppText(text: "Start New Game")),
          ],
        ),
      ),
    );
  }
}
