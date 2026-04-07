import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:elearning/global/widget/globalButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../../gen/assets.gen.dart';
import '../../../../../gen/colors.gen.dart';
import '../../../../../global/custom_appbar.dart';
import '../../../../../helper/app_text_style.dart';
import '../controllers/add_leave_application_controller.dart';

class AddLeaveApplicationView extends GetView<AddLeaveApplicationController> {
  const AddLeaveApplicationView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: ColorName.bgColor,
      appBar: CustomAppbar(
        iconImage: Assets.images.icResult.path,
        title: 'Add Leave Application',
        elevation: 0,
      ),
      body: Container(
        width: Get.width,
        padding: EdgeInsets.all(10.r),
        margin: EdgeInsets.only(top: 15.r, left: 15.r, right: 15.r),
        decoration: BoxDecoration(
            color: ColorName.bgColor,
            borderRadius: BorderRadius.circular(3.r),
            boxShadow: const [
              BoxShadow(
                // color: Color(0x33000000),
                color: Colors.black26,
                blurRadius: 3,
              )
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            customText(text: 'Leave Reason'),
            Container(
                height: 34.h,
                width: Get.width,

                decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 2,
                        offset: Offset(2, 2),
                        spreadRadius: 0,
                      )
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(3.r)),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: TextField(
                    controller: controller.leaveReasonController,
                    // keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.only( left: 5.w,bottom: 13.h),
                        border: InputBorder.none,
                        hintText: 'Enter leave reason'.tr,
                        hintStyle: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          fontFamily: Assets.fonts.gothicA1Regular,
                          color: Colors.grey,
                        )),
                  ),
                )),
            customText(text: 'Leave Period'),
            InkWell(
                onTap: () async {
                  var results = await showCalendarDatePicker2Dialog(
                    context: context,
                    config: CalendarDatePicker2WithActionButtonsConfig(
                      calendarType: CalendarDatePicker2Type.range,
                    ),
                    dialogSize: const Size(325, 400),
                    value: [
                      DateTime.now(),
                    ],
                    borderRadius: BorderRadius.circular(15),
                  );
                  if (results != null && results.isNotEmpty) {
                    controller.setFirstDate(results[0], results[1]);
                  }
                },
                child: Container(
                  height: 34.h,
                  width: Get.width,
                  padding: EdgeInsets.only(left: 5.w),
                  decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 2,
                          offset: Offset(2, 2),
                          spreadRadius: 0,
                        )
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(3.r)),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Obx(() {
                            if (controller.firstDate.value.isEmpty) {
                              return AppTextStyle(
                                text: 'Select Date'.tr,
                                fontSize: 14.sp,
                                color: Colors.grey,
                              );
                            } else {
                              return AppTextStyle(
                                text:
                                    "${controller.firstDate.value.toString()} - ${controller.lastDate.value.toString()}",
                                fontSize: 14.sp,
                              );
                            }
                          }),
                          Obx(() {
                            if (controller.dateDIF.value == 0) {
                              return const SizedBox();
                            } else if (controller.dateDIF.value == 1) {
                              return AppTextStyle(
                                text:
                                    "${controller.dateDIF.value.toString()}-Day",
                                fontSize: 14.sp,
                              );
                            }
                            return AppTextStyle(
                              text:
                                  "${controller.dateDIF.value.toString()}-Days",
                              fontSize: 14.sp,
                            );
                          }),
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: SvgPicture.asset(Assets.icons.calenderIcon),
                          ),
                        ],
                      )),
                )),
            customText(text: "Description"),
            Container(
              width: Get.width,
              constraints: const BoxConstraints(maxHeight: 400, minHeight: 100),
              padding: const EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 2,
                  offset: Offset(2, 2),
                  spreadRadius: 0,
                )
              ], color: Colors.white, borderRadius: BorderRadius.circular(3.r)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: TextField(
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        obscureText: false,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Type Description...'.tr,
                            hintStyle: const TextStyle(color: Colors.grey))),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.only(left: 28.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                Get.back();
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 9.50),
                decoration: ShapeDecoration(
                  gradient: LinearGradient(
                    begin: const Alignment(-0.68, 0.73),
                    end: const Alignment(0.68, -0.73),
                    colors: [Colors.grey.shade500, Colors.grey.shade400],
                  ),
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(width: 2, color: ColorName.start),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  shadows: [
                    BoxShadow(
                      color: ColorName.secondPrimary,
                      blurRadius: 10,
                      offset: const Offset(0, 0),
                      spreadRadius: 0,
                    )
                  ],
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      Assets.icons.crossIcon,
                      height: 15.h,
                      width: 15.w,
                      colorFilter:
                          const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                    ),
                    SizedBox(width: 5.w),
                    AppTextStyle(
                      text: "Cancel",
                      color: Colors.white,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
              ),
            ),
            GlobalButton(
                onTap: () {}, icon: Assets.icons.uploadIcon, text: "Submit"),
          ],
        ),
      ),
    );
  }
}
