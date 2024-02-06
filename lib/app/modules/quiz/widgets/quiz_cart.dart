import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/app/modules/quiz/widgets/answer_cart.dart';
import 'package:quiz_app/core/const/app_color.dart';
import 'package:quiz_app/core/const/app_const.dart';
import 'package:quiz_app/widgets/app_text.dart';
import 'package:quiz_app/widgets/gap_widget.dart';

class QuizCart extends StatelessWidget {
  const QuizCart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Column(children: [
              GapWidget(
                height: 0.02,
              ),
              Image.network(
                AppConst.appDevImage,
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
                    child: Icon(
                      Icons.error_outline,
                      color: Colors.red,
                      size: 48.0,
                    ),
                  );
                },
              ),
            ]),
            GapWidget(
              height: 0.02,
            ),
            AppText(
                textAlign: TextAlign.center,
                color: AppColor.white,
                text:
                    "Wie heißt Mary Bergmann aus den belieben CHECK24 Werbespots auf Instagram?"),
            ...List.generate(5, (index) => AnswerCart())
          ],
        ),
      ),
    );
  }
}
