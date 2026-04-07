import 'package:elearning/gen/assets.gen.dart';
import 'package:elearning/helper/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../controllers/add_exam_controller.dart';

// final _formKey = GlobalKey<FormState>();

class CustomAlertDialog extends GetView<AddExamController> {
  const CustomAlertDialog({super.key});
  // final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding:
            EdgeInsets.only(top: 10.h, bottom: 2.h, left: 15.w, right: 15.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppTextStyle(
              text: 'Enter Start Time',
              fontSize: 20.sp,
            ),
            SizedBox(height: 8.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _timePickerTextField(
                      controller: controller.startTimeHourController.value,
                      hintText: '12',
                      maximumValue: 12,
                      minimumValue: 0,
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    AppTextStyle(
                      text: 'Hour',
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.all(2.0.r),
                  child: SizedBox(
                      child: Center(
                    child: Column(
                      children: [
                        SizedBox(height: 27.h),
                        Container(
                          height: 4.h,
                          width: 4.w,
                          decoration: const BoxDecoration(
                              color: Colors.black, shape: BoxShape.circle),
                        ),
                        SizedBox(
                          height: 12.h,
                        ),
                        Container(
                          padding: EdgeInsets.all(2.0.r),
                          height: 4.h,
                          width: 4.w,
                          decoration: const BoxDecoration(
                              color: Colors.black, shape: BoxShape.circle),
                        ),
                      ],
                    ),
                  )),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _timePickerTextField(
                      controller: controller.startTimeMinuteController.value,
                      hintText: '00',
                      maximumValue: 59,
                      minimumValue: 0,
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    AppTextStyle(
                      text: 'Minute',
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                    )
                  ],
                ),
                Column(
                  children: [
                    InkWell(
                        onTap: () {
                          controller.startTimeAmPmCheck.value = true;
                          controller.updateStartAmPmValue('AM');
                        },
                        child: Obx(() => Container(
                              margin: EdgeInsets.only(
                                  top: 3.h, left: 3.w, right: 3.w),
                              height: 34.h,
                              width: 52.w,
                              decoration: BoxDecoration(
                                color:
                                    controller.startTimeAmPmCheck.value == true
                                        ? const Color(0xffFFD9E4)
                                        : Colors.white,
                                border: Border.all(
                                  width: 0.80,
                                ),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(6.r),
                                  topRight: Radius.circular(6.r),
                                ),
                              ),
                              child: Center(
                                child: AppTextStyle(
                                  text: 'AM',
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ))),
                    InkWell(
                        onTap: () {
                          controller.startTimeAmPmCheck.value = false;
                          controller.updateStartAmPmValue("PM");
                        },
                        child: Obx(
                          () => Container(
                            margin: EdgeInsets.only(
                                bottom: 3.h, left: 3.w, right: 3.w),
                            height: 34.h,
                            width: 52.w,
                            decoration: BoxDecoration(
                              color:
                                  controller.startTimeAmPmCheck.value == false
                                      ? const Color(0xffFFD9E4)
                                      : Colors.white,
                              borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(6),
                                  bottomRight: Radius.circular(6)),
                              border: Border.all(
                                width: 0.80,
                              ),
                            ),
                            child: Center(
                              child: AppTextStyle(
                                text: 'PM',
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        )),
                  ],
                )
              ],
            ),
            SizedBox(
              height: 15.h,
            ),

            //    Enter End Time Section

            AppTextStyle(
              text: 'Enter End Time',
              fontSize: 20.sp,
            ),
            SizedBox(height: 8.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _timePickerTextField(
                      controller: controller.endTimeHourController.value,
                      hintText: '12',
                      maximumValue: 12,
                      minimumValue: 0,
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    AppTextStyle(
                      text: 'Hour',
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                    )
                  ],
                ),
                SizedBox(
                    child: Column(
                  children: [
                    SizedBox(height: 27.h),
                    Container(
                      padding: EdgeInsets.all(2.0.r),
                      height: 4.h,
                      width: 4.w,
                      decoration: const BoxDecoration(
                          color: Colors.black, shape: BoxShape.circle),
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    Container(
                      padding: EdgeInsets.all(2.r),
                      height: 4.h,
                      width: 4.w,
                      decoration: const BoxDecoration(
                          color: Colors.black, shape: BoxShape.circle),
                    ),
                  ],
                )),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _timePickerTextField(
                      controller: controller.endTimeMinuteController.value,
                      hintText: '00',
                      maximumValue: 59,
                      minimumValue: 0,
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    AppTextStyle(
                      text: 'Minute',
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                    )
                  ],
                ),
                Column(
                  children: [
                    InkWell(
                        onTap: () {
                          controller.endTimeAmPmCheck.value = true;
                          controller.updateEndAmPmValue('AM');
                        },
                        child: Obx(() => Container(
                              margin: EdgeInsets.only(
                                  top: 3.h, left: 3.w, right: 3.w),
                              height: 34.h,
                              width: 52.w,
                              decoration: BoxDecoration(
                                color: controller.endTimeAmPmCheck.value == true
                                    ? const Color(0xffFFD9E4)
                                    : Colors.white,
                                border: Border.all(
                                  width: 0.80,
                                ),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(6.r),
                                  topRight: Radius.circular(6.r),
                                ),
                              ),
                              child: Center(
                                child: AppTextStyle(
                                  text: 'AM',
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ))),
                    InkWell(
                        onTap: () {
                          controller.endTimeAmPmCheck.value = false;
                          controller.updateEndAmPmValue("PM");
                        },
                        child: Obx(
                          () => Container(
                            margin: EdgeInsets.only(
                                bottom: 3.h, left: 3.w, right: 3.w),
                            height: 34.h,
                            width: 52.w,
                            decoration: BoxDecoration(
                              color: controller.endTimeAmPmCheck.value == false
                                  ? const Color(0xffFFD9E4)
                                  : Colors.white,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(6.r),
                                  bottomRight: Radius.circular(6.r)),
                              border: Border.all(width: 0.80),
                            ),
                            child: Center(
                              child: AppTextStyle(
                                text: 'PM',
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        )),
                  ],
                )
              ],
            ),

            Obx(
              () => Row(
                children: [
                  AppTextStyle(
                    text: controller.timePickExceptions.value,
                    color: Colors.red,
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text('Cancel',
                      style: TextStyle(
                          fontSize: 16.sp,
                          fontFamily: Assets.fonts.gothicA1Regular,
                          fontWeight: FontWeight.w400)),
                ),
                SizedBox(width: 8.0.w),
                TextButton(
                  onPressed: () {
                    // _formKey.currentState!.validate();
                    controller.startHourTime.value = controller
                        .startTimeHourController.value.text
                        .toString();
                    controller.startMinuteTime.value = controller
                        .startTimeMinuteController.value.text
                        .toString();
                    controller.endHourTime.value =
                        controller.endTimeHourController.value.text.toString();
                    controller.endMinuteTime.value = controller
                        .endTimeMinuteController.value.text
                        .toString();
                    controller.hourCheck.value = true;
                    controller.minuteCheck.value = true;
                    if (controller.startHourTime.value.isNotEmpty &&
                        controller.startMinuteTime.value.isNotEmpty &&
                        controller.endHourTime.value.isNotEmpty &&
                        controller.endMinuteTime.value.isNotEmpty) {
                      controller.timePickExceptions.value = "";
                      Get.back();
                    } else {
                      controller.timePickExceptions.value =
                          "Please enter all required feeds";
                    }
                  },
                  child: Text('OK',
                      style: TextStyle(
                          fontSize: 16.sp,
                          fontFamily: Assets.fonts.gothicA1Regular,
                          fontWeight: FontWeight.w400)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Widget _timePickerTextField({
  required TextEditingController controller,
  required String hintText,
  required int maximumValue,
  required int minimumValue,
}) {
  return Container(
    width: 80.w,
    height: 70.h,
    decoration: BoxDecoration(
        color: const Color(0xffE7DFEC),
        borderRadius: BorderRadius.circular(6.r),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 2,
            offset: Offset(2, 2),
            spreadRadius: 0,
          )
        ]),
    child: TextFormField(
      controller: controller,
      validator: (name)
          // =>name!.length > 2 ? 'Enter valid Number' : null,
          {
        if (name != null && int.tryParse(name) == null) {
          return 'Invalid number';
        }
        if (int.parse(name!) < minimumValue || int.parse(name) > maximumValue) {
          return '$minimumValue to $maximumValue ';
        }
        return null;
      },
      // onSaved:_onSavedName ,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: TextInputType.number,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly, // Restrict to digits
        LengthLimitingTextInputFormatter(2), // Limit to 2 characters
      ],
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.black,
        fontFamily: Assets.fonts.gothicA1Regular,
        fontSize: 35.sp,
        fontWeight: FontWeight.w600,
      ),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.zero,
        hintText: hintText,
        hintStyle: TextStyle(
          color: Colors.grey,
          fontSize: 35.sp,
          fontWeight: FontWeight.w600,
          fontFamily: Assets.fonts.gothicA1Regular,
        ),
        border: InputBorder.none,
      ),
    ),
  );
}
