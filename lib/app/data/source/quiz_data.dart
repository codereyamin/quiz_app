import 'package:connectivity/connectivity.dart';
import 'package:quiz_app/app/data/models/quiz_data_model.dart';
import 'package:quiz_app/app/data/remote/remote_quiz_data.dart';

class QuizData {
  Future<List<Questions>> fetchData() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      return [];
    } else {
      var data = await RemoteQuizData().fetchQuizData();
      if (data == null || data.isEmpty) return [];
      return data;
    }
  }
}
