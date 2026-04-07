import 'package:elearning/app/modules/lectures/controllers/lecture_controller.dart';
import 'package:elearning/app/modules/lectures/views/lecturesuggestion_view.dart';
import 'package:elearning/app/routes/app_pages.dart';
import 'package:elearning/gen/assets.gen.dart';
import 'package:elearning/gen/colors.gen.dart';
import 'package:elearning/global/widget/globalButton.dart';
import 'package:elearning/helper/config_file.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../global/custom_appbar.dart';
import '../../../../helper/app_text_style.dart';
import '../widgets/cards_basic.dart';

class LectureView extends GetView<LectureController> {
  const LectureView({super.key});

  @override
  Widget build(BuildContext context) {
    const unselectColor = Colors.grey;
    return Scaffold(
      backgroundColor: ColorName.bgColor,
      appBar: CustomAppbar(
        // iconImage: Assets.images.appbar.path,
        title: 'Lecture Details',
        elevation: 0,
      ),
      body: DefaultTabController(
        length: 2,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Obx(
                () => Container(
                  height: 60.h,
                  // width: size,
                  decoration: const ShapeDecoration(
                    color: Color(0x19735CF5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(12)),
                    ),
                  ),
                  child: TabBar(
                    controller: controller.tabController,
                    indicatorPadding: EdgeInsets.zero,
                    indicatorWeight: 5,
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicator: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          width: 3,
                          color: ColorName.primary,
                        ),
                      ),
                      shape: BoxShape.rectangle,
                    ),
                    labelColor: Colors.white,
                    unselectedLabelColor: Colors.black,
                    onTap: (index) {
                      controller.updateSelectedTab(index);
                    },
                    tabs: [
                      //Chapter Tabbar
                      Center(
                        widthFactor: 0.5.sw,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(
                              width: 28.w,
                              height: 28.h,
                              child: SvgPicture.asset(Assets.icons.chaptersssss,
                                  fit: BoxFit.fill,
                                  colorFilter: ColorFilter.mode(
                                      controller.selectedTabIndex.value == 0
                                          ? ColorName.primary
                                          : unselectColor,
                                      BlendMode.srcIn)),
                            ),
                            SizedBox(width: 5.w),
                            AppTextStyle(
                              text: 'CHAPTER',
                              fontSize: 15,
                              fontWeight: FontWeight.w800,
                              height: 0,
                              color: controller.selectedTabIndex.value == 0
                                  ? ColorName.primary
                                  : unselectColor,
                            ),
                          ],
                        ),
                      ),
                      //Suggestion Tabbar
                      Center(
                        widthFactor: 0.5.sw,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(
                              width: 28.w,
                              height: 28.h,
                              child: SvgPicture.asset(
                                Assets.icons.suggestion,
                                fit: BoxFit.fill,
                                colorFilter: ColorFilter.mode(
                                    controller.selectedTabIndex.value == 1
                                        ? ColorName.primary
                                        : unselectColor,
                                    BlendMode.srcIn),
                              ),
                            ),
                            SizedBox(width: 5.w),
                            AppTextStyle(
                              text: 'SUGGESTION',
                              fontSize: 15,
                              fontWeight: FontWeight.w800,
                              height: 0,
                              color: controller.selectedTabIndex.value == 1
                                  ? ColorName.primary
                                  : unselectColor,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: controller.tabController,
                children: [
                  BasicCards(),
                  const LectureSuggestionView(),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: isTeacher()
          ? Row(
              children: [
                const Spacer(),
                GlobalButton(
                  onTap: () {
                    Get.toNamed(Routes.LECTURE_UPLOAD);
                  },
                  icon: Assets.icons.uploadIcon,
                  text: "Upload Now",
                ),
              ],
            )
          : const SizedBox(),
    );
  }
}
