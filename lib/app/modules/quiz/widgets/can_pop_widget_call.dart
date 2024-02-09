import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/widgets/app_text.dart';
import 'package:quiz_app/widgets/gap_widget.dart';

Future<bool> canPopWidgetCall(RxBool quizIsExit) async {
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
                quizIsExit.value = true;
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
}
