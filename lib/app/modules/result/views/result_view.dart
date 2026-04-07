import 'package:elearning/app/modules/result/widgets/studentResultCards.dart';
import 'package:elearning/gen/colors.gen.dart';
import 'package:elearning/global/custom_appbar.dart';
import 'package:elearning/helper/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../gen/assets.gen.dart';
import '../controllers/result_controller.dart';

class ResultView extends GetView<ResultController> {
  const ResultView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorName.gray70,
      appBar: CustomAppbar(
        iconImage: Assets.images.icResult.path,
        title: 'Result',
        elevation: 0,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppTextStyle(text: 'Select Exam'),
                SizedBox(
                  height: 5.h,
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(3)),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 20.h,
                          child: Obx(() => DropdownButton(
                                iconSize: 25,
                                elevation: 0,
                                borderRadius: BorderRadius.circular(4.r),
                                underline: const SizedBox(),
                                isExpanded: true,
                                hint: const Text('Class Text'),
                                // Initial Value
                                value: controller.dropdownvalue.value,
                                // Down Arrow Icon
                                icon: const Icon(Icons.arrow_drop_down_sharp,
                                    size: 30),
                                // Array list of items
                                items: controller.exams.map((String items) {
                                  return DropdownMenuItem(
                                    value: items,
                                    child: Text(items),
                                  );
                                }).toList(),
                                // After selecting the desired option,it will
                                // change button value to selected value
                                onChanged: controller.onChangedExams,
                              )),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          const Expanded(
            child: StudentResultCards(),
          ),

          //Total Marks Grade Result
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              padding: const EdgeInsets.all(15),
              clipBehavior: Clip.antiAlias,
              decoration: ShapeDecoration(
                color: ColorName.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
                shadows: [
                  BoxShadow(
                    color: const Color(0x33000000),
                    blurRadius: 10.r,
                    offset: const Offset(2, 1),
                    spreadRadius: 0,
                  )
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(width: 5.w),
                            Row(
                              children: [
                                Container(
                                  height: 43.h,
                                  width: 2,
                                  color: ColorName.pink,
                                ),
                                SizedBox(
                                  width: 5.w,
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AppTextStyle(
                                      text: 'Total Marks',
                                      color: Colors.white,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w500,
                                      height: 0,
                                    ),
                                    SizedBox(height: 6.h),
                                    AppTextStyle(
                                      text: '450/500',
                                      color: Colors.white,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(width: 20.w),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(width: 5.w),
                            Row(
                              children: [
                                Container(
                                  height: 43.h,
                                  width: 2,
                                  color: ColorName.pink,
                                ),
                                SizedBox(
                                  width: 5.w,
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AppTextStyle(
                                      text: 'Grade',
                                      color: Colors.white,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    SizedBox(height: 6.h),
                                    AppTextStyle(
                                      text: 'A',
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(width: 20.w),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(width: 5.w),
                            Row(
                              children: [
                                Container(
                                  height: 43.h,
                                  width: 2,
                                  color: ColorName.pink,
                                ),
                                SizedBox(
                                  width: 5.w,
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AppTextStyle(
                                      text: 'Result',
                                      color: Colors.white,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    SizedBox(height: 6.h),
                                    AppTextStyle(
                                      text: 'Pass',
                                      color: Colors.white,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.h),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(10),
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        shadows: [
                          BoxShadow(
                            color: const Color(0x33000000),
                            blurRadius: 10.r,
                            offset: const Offset(1, 2),
                            spreadRadius: 0,
                          )
                        ],
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          AppTextStyle(
                            text: 'Share Now',
                            color: ColorName.primary,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w900,
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
            height: 3.h,
          ),
        ],
      ),
    );
  }
}
