import 'package:elearning/app/routes/app_pages.dart';
import 'package:elearning/gen/assets.gen.dart';
import 'package:elearning/gen/colors.gen.dart';
import 'package:elearning/global/bottomsheet/filter.dart';
import 'package:elearning/global/custom_appbar.dart';
import 'package:elearning/helper/app_text_style.dart';
import 'package:elearning/helper/config_file.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../../global/app_primary_theme_method.dart';
import '../controllers/home_work_controller.dart';

class HomeWorkView extends GetView<HomeWorkController> {
  const HomeWorkView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: isTeacher()
          ? Row(
              children: [
                const Spacer(),
                InkWell(
                  onTap: () {
                    Get.toNamed(Routes.ADD_HOME_WORK);
                  },
                  child: Container(
                    height: 40.h,
                    width: 120.w,
                    decoration: ShapeDecoration(
                      gradient: appLinearGradient(),
                      shape: RoundedRectangleBorder(
                        side:
                            const BorderSide(width: 2, color: ColorName.start),
                        borderRadius: BorderRadius.circular(50.r),
                      ),
                      shadows: [
                        BoxShadow(
                          color: ColorName.secondPrimary,
                          blurRadius: 10,
                          offset: const Offset(0, 0),
                        )
                      ],
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.add_circle_rounded,
                          color: Colors.white,
                          size: 18.sp,
                        ),
                        SizedBox(width: 8.w),
                        AppTextStyle(
                          text: 'Add New',
                          color: Colors.white,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            )
          : const SizedBox(),
      backgroundColor: ColorName.bgColor,
      appBar: CustomAppbar(
        iconImage: Assets.images.icResult.path,
        title: 'Home Work',
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppTextStyle(
                        text: "Home Work",
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                      ),
                      AppTextStyle(
                        text: "Filter Homework by Class,Exam and Date",
                        maxLines: 2,
                        fontSize: 10.sp,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                FilterWidget(
                  classValue: true,
                  examValue: true,
                ),
              ],
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: () {
                Get.toNamed(Routes.HOMEWORKDETAILS);
              },
              child: ListView.builder(
                itemCount: 50,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Padding(
                    padding:
                        const EdgeInsets.only(left: 10, right: 10, bottom: 8),
                    child: Card(
                      // color: const Color(0xFFFBF4FD),
                      color:  ColorName.whiteSmoke,
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              clipBehavior: Clip.antiAlias,
                              decoration: const ShapeDecoration(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(12),
                                    bottomLeft: Radius.circular(12),
                                  ),
                                ),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: 75.h,
                                    width: 75.w,
                                    child: Center(
                                      child: SvgPicture.asset(
                                        Assets.images.bookBlue,
                                        width: 100.w,
                                        height: 100.h,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: SizedBox(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            width: double.infinity,
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                AppTextStyle(
                                                  text: 'English',
                                                  color: Colors.black,
                                                  fontSize: 15.sp,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                                Container(
                                                  height: 1.h,
                                                  color: Colors.red
                                                      .withOpacity(0.2),
                                                )
                                              ],
                                            ),
                                          ),
                                          SizedBox(height: 5.h),
                                          SizedBox(
                                            width: double.infinity,
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      AppTextStyle(
                                                        text: 'Submission Date',
                                                        color: Colors.black
                                                            .withOpacity(
                                                                0.699999988079071),
                                                        fontSize: 12.sp,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                      const SizedBox(height: 5),
                                                      AppTextStyle(
                                                        text: '07 Jan’2024',
                                                        color: Colors.black,
                                                        fontSize: 15.sp,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                const SizedBox(width: 5),
                                                SizedBox(
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      AppTextStyle(
                                                        text: 'Time Left',
                                                        color: Colors.black
                                                            .withOpacity(
                                                                0.699999988079071),
                                                        fontSize: 12.sp,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                      const SizedBox(height: 5),
                                                      AppTextStyle(
                                                        text: '7 Days',
                                                        color: Colors.black,
                                                        fontSize: 15.sp,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            // color: Colors.red,
                            width: 30.w,

                            child: Center(
                              child: SvgPicture.asset(
                                Assets.icons.forewordArrowIcon,
                                height: 18.h,
                                width: 30.w,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
