import 'package:badges/badges.dart';
import 'package:elearning/app/modules/community/groups/views/groups_view.dart';
import 'package:elearning/app/modules/postFeed/views/post_feed_view.dart';
import 'package:elearning/gen/colors.gen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:badges/badges.dart' as badge;
import '../askQuestion/views/ask_question_view.dart';
import '../messages/views/messages_view.dart';

class CommunityController extends GetxController
    with GetSingleTickerProviderStateMixin {
  //TODO: Implement CommunityController

  late TabController tabController;

  final selectedIndex = 0.obs;
  final selectedColor = ColorName.primary;
  final unselectedColor = const Color(0xff5f6368);
  final tabs = [
    Tab(text: 'Posts'.tr, icon: const Icon(Icons.post_add)),
    Tab(text: 'Groups'.tr, icon: const Icon(Icons.group)),
    Tab(
        text: 'Messages'.tr,
        icon: badge.Badge(
          //badgeColor: Colors.indigo,
          position: BadgePosition.topEnd(top: -20, end: -10),

          badgeContent: const Text(
            "10",
            style: TextStyle(color: Colors.white),
          ),
          child: const Icon(Icons.message),
        )),
    Tab(text: 'Q&N'.tr, icon: const Icon(Icons.question_answer)),
  ];

  final tabViews = [
    const PostFeedView(),
    const GroupsView(),
    const MessagesView(),
    const AskQuestionView(),
  ];

  final count = 0.obs;
  @override
  void onInit() {
    tabController = TabController(
      length: tabs.length,
      vsync: this,
    );

    tabController.addListener(() {
      selectedIndex.value = tabController.index;
    });
    super.onInit();
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }

  void increment() => count.value++;
}
