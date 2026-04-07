import 'package:elearning/global/app_primary_theme_method.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../../gen/assets.gen.dart';
import '../../../../../gen/colors.gen.dart';
import '../../../../../helper/app_text_style.dart';
import '../../../../routes/app_pages.dart';

class ContestBannerWidget extends StatelessWidget {
  const ContestBannerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    String currentState = Get.currentRoute;
    return Container(
      width: Get.width,
      height: 150.h,
      decoration: ShapeDecoration(
        gradient:  appLinearGradient(),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:  EdgeInsets.only(top: 10.h, left: 10.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppTextStyle(
                  text: 'Physic Contest',
                  color: ColorName.white,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: AppTextStyle(
                    text: 'Participate & improve your knowledge',
                    color: ColorName.white,
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                AppTextStyle(
                  text: 'End Date: 12-12-2021 12:00 PM',
                  color: Colors.white,
                  fontSize: 11,
                  fontWeight: FontWeight.w400,
                ),
                SizedBox(
                  height: 10.h,
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors
                        .white, // Setting transparent background to apply gradient
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                 // Border color
                    ),
                    elevation: 10,
                  ),
                  onPressed: () async {
                    if (currentState == '/mainpage' || currentState == '/quiz') {
                      await Get.toNamed(Routes.LEADERBOARD); // Wait for navigation
                      currentState = '/quiz/contestLeaderboard'; // Update state after navigation
                    } else {
                      await Get.toNamed(Routes.TIMER_QUIZ); // Wait for navigation
                      currentState = '/quiz/timer-quiz'; // Update state after navigation
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Center(
                      child: AppTextStyle(
                        text: "Join Now",
                        fontSize: 10.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: SvgPicture.asset(
              Assets.icons.award,
              height: 125.h,
              width: 80.h,
            ),
          ),
        ],
      ),
    );

  }
}
