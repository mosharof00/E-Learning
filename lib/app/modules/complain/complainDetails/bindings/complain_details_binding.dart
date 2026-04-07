import 'package:get/get.dart';

import '../controllers/complain_details_controller.dart';


class ComplainDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ComplainDetailsController>(
      () => ComplainDetailsController(),
    );
  }
}
