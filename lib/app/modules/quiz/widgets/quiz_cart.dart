import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/app/data/models/quiz_data_model.dart';
import 'package:quiz_app/app/modules/quiz/controllers/quiz_controller.dart';
import 'package:quiz_app/app/modules/quiz/widgets/answer_cart.dart';
import 'package:quiz_app/core/const/app_color.dart';
import 'package:quiz_app/widgets/app_text.dart';
import 'package:quiz_app/widgets/gap_widget.dart';

class QuizCard extends StatelessWidget {
  const QuizCard({
    super.key,
    required this.selectQuiz,
    required this.questions,
    required this.controller,
  });
  final int selectQuiz;
  final Questions questions;
  final QuizController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      child: SingleChildScrollView(
        child: Column(
          children: [
            //////////////////  quiz image
            if (questions.questionImageUrl != null &&
                questions.questionImageUrl != "null")
              Column(children: [
                const GapWidget(height: 0.02),
                Image.network(
                  questions.questionImageUrl!,
                  height: Get.width / 2,
                  width: Get.width / 10 * 8,
                  fit: BoxFit.cover,
                  loadingBuilder: (BuildContext context, Widget child,
                      ImageChunkEvent? loadingProgress) {
                    if (loadingProgress == null) {
                      return child; // Display the image as it loads
                    } else {
                      return Center(
                        child: CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                                  loadingProgress.expectedTotalBytes!
                              : null,
                        ),
                      );
                    }
                  },
                  errorBuilder: (BuildContext context, Object error,
                      StackTrace? stackTrace) {
                    return Center(
                      child: Container(
                        height: Get.width / 2,
                        width: Get.width / 10 * 8,
                        color: AppColor.white,
                        child: const Icon(
                          Icons.error_outline,
                          color: Colors.red,
                          size: 48.0,
                        ),
                      ),
                    );
                  },
                ),
              ]),
            ////////// using space
            const GapWidget(
              height: 0.02,
            ),

            ///////////// quiz question
            AppText(
                textAlign: TextAlign.center,
                color: AppColor.white,
                text: questions.question.toString()),
            ////////////////    option 1
            if (questions.answers?.a?.value != null)
              GestureDetector(
                onTap: () {
                  controller.setQuizData(
                      questions: questions,
                      type: questions.answers?.a?.dataKey ?? "");
                },
                child: AnswerCart(
                  thisType: "A",
                  type: questions.answers!.a!.dataKey.toString(),
                  option: questions.answers!.a!.value.toString(),
                  controller: controller,
                ),
              ),
            /////////////////  option 2
            if (questions.answers?.b?.value != null)
              GestureDetector(
                onTap: () {
                  controller.setQuizData(
                      questions: questions,
                      type: questions.answers?.b?.dataKey ?? "");
                },
                child: AnswerCart(
                  thisType: "B",
                  type: questions.answers!.b!.dataKey.toString(),
                  option: questions.answers!.b!.value.toString(),
                  controller: controller,
                ),
              ),
            ////////////   option 3
            if (questions.answers?.c?.value != null)
              GestureDetector(
                onTap: () {
                  controller.setQuizData(
                      questions: questions,
                      type: questions.answers?.c?.dataKey ?? "");
                },
                child: AnswerCart(
                  thisType: "C",
                  type: questions.answers!.c!.dataKey.toString(),
                  option: questions.answers!.c!.value.toString(),
                  controller: controller,
                ),
              ),
            ///////////////   option 4
            if (questions.answers?.d?.value != null)
              GestureDetector(
                onTap: () {
                  controller.setQuizData(
                      questions: questions,
                      type: questions.answers?.d?.dataKey ?? "");
                },
                child: AnswerCart(
                  thisType: "D",
                  type: questions.answers!.d!.dataKey.toString(),
                  option: questions.answers!.d!.value.toString(),
                  controller: controller,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
