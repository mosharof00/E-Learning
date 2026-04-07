import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';

import '../../../../../gen/colors.gen.dart';
import '../../../../../global/custom_appbar.dart';
import '../../../../../helper/app_text_style.dart';
import '../controllers/attendance_board_cards_controller.dart';

class AttendanceBoardCardsView extends GetView<AttendanceBoardCardsController> {
  const AttendanceBoardCardsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
      // iconImage: Assets.images.appbar.path,
      title: 'Attendance',
      elevation: 0,
    ),
      body: ListView.builder(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        itemCount: 20,
        itemBuilder: (context, index) {
          // Use modulo operator to ensure index stays within the bounds of the list length
          String textToShow = controller.text[index % controller.text.length];
          String picToShow = controller.pic[index % controller.pic.length];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              surfaceTintColor: Colors.white,
              elevation: 8, // Adjust elevation according to your design
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 35.h,
                      width: 2.w,
                      color: ColorName.pink.withOpacity(0.5),
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppTextStyle(
                          text: textToShow,
                          color: Colors.black,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w700,
                        ),
                        SizedBox(height: 4.h),
                        AppTextStyle(
                          text: '09:00 AM - 10:00 AM',
                          color: Colors.black.withOpacity(0.7),
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ],
                    ),
                    SizedBox(width: 28.w),
                    Container(
                      height: 35.h,
                      width: 2.w,
                      color: ColorName.pink.withOpacity(0.5),
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppTextStyle(
                          text: '${'Name'.tr} Xyz',
                          color: Colors.black,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w700,
                          height: 0,
                        ),
                        SizedBox(height: 5.h),
                        AppTextStyle(
                          text: 'Monday, 01 Jan’24',
                          color: Colors.black.withOpacity(0.7),
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ],
                    ),
                    SizedBox(width: 15.w),
                    SvgPicture.asset(
                      picToShow,
                      height: 30.h,
                      width: 30.w,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
