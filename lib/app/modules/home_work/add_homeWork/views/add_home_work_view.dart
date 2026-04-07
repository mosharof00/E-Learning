import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:elearning/app/modules/home_work/add_homeWork/views/add_homework_dropdown_uihelper.dart';
import 'package:elearning/app/routes/app_pages.dart';
import 'package:elearning/gen/assets.gen.dart';
import 'package:elearning/gen/colors.gen.dart';
import 'package:elearning/global/bottomsheet/custom_bottom_sheet.dart';
import 'package:elearning/global/custom_appbar.dart';
import 'package:elearning/global/widget/globalButton.dart';
import 'package:elearning/helper/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../controllers/add_home_work_controller.dart';
import 'dart:io';

class AddHomeWorkView extends GetView<AddHomeWorkController> {
  const AddHomeWorkView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: ColorName.bgColor,
      appBar: CustomAppbar(
        iconImage: Assets.images.icResult.path,
        title: 'Upload Home Work',
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(10.r),
              margin: EdgeInsets.only(top: 15.r, left: 15.r, right: 15.r),
              decoration: BoxDecoration(
                  color: ColorName.bgColor,
                  borderRadius: BorderRadius.circular(3.r),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x33000000),
                      blurRadius: 3,
                    )
                  ]),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SelectClassDropDown(), //Class
                          _customText(text: 'Subject'),
                          Obx(() => Container(
                                height: 34.h,
                                padding: EdgeInsets.only(left: 5.w),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Colors.black12,
                                        blurRadius: 2,
                                        offset: Offset(2, 2),
                                        spreadRadius: 0,
                                      )
                                    ],
                                    borderRadius: BorderRadius.circular(3.r)),
                                child: DropdownButton(
                                  hint: AppTextStyle(
                                    text: 'Select Subject',
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey,
                                  ),
                                  underline: const SizedBox(),
                                  isExpanded: true,
                                  elevation: 0,
                                  iconSize: 30.sp,
                                  value: controller.selectedSubjectItem.value ==
                                          ""
                                      ? null
                                      : controller.selectedSubjectItem.value,
                                  onChanged: (newValue) {
                                    controller.updateSelectedSubjectItem(
                                        newValue.toString());
                                  },
                                  items:
                                      controller.dropDownSubjectList.map((e) {
                                    return DropdownMenuItem(
                                        value: e.toString(),
                                        child: AppTextStyle(
                                            text: e.toString(),
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w400));
                                  }).toList(),
                                ),
                              )),
                          _customText(text: "Submission Date"),
                          InkWell(
                              onTap: () async {
                                var results =
                                    await showCalendarDatePicker2Dialog(
                                  context: context,
                                  config: CalendarDatePicker2WithActionButtonsConfig(
                                      // calendarType: CalendarDatePicker2Type.range,
                                      firstDate: DateTime(2000)),
                                  dialogSize: const Size(325, 400),
                                  value: [
                                    controller.myData.value ?? DateTime.now(),
                                  ],
                                  borderRadius: BorderRadius.circular(15),
                                );
                                if (results != null && results.isNotEmpty) {
                                  controller.setDate(results[0]);
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Obx(() {
                                          if (controller.date.value.isEmpty) {
                                            return AppTextStyle(
                                              text:
                                                  '${controller.myData.value!.day}/${controller.myData.value!.month}/${controller.myData.value!.year}',
                                              fontSize: 14.sp,
                                              // color: Colors.grey,
                                            );
                                          } else {
                                            return AppTextStyle(
                                              text: controller.date.value
                                                  .toString(),
                                              fontSize: 14.sp,
                                            );
                                          }
                                        }),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 8.0),
                                          child: SvgPicture.asset(
                                              Assets.icons.calenderIcon),
                                        ),
                                      ],
                                    )),
                              )),
                          _customText(text: "Description"),
                          SizedBox(
                            width: 10.w,
                          ),
                          Container(
                            constraints: const BoxConstraints(
                                maxHeight: 300, minHeight: 100),
                            width: Get.width,
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(3.r),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 2,
                                    offset: Offset(2, 2),
                                    spreadRadius: 0,
                                  )
                                ]),
                            child: const Column(
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
                                          hintText: 'Type Description...',
                                          hintStyle:
                                              TextStyle(color: Colors.grey))),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        flex: 4,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            customText(text: "Upload Image"),

                            // Obx(() => AppTextStyleOverFlow(text:controller.imagePath.value.toString(),maxLines: 1,))
                            InkWell(
                              onTap: () {
                                customBottomSheet(
                                    context: context,
                                    onTap1: () {
                                      controller.getImageFromFile();
                                      Get.back();
                                    },
                                    svgPicture1: SvgPicture.asset(
                                      Assets.icons.fileIcon,
                                    ),
                                    text1: 'File',
                                    onTap2: () {
                                      controller.getImageFromCamera();
                                      Get.back();
                                    },
                                    svgPicture2: SvgPicture.asset(
                                      Assets.icons.cameraIcon,
                                    ),
                                    text2: 'Camera');
                              },
                              child: Container(
                                height: 34.h,
                                width: Get.width,
                                decoration: BoxDecoration(
                                    color: const Color(0xFFE6E6E6),
                                    borderRadius: BorderRadius.circular(3.r),
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Colors.black26,
                                        blurRadius: 5,
                                        offset: Offset(2, 2),
                                        spreadRadius: 0,
                                      )
                                    ]),
                                child: Center(
                                  child: AppTextStyle(
                                    text: 'Choose File',
                                    color: Colors.black.withOpacity(0.6),
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 8.w,
                      ),
                      Obx(() {
                        if (controller.imageFile.value != null) {
                          return Expanded(
                            flex: 1,
                            child: SizedBox(
                              height: 50.h,
                              child: Image.file(
                                File(
                                  controller.imageFile.value!.path,
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        } else {
                          return const SizedBox();
                        }
                      })
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Container(
            width: Get.width,
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GlobalButton(
                      onTap: () {
                        Get.toNamed(Routes.ADD_HOME_WORK);
                      },
                      icon: Assets.icons.uploadIcon,
                      text: 'Upload Now'),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

Widget _customText({required String text}) {
  return Padding(
    padding: EdgeInsets.only(top: 15.h, bottom: 5.h),
    child: AppTextStyle(
      text: text,
      color: Colors.black.withOpacity(0.699999988079071),
      fontSize: 12.sp,
      fontWeight: FontWeight.w400,
    ),
  );
}
