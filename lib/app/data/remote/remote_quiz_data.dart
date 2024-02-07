import 'package:get/get.dart';
import 'package:quiz_app/app/data/models/quiz_data_model.dart';
import 'package:quiz_app/core/api/api_services.dart';
import 'package:quiz_app/core/const/api_url.dart';
import 'package:quiz_app/core/const/app_color.dart';
import 'package:quiz_app/widgets/app_text.dart';

class RemoteQuizData {
  ApiServices apiServices = ApiServices();
  Future<List<Questions>?> fetchQuizData() async {
    try {
      var apiData = await apiServices.get(url: ApiUrl.quizApi);
      if (apiData != null) {
        var quiz = QuizDataModel.fromJson(apiData);
        return quiz.questions;
      }
    } catch (e) {
      Get.bottomSheet(
        const AppText(
          text: "Something was wrong!",
          color: AppColor.white,
        ),
        isDismissible: true,
        backgroundColor: AppColor.warning,
      );
    }
    return null;
  }
}
