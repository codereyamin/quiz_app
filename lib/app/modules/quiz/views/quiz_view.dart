// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:quiz_app/app/modules/quiz/widgets/can_pop_widget_call.dart';
import 'package:quiz_app/app/modules/quiz/widgets/progress_bar.dart';
import 'package:quiz_app/app/modules/quiz/widgets/quiz_cart.dart';
import 'package:quiz_app/core/const/app_color.dart';
import 'package:quiz_app/widgets/app_text.dart';

import '../controllers/quiz_controller.dart';

class QuizView extends StatelessWidget {
  const QuizView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetX<QuizController>(builder: (controller) {
      return WillPopScope(
        onWillPop: () async => canPopWidgetCall(controller.quizIsExit),
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: controller.isLoading.value
                ? null
                : AppText(
                    text:
                        "Quiz Number Off ${controller.selectQuizCount.value} in ${controller.quizQuestionList.length}",
                    minFontSize: 24,
                    maxFontSize: 30,
                    color: AppColor.white,
                  ),
          ),
          body: controller.isLoading.value
              ? Center(
                  child: SizedBox(
                    width: Get.width / 10 * 2,
                    height: Get.width / 10 * 2,
                    child: const CircularProgressIndicator(),
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      Obx(
                        () => ProgressBar(
                          timeCount: controller.timeCount.value.toDouble(),
                          progress: controller.progress.value.toDouble(),
                        ),
                      ),
                      Obx(
                        () => AppText(
                          text: "Total Score ${controller.totalScore.value}",
                          minFontSize: 24,
                          maxFontSize: 30,
                          color: AppColor.white,
                        ),
                      ),
                      Expanded(
                        child: PageView.builder(
                          controller: controller.controller,
                          itemCount: controller.quizQuestionList.length,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            var quizItem = controller.quizQuestionList[index];
                            return QuizCard(
                              selectQuiz: index,
                              questions: quizItem,
                              controller: controller,
                            );
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
