import 'package:get/get.dart';

import '../controllers/attendenceteacher_controller.dart';

class AttendanceteacherBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AttendanceteacherController>(
      () => AttendanceteacherController(),
    );
  }
}
