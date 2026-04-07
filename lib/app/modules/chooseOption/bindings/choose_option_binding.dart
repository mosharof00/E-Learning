import 'package:get/get.dart';

import '../controllers/choose_option_controller.dart';

class ChooseOptionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChooseOptionController>(
      () => ChooseOptionController(),
    );
  }
}
