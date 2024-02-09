import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/core/const/app_color.dart';
import 'package:quiz_app/widgets/app_text.dart';

class ProgressBar extends StatelessWidget {
  const ProgressBar({
    super.key,
    required this.progress,
    required this.timeCount,
  });
  final double progress;
  final double timeCount;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Stack(
          children: [
            AnimatedContainer(
              duration: const Duration(seconds: 1),
              height: 15,
              width: Get.width / 10 * 10 - 120,
              decoration: BoxDecoration(
                color: AppColor.white,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            AnimatedContainer(
              duration: const Duration(seconds: 1),
              height: 15,
              width: ((Get.width - 120) / 10 * progress),
              decoration: BoxDecoration(
                color: AppColor.progress,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ],
        ),
        AnimatedContainer(
          duration: Duration(seconds: 1),
          width: 50,
          height: 50,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColor.white,
          ),
          child: AppText(
            minFontSize: 24,
            maxFontSize: 30,
            text: "$timeCount",
            color: AppColor.warning,
            textAlign: TextAlign.center,
          ),
        )
      ],
    );
  }
}
