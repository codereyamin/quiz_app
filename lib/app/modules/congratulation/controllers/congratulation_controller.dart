import 'package:get/get.dart';
import 'package:quiz_app/app/data/local/local_data.dart';
import 'package:quiz_app/app/modules/home/controllers/home_controller.dart';
import 'package:quiz_app/app/routes/app_pages.dart';

class CongratulationController extends GetxController {
  RxInt totalScore = RxInt(0);
  final homeController = Get.find<HomeController>();

  onDataSet() {
    totalScore.value = Get.arguments as int;
  }

  goToHomeScreen() async {
    //////////// first set local storage data
    await LocalData().setHeightScore(totalScore.value);

    //////////// home screen data update
    homeController.fetchLocalData();
    ///////////// previews screen data remove
    Get.offAllNamed(Routes.HOME);
  }

  @override
  void onInit() {
    ////////// initial state data set function call
    onDataSet();
    super.onInit();
  }
}
