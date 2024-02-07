import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/app/routes/app_pages.dart';
import 'package:quiz_app/core/const/app_color.dart';
import 'package:quiz_app/widgets/app_text.dart';

class AnswerCart extends StatelessWidget {
  const AnswerCart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: AppColor.white, borderRadius: BorderRadius.circular(8)),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Radio(
              activeColor: AppColor.primary,
              value: 'ok',
              groupValue: ['ok', "hi"],
              onChanged: (value) {
                Get.toNamed(Routes.CONGRATULATION);
              }),
          Expanded(
            child: AppText(
                color: AppColor.black,
                text:
                    "Wie heißt Mary Bergmann aus den belieben CHECK24 Werbespots auf Instagram?"),
          )
        ]),
      ),
    );
  }
}
