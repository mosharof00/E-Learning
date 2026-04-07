import 'package:elearning/gen/assets.gen.dart';
import 'package:elearning/gen/colors.gen.dart';
import 'package:elearning/helper/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class RoutineClards extends StatelessWidget {
  const RoutineClards({super.key});

  @override
  Widget build(BuildContext context) {

    List<String> subText = ['English', 'Bangla', 'Math', 'Science','Islam'];
    List<String> pics = [Assets.images.eng, Assets.images.ban, Assets.images.math, Assets.images.scienceSvg,Assets.images.islam];
    List<String> time = ['09:00 AM - 10:00 AM', '10:00 AM - 11:00 AM', '11:00 AM - 12:00 AM', '12:00 AM - 01:00 PM','01:00 PM - 02:00 PM'];

    return ListView.builder(
        itemCount: 15,
        itemBuilder: (context, item) {
          String textToShow = subText[item % subText.length];
          String picsToShow = pics[item % pics.length];
          String timeToShow = time[item % time.length];

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Container(
                // width: 330,
                // height: 82.h,
                padding: const EdgeInsets.all(10),
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x19000000),
                      blurRadius: 5,
                      offset: Offset(1, 2),
                      spreadRadius: 0,
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    SvgPicture.asset(
                        picsToShow,
                      height: 62.h,
                      width: 62.h,
                    ),
                    SizedBox(width: 20.w),
                    Container(
                      width: 2,
                      height: 58.h,
                      color: ColorName.pink.withOpacity(0.5),
                    ),
                    SizedBox(width: 5.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppTextStyle(
                            text: timeToShow,
                            color: Colors.black,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w700,
                          ),
                          SizedBox(height: 4.h),
                          Row(
                            children: [
                              AppTextStyle(
                                text: '${'Subject'.tr}: ',
                                color: Colors.black.withOpacity(0.7),
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                              ),
                              AppTextStyle(
                                text: textToShow,
                                color: Colors.black.withOpacity(0.7),
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w700,
                              ),
                            ],
                          ),
                          SizedBox(height: 4.h),
                          Row(
                            children: [
                              AppTextStyle(
                                text: '${'Teacher'.tr}: ',
                                color: Colors.black.withOpacity(0.7),
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                              ),
                              AppTextStyle(
                                text: 'Mr. Xyz',
                                color: Colors.black.withOpacity(0.7),
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w700,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
