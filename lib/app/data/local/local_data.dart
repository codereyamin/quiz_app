import 'package:get_storage/get_storage.dart';
import 'package:quiz_app/app/data/local/local_data_key.dart';

class LocalData {
  var box = GetStorage();
  Future<int> getHeightScore() async {
    return box.read(LocalDataKey.heightScore) ?? 0;
  }

  setHeightScore(int score) async {
    var localScore = await getHeightScore();
    if (localScore < score) {
      await box.write(LocalDataKey.heightScore, score);
      box.save();
    }
  }
}
