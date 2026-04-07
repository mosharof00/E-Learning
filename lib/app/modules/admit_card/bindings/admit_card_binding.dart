import 'package:get/get.dart';

import '../controllers/admit_card_controller.dart';

class AdmitCardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AdmitCardController>(
      () => AdmitCardController(),
    );
  }
}
