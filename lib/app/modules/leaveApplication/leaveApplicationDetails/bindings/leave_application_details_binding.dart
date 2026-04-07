import 'package:get/get.dart';

import '../controllers/leave_application_details_controller.dart';

class LeaveApplicationDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LeaveApplicationDetailsController>(
      () => LeaveApplicationDetailsController(),
    );
  }
}
