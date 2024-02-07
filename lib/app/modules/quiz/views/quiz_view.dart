// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:quiz_app/app/modules/quiz/widgets/progress_bar.dart';
import 'package:quiz_app/app/modules/quiz/widgets/quiz_cart.dart';
import 'package:quiz_app/core/const/app_color.dart';
import 'package:quiz_app/widgets/app_text.dart';
import 'package:quiz_app/widgets/gap_widget.dart';

import '../controllers/quiz_controller.dart';

class QuizView extends GetView<QuizController> {
  const QuizView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: QuizController(),
        builder: (context) {
          return WillPopScope(
            onWillPop: () async {
              bool canPop = false;
              await Get.dialog(Dialog(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GapWidget(
                      height: 0.05,
                    ),
                    AppText(text: "Are You Sure"),
                    GapWidget(
                      height: 0.02,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton.icon(
                          onPressed: () {
                            Get.back();
                            canPop = false;
                          },
                          icon: Icon(Icons.cancel),
                          label: AppText(text: "Cancel"),
                        ),
                        ElevatedButton.icon(
                          onPressed: () {
                            Get.back();
                            canPop = true;
                          },
                          icon: Icon(Icons.done),
                          label: AppText(text: "OK"),
                        ),
                      ],
                    ),
                    GapWidget(
                      height: 0.05,
                    ),
                  ],
                ),
              ));

              return canPop;
            },
            child: Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: false,
                title: AppText(
                  text: "Quiz Number Off 1 in 20",
                  minFontSize: 24,
                  maxFontSize: 30,
                  color: AppColor.white,
                ),
              ),
              body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    ProgressBar(
                      progress: 1,
                    ),
                    Expanded(
                      child: PageView.builder(
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return QuizCart();
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
