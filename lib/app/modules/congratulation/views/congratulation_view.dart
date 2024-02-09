import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/core/const/app_color.dart';
import 'package:quiz_app/widgets/app_text.dart';
import 'package:quiz_app/widgets/gap_widget.dart';
import '../controllers/congratulation_controller.dart';

class CongratulationView extends StatelessWidget {
  const CongratulationView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetX<CongratulationController>(builder: (controller) {
      return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const AppText(
                text: 'Congratulation',
                minFontSize: 30,
                maxFontSize: 40,
                color: AppColor.white,
                fontWeight: FontWeight.bold,
              ),
              const GapWidget(
                height: 0.05,
              ),
              AppText(
                text: 'You Have Earn ${controller.totalScore.value} Point',
                color: AppColor.white,
                fontWeight: FontWeight.bold,
              ),
              const GapWidget(
                height: 0.05,
              ),
              ElevatedButton.icon(
                  onPressed: () {
                    ///////////// home screen got ot function call
                    controller.goToHomeScreen();
                  },
                  icon: const Icon(Icons.home),
                  label: const AppText(text: "Go To Home"))
            ],
          ),
        ),
      );
    });
  }
}
