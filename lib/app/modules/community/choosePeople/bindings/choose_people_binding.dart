import 'package:get/get.dart';

import '../controllers/choose_people_controller.dart';

class ChoosePeopleBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChoosePeopleController>(
      () => ChoosePeopleController(),
    );
  }
}
