import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:elearning/global/bottomsheet/controllers/filter_controller.dart';
import 'package:elearning/global/round_color_button_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../gen/assets.gen.dart';
import '../../gen/colors.gen.dart';
import '../../helper/app_text_style.dart';
import '../app_primary_theme_method.dart';

class FilterWidget extends StatelessWidget {
  FilterWidget({
    super.key,
    this.classValue,
    this.subjectValue,
    this.examValue,
    this.dateValue,
  });

  final bool? classValue;
  final bool? subjectValue;
  final bool? examValue;
  final bool? dateValue;

  final controller = Get.put(FilterController());
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showModalBottomSheet(
          context: context,
          elevation: 5,
          builder: (BuildContext context) {
            return Container(
              padding: const EdgeInsets.all(10),
              clipBehavior: Clip.antiAlias,
              decoration: ShapeDecoration(
                color: ColorName.bgColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30.r),
                        topRight: Radius.circular(30.r))),
                shadows: const [
                  BoxShadow(
                    color: Color(0x33000000),
                    offset: Offset(1, 1),
                  )
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Center(
                          child: AppTextStyle(
                            text: "Filter",
                            fontWeight: FontWeight.w500,
                            fontSize: 16.sp,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Icon(Icons.close),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (classValue == true) ...[
                        AppTextStyle(
                          text: 'Class',
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w400,
                        ),
                        SizedBox(height: 5.h),
                        Container(
                          height: 34.h,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 6),
                          decoration: ShapeDecoration(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(3)),
                          ),
                          child: Obx(
                            () => DropdownButton(
                              borderRadius: BorderRadius.circular(4.r),
                              underline: const SizedBox(),
                              isExpanded: true,
                              hint: AppTextStyle(
                                text: 'Class',
                              ),
                              value: controller.dropdownValue.value,
                              icon: const Icon(Icons.arrow_drop_down_sharp,
                                  size: 30),
                              items: controller.classItems.map((String items) {
                                return DropdownMenuItem(
                                  value: items,
                                  child: Text(items),
                                );
                              }).toList(),
                              onChanged: controller.onChangedClass,
                            ),
                          ),
                        ),
                      ]
                    ],
                  ), //Class
                  SizedBox(height: 15.h),
                  Obx(() => controller.selectClass.value
                      ? Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppTextStyle(
                              text: 'Group',
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w400,
                            ),
                            SizedBox(height: 5.h),
                            Container(
                              height: 34.h,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 6),
                              decoration: ShapeDecoration(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(3)),
                              ),
                              child: Obx(
                                () => DropdownButton(
                                  borderRadius: BorderRadius.circular(4.r),
                                  underline: const SizedBox(),
                                  isExpanded: true,
                                  hint: AppTextStyle(
                                    text: 'Group',
                                  ),
                                  value: controller.dropdownGroupvalue.value,
                                  icon: const Icon(Icons.arrow_drop_down_sharp,
                                      size: 30),
                                  items:
                                      controller.groupItems.map((String items) {
                                    return DropdownMenuItem(
                                      value: items,
                                      child: Text(items),
                                    );
                                  }).toList(),
                                  onChanged: controller.onChangedGroup,
                                ),
                              ),
                            ),
                            SizedBox(height: 15.h),
                          ],
                        )
                      : const SizedBox()), //Group
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (subjectValue == true) ...[
                        AppTextStyle(
                          text: 'Subject',
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w400,
                        ),
                        SizedBox(height: 5.h),
                        Container(
                          height: 34.h,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 6),
                          decoration: ShapeDecoration(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(3)),
                          ),
                          child: Obx(
                            () => DropdownButton(
                              borderRadius: BorderRadius.circular(4.r),
                              underline: const SizedBox(),
                              isExpanded: true,
                              hint: AppTextStyle(
                                text: 'Subject',
                              ),
                              value: controller.dropdownSubvalue.value,
                              icon: const Icon(Icons.arrow_drop_down_sharp,
                                  size: 30),
                              items: controller.subItems.map((String items) {
                                return DropdownMenuItem(
                                  value: items,
                                  child: Text(items),
                                );
                              }).toList(),
                              onChanged: controller.onChangedSub,
                            ),
                          ),
                        ),
                        SizedBox(height: 15.h),
                      ],
                    ],
                  ),
                  //Subject

                  Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (examValue == true) ...[
                        AppTextStyle(
                          text: 'Exam',
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w400,
                        ),
                        SizedBox(height: 5.h),
                        Container(
                          height: 34.h,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 6),
                          decoration: ShapeDecoration(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(3)),
                          ),
                          child: Obx(
                            () => DropdownButton(
                              borderRadius: BorderRadius.circular(4.r),
                              underline: const SizedBox(),
                              isExpanded: true,
                              hint: AppTextStyle(
                                text: 'Select Exam',
                              ),
                              value: controller.dropdownExamValue.value,
                              icon: const Icon(Icons.arrow_drop_down_sharp,
                                  size: 30),
                              items: controller.examItems.map((String items) {
                                return DropdownMenuItem(
                                  value: items,
                                  child: Text(items),
                                );
                              }).toList(),
                              onChanged: controller.onChangeExam,
                            ),
                          ),
                        ),
                        SizedBox(height: 15.h),
                      ],
                    ],
                  ), //Exam

                  Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (dateValue == true) ...[
                        SizedBox(height: 5.h),
                        AppTextStyle(
                          text: "Class Date",
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w400,
                        ),
                        GestureDetector(
                          onTap: () async {
                            var selectedDate =
                                await showCalendarDatePicker2Dialog(
                              context: context,
                              config:
                                  CalendarDatePicker2WithActionButtonsConfig(),
                              dialogSize: const Size(325, 400),
                              value: [
                                controller.selectedDate.value ?? DateTime.now()
                              ],
                              borderRadius: BorderRadius.circular(15),
                            );
                            if (selectedDate != null &&
                                selectedDate.isNotEmpty) {
                              controller.setDate(selectedDate[0]);
                            }
                          },
                          child: Container(
                            height: 34.h,
                            decoration: ShapeDecoration(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(3.r)),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: TextFormField(
                                    controller: controller.dateTextController,
                                    style: TextStyle(
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.w500),
                                    readOnly: true,
                                    autofocus: true,
                                    decoration: const InputDecoration.collapsed(
                                      hintText: 'Date',
                                    ),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(right: 8.0),
                                  child: Icon(Icons.calendar_month_sharp),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 15.h),
                      ],
                    ],
                  ), //Date
                  AppRoundColorButton(
                    onTap: () {},
                    width: Get.width,
                    text: 'Apply Filter',
                    borderRadius: 30,
                  ),
                ],
              ),
            );
          },
        );
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          gradient: appLinearGradient(),
          shape: RoundedRectangleBorder(
            side: const BorderSide(width: 2, color: ColorName.start),
            borderRadius: BorderRadius.circular(15),
          ),
          shadows: [
            BoxShadow(
              color: ColorName.secondPrimary,
              blurRadius: 5,
              offset: const Offset(0, 2),
              spreadRadius: 0,
            )
          ],
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              Assets.icons.filterIcon,
              height: 15.h,
              width: 15.w,
              colorFilter:
                  const ColorFilter.mode(Colors.white, BlendMode.srcIn),
            ),
            SizedBox(
              width: 5.w,
            ),
            AppTextStyle(
              text: 'Filter',
              color: Colors.white,
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
            )
          ],
        ),
      ),
    );
  }
}
