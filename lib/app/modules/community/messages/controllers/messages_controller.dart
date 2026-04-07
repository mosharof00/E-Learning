import 'package:elearning/services/local_store_config.dart';
import 'package:get/get.dart';

class MessagesController extends GetxController {
  //TODO: Implement MessagesController

  String currentUserId='';

  final count = 0.obs;
  @override
  void onInit() {
    currentUserId = HiveService.getUserID();
    super.onInit();
  }

}



