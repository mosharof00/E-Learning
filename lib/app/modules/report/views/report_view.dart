import 'package:elearning/global/bottomsheet/filter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../gen/colors.gen.dart';
import '../../../../global/custom_appbar.dart';
import '../../../../helper/app_text_style.dart';
import '../../attendance/attendanceteacher/teacherAttendance/views/attendance_teacher_count_view.dart';
import '../../result/widgets/result_cards.dart';
import '../../routine/controllers/routine_controller.dart';
import '../controllers/report_controller.dart';

class ReportView extends GetView<ReportController> {
  ReportView({super.key});
  final routineController = Get.put(RoutineController());
  @override
  Widget build(BuildContext context) {
    const selectColor = Colors.white;
    const unselectColor = Colors.black;
    return Scaffold(
      appBar: CustomAppbar(
        iconImage: Assets.images.icResult.path,
        title: 'Report',
        elevation: 0,
      ),
      body: CustomScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        shrinkWrap: true,
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListView(
                shrinkWrap: true,
                // mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AppTextStyle(
                                    text: "Attendance",
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  AppTextStyle(
                                    text:
                                        "Filter Attendance by Class,Subject and Date",
                                    fontSize: 10.sp,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ],
                              ),
                            ),
                            const Spacer(),
                            FilterWidget(
                              classValue: true,
                              subjectValue: true,
                              dateValue: true,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          padding: EdgeInsets.zero,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              InkWell(
                                onTap: () {
                                  Get.to(() => AttendanceTeacherCountView(
                                        item: 45,
                                        icon: Assets.icons.p,
                                        text: 'Total Present 45',
                                      ));
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(10),
                                  clipBehavior: Clip.antiAlias,
                                  decoration: ShapeDecoration(
                                    color: const Color(0xFF57E186),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.r),
                                    ),
                                    shadows: const [
                                      BoxShadow(
                                        color: Color(0x3F01E44E),
                                        blurRadius: 5,
                                        offset: Offset(1, 2),
                                        spreadRadius: 0,
                                      )
                                    ],
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      AppTextStyle(
                                        text: 'Total Present',
                                        color: Colors.white,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      SizedBox(height: 5.h),
                                      AppTextStyle(
                                        text: '45',
                                        color: Colors.white,
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(width: 10.w),
                              InkWell(
                                onTap: () {
                                  Get.to(() => AttendanceTeacherCountView(
                                        item: 5,
                                        icon: Assets.icons.l,
                                        text: 'Total Late 5',
                                      ));
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(10),
                                  clipBehavior: Clip.antiAlias,
                                  decoration: ShapeDecoration(
                                    color: const Color(0xFFEEAC49),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.r),
                                    ),
                                    shadows: const [
                                      BoxShadow(
                                        color: Color(0x3FFA3E3E),
                                        blurRadius: 5,
                                        offset: Offset(1, 2),
                                        spreadRadius: 0,
                                      )
                                    ],
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      AppTextStyle(
                                        text: 'Total Late',
                                        color: Colors.white,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      SizedBox(height: 5.h),
                                      AppTextStyle(
                                        text: '5',
                                        color: Colors.white,
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(width: 10.w),
                              InkWell(
                                onTap: () {
                                  Get.to(() => AttendanceTeacherCountView(
                                        item: 5,
                                        icon: Assets.icons.a,
                                        text: 'Total Absent 5',
                                      ));
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(10),
                                  clipBehavior: Clip.antiAlias,
                                  decoration: ShapeDecoration(
                                    color: const Color(0xFFFF6C6C),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.r),
                                    ),
                                    shadows: const [
                                      BoxShadow(
                                        color: Color(0x3FFA3E3E),
                                        blurRadius: 5,
                                        offset: Offset(1, 2),
                                        spreadRadius: 0,
                                      )
                                    ],
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      AppTextStyle(
                                        text: 'Total Absent',
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      SizedBox(height: 5.h),
                                      AppTextStyle(
                                        text: '5',
                                        color: Colors.white,
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w900,
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
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AppTextStyle(
                                    text: "Result",
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  AppTextStyle(
                                    text: "Filter Result by Class and Sub",
                                    fontSize: 10.sp,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ],
                              ),
                            ),
                            const Spacer(),
                            FilterWidget(
                                classValue: true,
                                subjectValue: true,
                                examValue: true)
                          ],
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        AppTextStyle(text: '(${'Grade'.tr}%)'),
                        SizedBox(
                          height: 5.h,
                        ),
                        SingleChildScrollView(
                          padding: EdgeInsets.zero,
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                // padding: const EdgeInsets.all(5),
                                decoration: const BoxDecoration(
                                  color: ColorName.white,
                                  shape: BoxShape.circle,
                                ),
                                child: CircularPercentIndicator(
                                  animation: true,
                                  animationDuration: 1200,
                                  // animateFromLastPercent: true,
                                  radius: 52.r,
                                  lineWidth: 10.0,
                                  percent: 0.6,
                                  center: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      AppTextStyle(
                                        text: "A+",
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w600,
                                        color: ColorName.black,
                                      ),
                                      AppTextStyle(
                                        text: "60%",
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.w800,
                                        color: ColorName.black,
                                      ),
                                    ],
                                  ),
                                  backgroundColor: Colors.white,
                                  progressColor: const Color(0xFFFF6C6C),
                                  circularStrokeCap: CircularStrokeCap.round,
                                ),
                              ),
                              Container(
                                // padding: const EdgeInsets.all(5),
                                decoration: const BoxDecoration(
                                  color: ColorName.white,
                                  shape: BoxShape.circle,
                                ),
                                child: CircularPercentIndicator(
                                  animation: true,
                                  animationDuration: 1200,
                                  radius: 52.r,
                                  lineWidth: 10.0,
                                  percent: 0.32,
                                  center: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      AppTextStyle(
                                        text: "A",
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w600,
                                        color: ColorName.black,
                                      ),
                                      AppTextStyle(
                                        text: "32%",
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.w800,
                                        color: ColorName.black,
                                      ),
                                    ],
                                  ),
                                  backgroundColor: Colors.white,
                                  progressColor: const Color(0xFFEEAC49),
                                  circularStrokeCap: CircularStrokeCap.round,
                                ),
                              ),
                              Container(
                                // padding: const EdgeInsets.all(5),
                                decoration: const BoxDecoration(
                                  color: ColorName.white,
                                  shape: BoxShape.circle,
                                ),
                                child: CircularPercentIndicator(
                                  animation: true,
                                  animationDuration: 1200,
                                  radius: 52.r,
                                  lineWidth: 10.0,
                                  percent: 0.08,
                                  center: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      AppTextStyle(
                                        text: "A-",
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w600,
                                        color: ColorName.black,
                                      ),
                                      AppTextStyle(
                                        text: "8%",
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.w800,
                                        color: ColorName.black,
                                      ),
                                    ],
                                  ),
                                  backgroundColor: Colors.white,
                                  progressColor: const Color(0xFF57E186),
                                  circularStrokeCap: CircularStrokeCap.round,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverFillRemaining(
            // This Sliver will fill the remaining space with your lower part
            hasScrollBody: true,
            // fillOverscroll: ,
            child: Container(
              color: ColorName.bgColor, // Customize the color as needed
              child: DefaultTabController(
                length: 7,
                child: Column(
                  children: [
                    Expanded(
                      child: Container(
                        height: Get.height,
                        decoration: const ShapeDecoration(
                          color: ColorName.bgColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(12),
                              topRight: Radius.circular(12),
                            ),
                          ),
                        ),
                        child: DefaultTabController(
                          length: 7,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AppTextStyle(
                                      text: "Select Subject",
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    SizedBox(
                                      height: 5.h,
                                    ),
                                    Obx(
                                      () => Container(
                                        height: 32.h,
                                        // width: size,
                                        decoration: ShapeDecoration(
                                          color: ColorName.bgColor,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                        ),
                                        child: TabBar(
                                          padding: EdgeInsets.zero,
                                          isScrollable: true,
                                          labelPadding: const EdgeInsets.only(
                                              left: 12, right: 12),
                                          tabAlignment: TabAlignment.center,
                                          controller:
                                              routineController.tabController,
                                          indicatorPadding: EdgeInsets.zero,
                                          dividerColor: Colors.transparent,
                                          automaticIndicatorColorAdjustment:
                                              true,
                                          indicatorSize:
                                              TabBarIndicatorSize.tab,
                                          indicator: RectangularIndicator(
                                            color: ColorName.primary,
                                            bottomLeftRadius: 8,
                                            bottomRightRadius: 8,
                                            topLeftRadius: 8,
                                            topRightRadius: 8,
                                            paintingStyle: PaintingStyle.fill,
                                          ),
                                          // labelColor: Colors.red,
                                          unselectedLabelColor: Colors.black,
                                          onTap: (index) {
                                            routineController
                                                .updateSelectedTab(index);
                                          },
                                          tabs: [
                                            Center(
                                              child: AppTextStyle(
                                                text: 'All',
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w500,
                                                height: 0,
                                                color: routineController
                                                            .selectedTabIndex
                                                            .value ==
                                                        0
                                                    ? selectColor
                                                    : unselectColor,
                                              ),
                                            ),
                                            Center(
                                              child: AppTextStyle(
                                                text: 'Bangla',
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w500,
                                                height: 0,
                                                color: routineController
                                                            .selectedTabIndex
                                                            .value ==
                                                        1
                                                    ? selectColor
                                                    : unselectColor,
                                              ),
                                            ),
                                            Center(
                                              child: AppTextStyle(
                                                text: 'English',
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w500,
                                                height: 0,
                                                color: routineController
                                                            .selectedTabIndex
                                                            .value ==
                                                        2
                                                    ? selectColor
                                                    : unselectColor,
                                              ),
                                            ),
                                            Center(
                                              child: AppTextStyle(
                                                text: 'Science',
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w500,
                                                height: 0,
                                                color: routineController
                                                            .selectedTabIndex
                                                            .value ==
                                                        3
                                                    ? selectColor
                                                    : unselectColor,
                                              ),
                                            ),
                                            Center(
                                              child: AppTextStyle(
                                                text: 'Islam',
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w500,
                                                height: 0,
                                                color: routineController
                                                            .selectedTabIndex
                                                            .value ==
                                                        4
                                                    ? selectColor
                                                    : unselectColor,
                                              ),
                                            ),
                                            Center(
                                              child: AppTextStyle(
                                                text: 'Sociology',
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w500,
                                                height: 0,
                                                color: routineController
                                                            .selectedTabIndex
                                                            .value ==
                                                        5
                                                    ? selectColor
                                                    : unselectColor,
                                              ),
                                            ),
                                            Center(
                                              child: AppTextStyle(
                                                text: 'Agriculture',
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w500,
                                                height: 0,
                                                color: routineController
                                                            .selectedTabIndex
                                                            .value ==
                                                        6
                                                    ? selectColor
                                                    : unselectColor,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: TabBarView(
                                  controller: routineController.tabController,
                                  children: const [
                                    ResultCards(),
                                    ResultCards(),
                                    ResultCards(),
                                    ResultCards(),
                                    ResultCards(),
                                    ResultCards(),
                                    ResultCards(),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
