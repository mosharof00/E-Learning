import 'package:get/get.dart';

import '../controllers/add_complain_controller.dart';

class AddComplainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddComplainController>(
      () => AddComplainController(),
    );
  }
}
