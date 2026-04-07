import 'package:elearning/helper/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../controllers/add_exam_controller.dart';

class SelectClassDropdown extends GetView<AddExamController> {
  const SelectClassDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      // controller.initState();
      if (controller.selectionValue.value == false) {
        return Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: AppTextStyle(
                        text: 'Class',
                        color: Colors.black.withOpacity(0.699999988079071),
                        fontSize: 12.sp,
                      ),
                    ),
                    Container(
                      height: 34.h,
                      padding: EdgeInsets.only(left: 5.w),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(3.r),
                          boxShadow: const [
                            BoxShadow(
                              // color: Color(0x33000000),
                              color: Colors.black12,
                              blurRadius: 2,
                              offset: Offset(2, 2),
                              spreadRadius: 0,
                            )
                          ]),
                      child: DropdownButton(
                        hint: AppTextStyle(
                          text: 'Select Class',
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey,
                        ),
                        underline: const SizedBox(),
                        isExpanded: true,
                        elevation: 0,
                        iconSize: 30.sp,
                        value: controller.selectedClassItem.value == ""
                            ? null
                            : controller.selectedClassItem.value,
                        onChanged: (newValue) {
                          controller
                              .upDateSelectedClassItem(newValue.toString());
                          controller.classAndGroupSelection();
                        },
                        items: controller.dropDownClassList.map((e) {
                          return DropdownMenuItem(
                              value: e.toString(),
                              child: AppTextStyle(
                                  text: e.toString(),
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400));
                        }).toList(),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        );
      } else {
        return Row(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(right: 7.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: AppTextStyle(
                        text: 'Class',
                        color: Colors.black.withOpacity(0.699999988079071),
                        fontSize: 12.sp,
                      ),
                    ),
                    Container(
                      height: 34.h,
                      padding: EdgeInsets.only(left: 5.w),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(3.r),
                          boxShadow: const [
                            BoxShadow(
                              // color: Color(0x33000000),
                              color: Colors.black12,
                              blurRadius: 2,
                              offset: Offset(2, 2),
                              spreadRadius: 0,
                            )
                          ]),
                      child: DropdownButton(
                        hint: AppTextStyle(
                          text: 'Select Class',
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey,
                        ),
                        underline: const SizedBox(),
                        isExpanded: true,
                        elevation: 0,
                        iconSize: 30.sp,
                        value: controller.selectedClassItem.value == ""
                            ? null
                            : controller.selectedClassItem.value,
                        onChanged: (newValue) {
                          controller
                              .upDateSelectedClassItem(newValue.toString());
                          controller.classAndGroupSelection();
                        },
                        items: controller.dropDownClassList.map((e) {
                          return DropdownMenuItem(
                              value: e.toString(),
                              child: AppTextStyle(
                                  text: e.toString(),
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400));
                        }).toList(),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 7.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: AppTextStyle(
                        text: 'Group',
                        color: Colors.black.withOpacity(0.699999988079071),
                        fontSize: 12.sp,
                      ),
                    ),
                    Container(
                      height: 34.h,
                      padding: EdgeInsets.only(left: 5.w),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(3.r),
                          boxShadow: const [
                            BoxShadow(
                              // color: Color(0x33000000),
                              color: Colors.black12,
                              blurRadius: 2,
                              offset: Offset(2, 2),
                              spreadRadius: 0,
                            )
                          ]),
                      child: DropdownButton(
                        hint: AppTextStyle(
                          text: 'Select Group',
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey,
                        ),
                        underline: const SizedBox(),
                        isExpanded: true,
                        elevation: 0,
                        iconSize: 30.sp,
                        value: controller.selectGroupItem.value == ""
                            ? null
                            : controller.selectGroupItem.value,
                        onChanged: (newValue) {
                          controller
                              .updateSelectedGroupItem(newValue.toString());
                          controller.classAndGroupSelection();
                        },
                        items: controller.dropDownGroupList.map((e) {
                          return DropdownMenuItem(
                              value: e.toString(),
                              child: AppTextStyle(
                                  text: e.toString(),
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400));
                        }).toList(),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        );
      }
    });
  }
}
