import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../gen/assets.gen.dart';
import '../../../../../gen/colors.gen.dart';
import '../../../../../global/custom_appbar.dart';
import '../../../../../global/widget/globalButton.dart';
import '../../../../../helper/app_text_style.dart';
import '../controllers/lecture_upload_controller.dart';

class LectureUploadView extends GetView<LectureUploadController> {
  const LectureUploadView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        // iconImage: Assets.images.appbar.path,
        title: 'Lecture Upload',
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(10.r),
              margin: EdgeInsets.only(top: 15.r, left: 15.r, right: 15.r),
              decoration: BoxDecoration(
                  color: ColorName.secondary,
                  borderRadius: BorderRadius.circular(3.r),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x33000000),
                      blurRadius: 3,
                      offset: Offset(3, 3),
                      spreadRadius: 0,
                    )
                  ]),
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
                  Obx(() => Container(
                        height: 34.h,
                        padding: EdgeInsets.only(left: 5.w),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(3.r)),
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
                      )),
                  Obx(() => controller.selectedClass.value
                      ? _miniCustomText(text: 'Group')
                      : const SizedBox()),
                  Obx(() => controller.selectedClass.value
                      ? Container(
                          height: 34.h,
                          padding: EdgeInsets.only(left: 5.w),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(3.r)),
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
                            value: controller.selectedGrpType.value == ""
                                ? null
                                : controller.selectedGrpType.value,
                            onChanged: (newValue) {
                              controller
                                  .updateSelectedGroupType(newValue.toString());
                            },
                            items: controller.dropdownGroupList.map((e) {
                              return DropdownMenuItem(
                                  value: e.toString(),
                                  child: AppTextStyle(
                                      text: e.toString(),
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w400));
                            }).toList(),
                          ),
                        )
                      : const SizedBox()),
                  _miniCustomText(text: 'Subject'),
                  Obx(
                    () => Container(
                      height: 34.h,
                      padding: EdgeInsets.only(left: 5.w),
                      decoration: BoxDecoration(
                          color: Colors.white,
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
                        value: controller.selectedSubjectItem.value == ""
                            ? null
                            : controller.selectedSubjectItem.value,
                        onChanged: (newValue) {
                          controller
                              .updateSelectedSubjectItem(newValue.toString());
                        },
                        items: controller.dropDownSubjectList.map((e) {
                          return DropdownMenuItem(
                              value: e.toString(),
                              child: AppTextStyle(
                                  text: e.toString(),
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400));
                        }).toList(),
                      ),
                    ),
                  ),
                  _miniCustomText(text: 'Lecture Type'),
                  Obx(
                    () => Container(
                      height: 34.h,
                      padding: EdgeInsets.only(left: 5.w),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(3.r)),
                      child: DropdownButton(
                        hint: AppTextStyle(
                          text: 'Select Lecture Type',
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey,
                        ),
                        underline: const SizedBox(),
                        isExpanded: true,
                        elevation: 0,
                        iconSize: 30.sp,
                        value: controller.selectedLectureType.value == ""
                            ? null
                            : controller.selectedLectureType.value,
                        onChanged: (newValue) {
                          controller
                              .updateSelectedLectureType(newValue.toString());
                        },
                        items: controller.dropDownLectureType.map((e) {
                          return DropdownMenuItem(
                              value: e.toString(),
                              child: AppTextStyle(
                                  text: e.toString(),
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400));
                        }).toList(),
                      ),
                    ),
                  ),
                  _miniCustomText(text: "Title"),
                  Container(
                    constraints:
                        BoxConstraints(maxHeight: 100.h, minHeight: 50.h),
                    // width: Get.width,
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(3.r)),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: TextField(
                              keyboardType: TextInputType.multiline,
                              maxLines: null,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Type title.....'.tr,
                                  hintStyle:
                                      const TextStyle(color: Colors.grey))),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      _miniCustomText(text: "Upload File"),
                      SizedBox(width: 10.w),
                      Obx(() => _miniCustomText(text: controller.pickedFileName.value),
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      if (controller.selectedType.value == 'Chapter(Video)') {
                        controller.pickVideo();

                      } else {
                        controller.pickDoc();
                      }
                    },
                    child: Container(
                      height: 34.h,
                      width: Get.width,
                      decoration: BoxDecoration(
                          color: const Color(0xFFE6E6E6),
                          borderRadius: BorderRadius.circular(3.r),
                          boxShadow: const [
                            BoxShadow(
                              color: Color(0x33000000),
                              blurRadius: 5,
                              offset: Offset(2, 2),
                              spreadRadius: 0,
                            )
                          ]),
                      child: Center(
                        child: AppTextStyle(
                          text:'Choose File',
                          color: Colors.black,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GlobalButton(
              onTap: () {},
              icon: Assets.icons.uploadIcon,
              text: "Upload Now",
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endContained,
    );
  }
}


Widget _miniCustomText({required String text}) {
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