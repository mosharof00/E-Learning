import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:elearning/app/modules/exam/add_exam/views/select_class_dropdown.dart';
import 'package:elearning/gen/assets.gen.dart';
import 'package:elearning/gen/colors.gen.dart';
import 'package:elearning/global/custom_appbar.dart';
import 'package:elearning/global/widget/globalButton.dart';
import 'package:elearning/helper/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:multi_dropdown/multi_dropdown.dart';
import '../../../../../global/bottomsheet/custom_bottom_sheet.dart';
import '../controllers/add_exam_controller.dart';
import 'custom_alert_dialog.dart';
import 'dart:io';

class AddExamView extends GetView<AddExamController> {
  const AddExamView({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController marksController = TextEditingController();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: ColorName.bgColor,
      appBar: CustomAppbar(
        iconImage: Assets.images.icResult.path,
        title: 'Upload Exam',
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
                height: Get.height,
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
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SelectClassDropdown(),
                            customText(text: 'Exam'),
                            Obx(() => Container(
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
                                      text: 'Select Exam',
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.grey,
                                    ),
                                    underline: const SizedBox(),
                                    isExpanded: true,
                                    elevation: 0,
                                    iconSize: 30.sp,
                                    value:
                                        controller.selectedExamItem.value == ""
                                            ? null
                                            : controller.selectedExamItem.value,
                                    onChanged: (newValue) {
                                      controller.upDateSelectedExamItem(
                                          newValue.toString());
                                    },
                                    items: controller.dropDownExamList.map((e) {
                                      return DropdownMenuItem(
                                          value: e.toString(),
                                          child: AppTextStyle(
                                              text: e.toString(),
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w400));
                                    }).toList(),
                                  ),
                                )),
                            customText(text: "Exam Date"),
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
                                            padding: const EdgeInsets.only(
                                                right: 8.0),
                                            child: SvgPicture.asset(
                                                Assets.icons.calenderIcon),
                                          ),
                                        ],
                                      )),
                                )),
                            customText(text: 'Time'),
                            InkWell(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    // return AlertDialog object
                                    return const CustomAlertDialog();
                                  },
                                );
                              },
                              child: Container(
                                height: 34.h,
                                padding: EdgeInsets.only(left: 5.w),
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
                                child: Row(
                                  children: [
                                    Obx(() {
                                      if (controller.startHourTime.value.isNotEmpty &&
                                          controller.startMinuteTime.value
                                              .isNotEmpty &&
                                          controller
                                              .endHourTime.value.isNotEmpty &&
                                          controller
                                              .endMinuteTime.value.isNotEmpty) {
                                        return Row(
                                          children: [
                                            AppTextStyle(
                                                text:
                                                    "${controller.startHourTime.value.toString()} : ",
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w400),
                                            AppTextStyle(
                                                text:
                                                    "${controller.startMinuteTime.value.toString()} ",
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w400),
                                            AppTextStyle(
                                                text:
                                                    "${controller.startAmPmValue.value.toString()}  ",
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w400),
                                            Container(
                                              height: 1.h,
                                              width: 8.w,
                                              color: Colors.black,
                                            ),
                                            AppTextStyle(
                                                text:
                                                    " ${controller.endHourTime.value.toString()} : ",
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w400),
                                            AppTextStyle(
                                                text:
                                                    "${controller.endMinuteTime.value.toString()} ",
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w400),
                                            AppTextStyle(
                                                text:
                                                    "${controller.endAmPmValue.value.toString()} ",
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w400),
                                          ],
                                        );
                                      } else {
                                        return AppTextStyle(
                                          text: 'Select Time',
                                          color: Colors.grey,
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w400,
                                        );
                                      }
                                    }),
                                    const Spacer(),
                                    const Icon(
                                      Icons.watch_later_outlined,
                                      color: Colors.grey,
                                    ),
                                    SizedBox(
                                      width: 5.w,
                                    )
                                  ],
                                ),
                              ),
                            ),
                            customText(text: 'Subject'),
                            Obx(() => Container(
                                  height: 34.h,
                                  padding: EdgeInsets.only(left: 5.w),
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
                                    value: controller
                                                .selectedSubjectItem.value ==
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
                            customText(text: 'Chapter'),
                            // MultiSelectDropDown(
                            //   // controller: _controller,
                            //   borderColor: Colors.white,
                            //   onOptionSelected: (value) {
                            //     debugPrint(value.toString());
                            //   },
                            //   options: const <ValueItem>[
                            //     ValueItem(label: 'Chapter All', value: '0'),
                            //     ValueItem(label: 'Chapter 1', value: '1'),
                            //     ValueItem(label: 'Chapter 2', value: '2'),
                            //     ValueItem(label: 'Chapter 3', value: '3'),
                            //     ValueItem(label: 'Chapter 4', value: '4'),
                            //     ValueItem(label: 'Chapter 5', value: '5'),
                            //     ValueItem(label: 'Chapter 6', value: '6'),
                            //     ValueItem(label: 'Chapter 7', value: '7'),
                            //     ValueItem(label: 'Chapter 8', value: '8'),
                            //     ValueItem(label: 'Chapter 9', value: '9'),
                            //     ValueItem(label: 'Chapter 10', value: '10'),
                            //     ValueItem(label: 'Chapter 11', value: '11'),
                            //     ValueItem(label: 'Chapter 12', value: '12'),
                            //     ValueItem(label: 'Chapter 13', value: '13'),
                            //     ValueItem(label: 'Chapter 14', value: '14'),
                            //     ValueItem(label: 'Chapter 15', value: '15'),
                            //     ValueItem(label: 'Chapter 16', value: '16'),
                            //     ValueItem(label: 'Chapter 17', value: '17'),
                            //     ValueItem(label: 'Chapter 18', value: '18'),
                            //     ValueItem(label: 'Chapter 19', value: '19'),
                            //     ValueItem(label: 'Chapter 20', value: '20'),
                            //   ],
                            //   // maxItems: 2,
                            //   // disabledOptions: const [ValueItem(label: 'Option 1', value: '1')],
                            //   selectionType: SelectionType.multi,
                            //   chipConfig:
                            //       const ChipConfig(wrapType: WrapType.wrap),
                            //   dropdownHeight: 300.h,
                            //   optionTextStyle: TextStyle(
                            //       fontSize: 12.sp,
                            //       fontFamily: Assets.fonts.gothicA1Regular),
                            //   showClearIcon: true,
                            //   selectedOptionIcon: const Icon(
                            //     Icons.check_circle,
                            //   ),
                            //   hint: 'Select Chapter',
                            //   hintStyle: TextStyle(
                            //     fontSize: 14.sp,
                            //     fontWeight: FontWeight.w400,
                            //     color: Colors.grey,
                            //     fontFamily: Assets.fonts.gothicA1Regular,
                            //   ),
                            //   borderRadius: 4.0,
                            // ),
                            customText(text: 'Marks'),
                            Container(
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
                                child: TextField(
                                  controller: marksController,
                                  keyboardType: TextInputType.number,
                                  textAlign: TextAlign.start,
                                  decoration: InputDecoration(

                                      // contentPadding:
                                      //     EdgeInsets.zero,
                                      border: InputBorder.none,
                                      hintText: 'Enter Marks',
                                      hintStyle: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w400,
                                        fontFamily:
                                            Assets.fonts.gothicA1Regular,
                                        color: Colors.grey,
                                      )),
                                )),
                            customText(text: "Description"),
                            Container(
                              constraints: const BoxConstraints(
                                  maxHeight: 200, minHeight: 100),
                              width: Get.width,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              decoration: ShapeDecoration(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(3.r)),
                              ),
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
                                ));
                          } else {
                            return const SizedBox();
                          }
                        })
                      ],
                    ),
                  ],
                )),
          ),
          // SizedBox(
          //   height: 10.h,
          // ),

          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.all(10.sp),
                child: GlobalButton(
                    onTap: () {},
                    icon: Assets.icons.uploadIcon,
                    text: "Upload Now"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
