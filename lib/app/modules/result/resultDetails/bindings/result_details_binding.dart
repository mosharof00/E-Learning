import 'package:get/get.dart';

import '../controllers/result_details_controller.dart';

class ResultDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ResultDetailsController>(
      () => ResultDetailsController(),
    );
  }
}
