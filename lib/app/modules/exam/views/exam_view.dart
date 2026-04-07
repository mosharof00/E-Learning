import 'package:elearning/gen/colors.gen.dart';
import 'package:elearning/global/bottomsheet/filter.dart';
import 'package:elearning/global/widget/globalButton.dart';
import 'package:elearning/helper/app_text_style.dart';
import 'package:elearning/helper/config_file.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../global/custom_appbar.dart';
import '../../../routes/app_pages.dart';
import '../controllers/exam_controller.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ExamView extends GetView<ExamController> {
  const ExamView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorName.bgColor,
        appBar: CustomAppbar(
          iconImage: Assets.images.icResult.path,
          title: 'Exam',
          elevation: 0,
        ),
        floatingActionButton: isTeacher()
            ? GlobalButton(
                onTap: () {
                  Get.toNamed(Routes.ADD_EXAM);
                },
                icon: Assets.icons.add,
                text: 'Add New')
            : const SizedBox(),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppTextStyle(
                          text: 'Exam',
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                        ),
                        AppTextStyle(
                          text: 'Filter Exams by Class and Exam',
                          color: Colors.grey,
                          fontWeight: FontWeight.w400,
                          fontSize: 12.sp,
                        )
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

            // ListView.builder
            SizedBox(
              height: 10.h,
            ),
            Expanded(
              child: InkWell(
                onTap: () {
                  Get.toNamed(Routes.EXAM_DETAILS);
                },
                child: ListView.builder(
                    itemCount: 50,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          height: 105.h,
                          decoration: const BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Color(0x19000000),
                                blurRadius: 5,
                                offset: Offset(1, 2),
                                spreadRadius: 0,
                              )
                            ],
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Container(
                                  height: 150.h,
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SvgPicture.asset(
                                                Assets.images.bookBlue,
                                                height: 30.h,
                                                width: 30.w),
                                            SizedBox(height: 8.h),
                                            AppTextStyle(
                                              text: "English",
                                              color: Colors.black,
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w700,
                                              height: 0.h,
                                            ),
                                            SizedBox(height: 4.h),
                                            AppTextStyle(
                                              text: 'Chapter 1-5',
                                              color: ColorName.gray410,
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w400,
                                              height: 0.h,
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(width: 10.w),
                                      SizedBox(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            AppTextStyle(
                                              text: 'Saturday, 06/01/2024',
                                              color: ColorName.gray410,
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w400,
                                              height: 0.h,
                                            ),
                                            SizedBox(height: 10.h),
                                            AppTextStyle(
                                              text: '09:00 AM - 10:00 AM',
                                              color: ColorName.gray410,
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w400,
                                              height: 0.h,
                                            ),
                                            SizedBox(height: 10.h),
                                            AppTextStyle(
                                              text:
                                                  '${'Marks'.tr}: 90 | ${'Day\'s Left'.tr}: 5',
                                              color: Colors.black,
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w700,
                                              height: 0,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                width: 30.50.w,
                                height: double.infinity,
                                padding: const EdgeInsets.all(10),
                                clipBehavior: Clip.antiAlias,
                                decoration: const ShapeDecoration(
                                  // color: Color(0xFFE1E1E1),
                                  color: ColorName.whiteSmoke,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(12),
                                      bottomRight: Radius.circular(12),
                                    ),
                                  ),
                                ),
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
                    }),
              ),
            )
          ],
        ));
  }
}
