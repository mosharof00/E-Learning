import 'package:elearning/services/local_store_config.dart';
import 'package:get/get.dart';

class ChatsController extends GetxController {

  String? currentUserID = "123";
  String? otherUserID = "321";
  final count = 0.obs;
  @override
  void onInit() {
    currentUserID = HiveService.getUserID();
    otherUserID = Get.arguments.toString();
    super.onInit();
  }


}
