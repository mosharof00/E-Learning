import 'package:get/get.dart';

import '../controllers/add_leave_application_controller.dart';

class AddLeaveApplicationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddLeaveApplicationController>(
      () => AddLeaveApplicationController(),
    );
  }
}
