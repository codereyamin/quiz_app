import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:quiz_app/app/modules/quiz/widgets/progress_bar.dart';
import 'package:quiz_app/app/modules/quiz/widgets/quiz_cart.dart';
import 'package:quiz_app/core/const/app_color.dart';
import 'package:quiz_app/widgets/app_text.dart';

import '../controllers/quiz_controller.dart';

class QuizView extends GetView<QuizController> {
  const QuizView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    );
  }
}
