import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/app/modules/quiz/controllers/quiz_controller.dart';
import 'package:quiz_app/core/const/app_color.dart';
import 'package:quiz_app/widgets/app_text.dart';

class AnswerCart extends StatelessWidget {
  const AnswerCart({
    super.key,
    required this.option,
    required this.type,
    required this.thisType,
    required this.controller,
  });
  final String option;
  final String type;
  final String thisType;
  final QuizController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Container(
          padding: const EdgeInsets.all(8),
          ///////////// first check this option is user clicked
          decoration: controller.isSelected.value &&
                  controller.isSelectedType.value == thisType
              ? BoxDecoration(
                  /////////////// user this click then ans depend color change
                  color: type == controller.isCorrectAns.value
                      ? AppColor.green
                      : AppColor.warning,
                  borderRadius: BorderRadius.circular(8))

              /////////////// user this not click then  color not change
              : BoxDecoration(
                  color: AppColor.white,
                  borderRadius: BorderRadius.circular(8)),
          child: AppText(color: AppColor.black, text: option),
        ),
      ),
    );
  }
}
