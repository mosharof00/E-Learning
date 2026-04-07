import 'package:elearning/app/modules/quiz/contestLeaderboard/widget/banner.dart';
import 'package:elearning/app/routes/app_pages.dart';
import 'package:elearning/gen/colors.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../global/custom_appbar.dart';
import '../../../../../global/label_with_title_view_all.dart';
import '../controllers/leaderboard_controller.dart';
import '../widget/leader_list.dart';

class LeaderboardView extends GetView<LeaderboardController> {
  const LeaderboardView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorName.white,
      appBar: CustomAppbar(
        title: 'Leaderboard',
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Material(
              elevation: 5, // Add elevation here
              borderRadius: BorderRadius.circular(10.0),
              child: const ContestBannerWidget(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TitleWithViewAllWidget(
              topPadding: 0,
              title: "All Players",
              viewAll: "View All",
              onTap: () {
                Get.toNamed(Routes.PLAYER);
              },
            ),
          ),
          const Expanded(flex: 3, child: LeaderList()),
          Container(
            width: Get.width,
            height: 120.h,
            decoration: const BoxDecoration(
              color: ColorName.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
            ),
            child: const Padding(
              padding: EdgeInsets.only(left: 8, right: 8),
              child: Center(
                child: LeaderList(
                  index: 0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
