import 'package:get/get.dart';

import '../controllers/post_feed_controller.dart';

class PostFeedBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PostFeedController>(
      () => PostFeedController(),
    );
  }
}
