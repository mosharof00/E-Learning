import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../gen/colors.gen.dart';
import '../../../../global/bottombar/custom_bottom_navbar.dart';
import '../../../../helper/app_text_style.dart';
import '../../../routes/app_pages.dart';
import '../controllers/mainpage_controller.dart';

class MainPageView extends GetView<MainpageController> {
  const MainPageView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: controller.scaffoldKey,
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  color: ColorName.primary,
                ),
                child: SafeArea(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: SizedBox(
                              width: 150.w,
                              height: 50.h,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  CircleAvatar(
                                    radius: 30.r, // Image radius
                                    backgroundImage: const NetworkImage(
                                      "https://2.bp.blogspot.com/-fTaUVO_CJ_4/WktaAPPR9XI/AAAAAAAAAOc/OXzQdvUXYLMLlhE_K4V_Gt69dgfrp_zigCLcBGAs/s1600/fsafd.jpg",
                                    ),
                                  ),
                                  SizedBox(width: 10.w),
                                  Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      AppTextStyle(
                                          text: "RZ Tutul",
                                          color: Colors.white,
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w700,
                                          height: 0),
                                      AppTextStyle(
                                          text: "@rztutul",
                                          color: Colors.white,
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w400,
                                          height: 0),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20.h,),
                      Row(
                        children: [
                          AppTextStyle(
                            text: '${'Class'.tr} - 8 || A ',
                            color: Colors.white,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                          AppTextStyle(
                            text: '|| ${'Roll No.'.tr}- 01',
                            color: Colors.white,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              ListTile(
                leading:  const Icon(Icons.home,color: Colors.grey),
                title: AppTextStyle(text: "Home",),
                onTap: () {
                  Get.back();
                },
              ),
              ListTile(
                leading: SvgPicture.asset(
                  Assets.icons.favouriteBookIcon,
                  colorFilter:
                   ColorFilter.mode(Colors.grey.shade600, BlendMode.srcIn),
                  width: 20.w,
                ),
                title: AppTextStyle(text: 'My Courses',),
                onTap: () {
                  Get.toNamed(Routes.MY_ALL_COURSES);
                },
              ),
              ListTile(
                leading: const Icon(Icons.quiz,color: Colors.grey,),
                title: AppTextStyle(text: 'Quiz'),
                onTap: () {
                  Get.toNamed(Routes.QUIZ);
                },
              ),
              ListTile(
                leading: const Icon(Icons.language,color: Colors.grey),
                title: AppTextStyle(text: 'Language',),
                onTap: () {
                  Get.toNamed(Routes.LANGUAGE);
                },
              ),
              ListTile(
                leading: SvgPicture.asset(
                  Assets.icons.reportIcon,
                  colorFilter:
                      const ColorFilter.mode(Colors.grey, BlendMode.srcIn),
                  width: 20.w,
                ),
                title: AppTextStyle(text: 'Report',),
                onTap: () {
                  Get.toNamed(Routes.REPORT);
                },
              ),
              ListTile(
                leading: SvgPicture.asset(
                  Assets.icons.leaveApplicationIcon,
                  colorFilter:
                  const ColorFilter.mode(Colors.grey, BlendMode.srcIn),
                  width: 20.w,
                ),
                title: AppTextStyle(text: 'Leave Application',),
                onTap: () {
                  Get.toNamed(Routes.LEAVE_APPLICATION);
                },
              ),
              ListTile(
                leading: SvgPicture.asset(
                  Assets.icons.complainIcon,
                  colorFilter:
                  const ColorFilter.mode(Colors.grey, BlendMode.srcIn),
                  width: 20.w,
                ),
                title: AppTextStyle(text: 'Complain',),
                onTap: () {
                  Get.toNamed(Routes.COMPLAIN);
                },
              ),
            ],
          ),
        ),
        bottomNavigationBar: Obx(
          () => BottomBarCreative(
            items: navItems,
            backgroundColor: Colors.white,
            color: Colors.grey,
            colorSelected: ColorName.primary,
            indexSelected: controller.selectedTab.value,
            isFloating: false,
            highlightStyle: const HighlightStyle(
                sizeLarge: true, isHexagon: true, elevation: 2),
            onTap: (index) => controller.changeTab(index),
          ),
        ),
        body: Obx(() => controller.pageList[controller.selectedTab.value]));
  }
}
