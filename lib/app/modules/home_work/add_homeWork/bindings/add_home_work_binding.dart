import 'package:get/get.dart';

import '../controllers/add_home_work_controller.dart';

class AddHomeWorkBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddHomeWorkController>(
      () => AddHomeWorkController(),
    );
  }
}
