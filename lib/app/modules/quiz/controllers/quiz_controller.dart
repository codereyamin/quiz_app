import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/app/data/models/quiz_data_model.dart';
import 'package:quiz_app/app/data/source/quiz_data.dart';
import 'package:quiz_app/app/routes/app_pages.dart';

class QuizController extends GetxController {
  RxList<Questions> quizQuestionList = <Questions>[].obs;
  RxBool isLoading = RxBool(true);
  RxBool quizIsExit = RxBool(false);
  RxBool screenHold = RxBool(false);
  RxInt screenHoldCount = RxInt(0);
  RxInt selectQuiz = RxInt(0);
  RxInt selectQuizCount = RxInt(1);

  RxBool isSelected = RxBool(false);
  RxString isSelectedType = RxString("");
  RxString isCorrectAns = RxString("");
  RxInt timeCount = RxInt(10);
  RxInt progress = RxInt(0);
  RxInt totalScore = RxInt(0);
  late final PageController controller = PageController();

  setQuizData({required Questions questions, required String type}) async {
    if (screenHold.value) return;
    isCorrectAns.value = questions.correctAnswer.toString();
    isSelectedType.value = type;
    isSelected.value = true;
    screenHold.value = true;
    if (type == questions.correctAnswer) {
      totalScore.value = totalScore.value + questions.score!;
    }
  }

///////////// screen hold function
  screenHoldFunction() {
    screenHoldCount.value = screenHoldCount.value + 1;
////////// screen hold 2 second
    if (screenHoldCount.value == 2) {
      screenHoldCount.value = 0;
      screenHold.value = false; ///////// set all value
      isCorrectAns.value = "";
      isSelectedType.value = "";
      isSelected.value = false;
      changeQuestion();
    }
  }

/////////// one screen time increment function
  timeIncrementOrQuestionChange() {
    if (timeCount.value != 0) {
      timeCount.value = timeCount.value - 1;
      progress.value = progress.value + 1;
    } else {
      ///////////// time is finis than change quiz screen function call
      changeQuestion();
    }
  }

//////////// quiz chang function
  changeQuestion() {
    timeCount.value = 10;
    progress.value = 0;
    selectQuiz.value = selectQuiz.value + 1;
    screenHold.value = false;

    ////////////// check quiz is last
    if (selectQuiz.value != quizQuestionList.length) {
      selectQuizCount.value = selectQuizCount.value + 1;
      controller.animateToPage(selectQuiz.value,
          duration: const Duration(seconds: 1), curve: Curves.ease);
    }
  }

  timeCountAndNextQuiz() {
    //////////////// timer function
    Timer.periodic(const Duration(seconds: 1), (timer) {
      ///////////// user back or exit quiz than close this timer
      if (quizIsExit.value) {
        timer.cancel();
      }
      /////////////////////// check all quiz done
      if (selectQuiz.value > quizQuestionList.length - 1) {
        selectQuizCount.value = selectQuizCount.value + 1;
        //////////////// then timer off and goto result screen
        timer.cancel();
        Get.offAllNamed(Routes.CONGRATULATION, arguments: totalScore.value);
      }
/////////////// screen is hold than call hold function
      if (screenHold.value) {
        screenHoldFunction();
      } else {
        if (screenHold.value == false && isCorrectAns.value == "") {
          timeIncrementOrQuestionChange();
        }
      }
    });
  }

  ////////////// quiz data load function
  quizDataLoad() {
    QuizData().fetchData().then((value) {
      quizQuestionList.addAll(value);
      quizQuestionList.refresh();
      isLoading.value = false;
      update();
      ////////////// timer function call
      timeCountAndNextQuiz();
    });
  }

  @override
  void onInit() {
    quizDataLoad(); //////////// initial state quiz data call function
    super.onInit();
  }
}
