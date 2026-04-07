import 'package:get/get.dart';

import '../controllers/attendance_board_cards_controller.dart';

class AttendanceBoardCardsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AttendanceBoardCardsController>(
      () => AttendanceBoardCardsController(),
    );
  }
}
