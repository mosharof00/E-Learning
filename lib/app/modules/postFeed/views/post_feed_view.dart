import 'package:elearning/gen/colors.gen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../global/widget/post_item_widget.dart';
import '../controllers/post_feed_controller.dart';

class PostFeedView extends GetView<PostFeedController> {
  const PostFeedView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorName.bgColor,
      body: ListView.builder(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          return const PostItemsWidget();
        },
      ),
    );
  }
}
