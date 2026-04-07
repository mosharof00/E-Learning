import 'package:elearning/app/modules/routine/widgets/routinecards.dart';
import 'package:elearning/gen/colors.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../global/custom_appbar.dart';
import '../../../../helper/app_text_style.dart';
import '../controllers/routine_controller.dart';

class RoutineView extends GetView<RoutineController> {
  const RoutineView({super.key});

  @override
  Widget build(BuildContext context) {
    const selectColor = Colors.white;
    const unselectColor = Colors.black;
    return Scaffold(
      appBar: CustomAppbar(
        iconImage: Assets.images.routinePng.path,
        title: 'Routine',
        elevation: 0,
      ),
      body: Container(
        color: ColorName.bgColor,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: DefaultTabController(
            length: 7,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: AppTextStyle(
                    text: "Select Day",
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Obx(
                    () => Center(
                      child: Container(
                        height: 35.h,
                        decoration: ShapeDecoration(
                          color: ColorName.bgColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: TabBar(
                          padding: EdgeInsets.zero,
                          labelPadding:
                              const EdgeInsets.only(left: 10, right: 10),
                          tabAlignment: TabAlignment.center,
                          controller: controller.tabController,
                          dividerColor: Colors.transparent,
                          automaticIndicatorColorAdjustment: true,
                          indicatorSize: TabBarIndicatorSize.tab,
                          indicator: RectangularIndicator(
                            color: ColorName.primary,
                            bottomLeftRadius: 8,
                            bottomRightRadius: 8,
                            topLeftRadius: 8,
                            topRightRadius: 8,
                            paintingStyle: PaintingStyle.fill,
                          ),
                          unselectedLabelColor: Colors.black,
                          onTap: (index) {
                            controller.updateSelectedTab(index);
                          },
                          tabs: [
                            AppTextStyle(
                              text: 'Sun',
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              height: 0,
                              color: controller.selectedTabIndex.value == 0
                                  ? selectColor
                                  : unselectColor,
                            ),
                            AppTextStyle(
                              text: 'Mon',
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              height: 0,
                              color: controller.selectedTabIndex.value == 1
                                  ? selectColor
                                  : unselectColor,
                            ),
                            AppTextStyle(
                              text: 'Tue',
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              height: 0,
                              color: controller.selectedTabIndex.value == 2
                                  ? selectColor
                                  : unselectColor,
                            ),
                            AppTextStyle(
                              text: 'Wed',
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              height: 0,
                              color: controller.selectedTabIndex.value == 3
                                  ? selectColor
                                  : unselectColor,
                            ),
                            AppTextStyle(
                              text: 'Thu',
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              height: 0,
                              color: controller.selectedTabIndex.value == 4
                                  ? selectColor
                                  : unselectColor,
                            ),
                            AppTextStyle(
                              text: 'Fri',
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              height: 0,
                              color: controller.selectedTabIndex.value == 5
                                  ? selectColor
                                  : unselectColor,
                            ),
                            AppTextStyle(
                              text: 'Sat',
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              height: 0,
                              color: controller.selectedTabIndex.value == 6
                                  ? selectColor
                                  : unselectColor,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    controller: controller.tabController,
                    children: const [
                      RoutineClards(),
                      RoutineClards(),
                      RoutineClards(),
                      RoutineClards(),
                      RoutineClards(),
                      RoutineClards(),
                      RoutineClards(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
