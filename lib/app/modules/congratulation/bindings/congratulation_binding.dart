import 'package:get/get.dart';

import '../controllers/congratulation_controller.dart';

class CongratulationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CongratulationController>(
      () => CongratulationController(),
    );
  }
}
