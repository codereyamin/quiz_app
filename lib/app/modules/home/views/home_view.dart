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
      backgroundColor: AppColor.primary,
      appBar: AppBar(
        backgroundColor: AppColor.primary,
        title: const AppText(
          text: AppConst.appName,
          fontWeight: FontWeight.bold,
          minFontSize: 18,
          maxFontSize: 24,
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
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: AppColor.white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    AppText(text: "Heigest Scre :"),
                    AppText(text: "50"),
                  ],
                ),
              ),
            ),
            GapWidget(
              height: 0.080,
            ),
            ElevatedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.arrow_forward_ios),
                style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(20),
                    shape: BeveledRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                label: AppText(text: "Start New Game")),
          ],
        ),
      ),
    );
  }
}
