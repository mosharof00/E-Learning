import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:elearning/gen/colors.gen.dart';
import 'package:elearning/helper/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../global/custom_appbar.dart';
import '../../../routes/app_pages.dart';
import '../controllers/attendence_controller.dart';

class AttendanceView extends GetView<AttendanceController> {
  const AttendanceView({super.key});

  bool isWeekend(DateTime date) {
    return date.weekday == DateTime.friday || date.weekday == DateTime.saturday;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        // iconImage: Assets.images.appbar.path,
        title: 'Attendance'.tr,
        elevation: 0,
      ),
      body: Container(
        color: ColorName.bgColor,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 5.h,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        Get.toNamed(Routes.ATTENDANCE_BOARD_CARDS);
                      },
                      child: Container(
                        height: 50.h,
                        padding: const EdgeInsets.all(10),
                        clipBehavior: Clip.antiAlias,
                        decoration: ShapeDecoration(
                          color: const Color(0xFF57E186),
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                                width: 1.w, color: Colors.greenAccent),
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          shadows: const [
                            BoxShadow(
                              color: Color(0x3F01E44E),
                              blurRadius: 8,
                              offset: Offset(1, 2),
                              spreadRadius: 0,
                            )
                          ],
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            AppTextStyle(
                              text: 'Total Present',
                              color: Colors.white,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                            ),
                            SizedBox(width: 15.w),
                            AppTextStyle(
                              text: '20',
                              color: Colors.white,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w900,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        Get.toNamed(Routes.ATTENDANCE_BOARD_CARDS);
                      },
                      child: Container(
                        height: 50.h,
                        padding: const EdgeInsets.all(10),
                        clipBehavior: Clip.antiAlias,
                        decoration: ShapeDecoration(
                          color: const Color(0xFFFF6C6C),
                          shape: RoundedRectangleBorder(
                            side:
                                BorderSide(width: 1.w, color: Colors.redAccent),
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          shadows: const [
                            BoxShadow(
                              color: Color(0x3FFA3E3E),
                              blurRadius: 8,
                              offset: Offset(1, 2),
                              spreadRadius: 0,
                            )
                          ],
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            AppTextStyle(
                              text: 'Total Absent',
                              color: Colors.white,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                            ),
                            SizedBox(width: 15.w),
                            AppTextStyle(
                              text: '20',
                              color: Colors.white,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w900,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Container(
                decoration: ShapeDecoration(
                  color: ColorName.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  shadows: const [
                    BoxShadow(
                      color: Color(0x19000000),
                      blurRadius: 5,
                      offset: Offset(1, 2),
                      spreadRadius: 0,
                    )
                  ],
                ),
                // alignment: Alignment.center,
                child: CalendarDatePicker2(
                  config: CalendarDatePicker2Config(
                    dayTextStyle: controller.dayTextStyle,
                    firstDayOfWeek: 0,
                    selectedDayHighlightColor: Colors.greenAccent,
                    centerAlignModePicker: true,
                    selectedDayTextStyle: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                    dayTextStylePredicate: ({required date}) {
                      TextStyle? textstyle;
                      if (date.weekday == DateTime.friday ||
                          date.weekday == DateTime.saturday) {
                        textstyle = controller.weekendTextStyle;
                      }
                      return textstyle;
                    },
                    weekdayLabelTextStyle: const TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                    weekdayLabels: controller.weekdays,
                    calendarType: CalendarDatePicker2Type.multi,
                    selectedRangeHighlightColor: Colors.blue,
                    dayBuilder: ({
                      required DateTime date,
                      BoxDecoration? decoration,
                      bool? isDisabled,
                      bool? isSelected,
                      bool? isToday,
                      TextStyle? textStyle,
                    }) {
                      Color? highlightColor;
                      if (isSelected!) {
                        if (date.weekday == DateTime.sunday ||
                            date.weekday == DateTime.monday ||
                            date.weekday == DateTime.tuesday) {
                          highlightColor = const Color(
                              0xFF58E287); // Green highlight for Sundays, Mondays, and Tuesdays
                        } else if (date.weekday == DateTime.saturday ||
                            date.weekday == DateTime.friday) {
                          highlightColor = Colors.redAccent;
                        } else {
                          highlightColor = Colors
                              .yellowAccent; // Yellow highlight for other days
                        }
                      }
                      return Container(
                        decoration: BoxDecoration(
                          color: isSelected ? highlightColor : null,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Text(
                            date.day.toString(),
                            style: textStyle?.copyWith(
                              color: isSelected ? Colors.white : Colors.black,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  value: controller.dates,
                  onValueChanged: (dates) => controller.date = dates,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
