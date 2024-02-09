import 'package:get_storage/get_storage.dart';
import 'package:quiz_app/app/data/local/local_data_key.dart';

class LocalData {
  var box = GetStorage(); /////////// instant of getStorage

  ////////////// get to local storage height score
  Future<int> getHeightScore() async {
    return box.read(LocalDataKey.heightScore) ?? 0;
  }

///////////// set or storage height score local
  setHeightScore(int score) async {
    var localScore = await getHeightScore(); //////////// get local storage
    ////////////// compare to tow data
    if (score > localScore) {
      // source data is big to storage
      await box.write(LocalDataKey.heightScore, score);
      box.save();
    }
  }
}
