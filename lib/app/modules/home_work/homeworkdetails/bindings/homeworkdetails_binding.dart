import 'package:get/get.dart';

import '../controllers/homeworkdetails_controller.dart';

class HomeworkdetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeworkDetailsController>(
      () => HomeworkDetailsController(),
    );
  }
}
