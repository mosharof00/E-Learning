import 'package:carousel_slider/carousel_slider.dart';
import 'package:elearning/app/modules/mainpage/controllers/mainpage_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../gen/colors.gen.dart';
import '../../../../global/app_primary_theme_method.dart';
import '../../../../global/label_icon_point_widget.dart';
import '../../../../helper/app_text_style.dart';
import '../../../routes/app_pages.dart';
import '../../../widgets/banner_widget.dart';

Widget headerWidget(BuildContext context) {
  return Container(
    color: ColorName.bgColor,
    child: SizedBox(
      height: 0.50.sh,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            height: 0.28.sh,
            padding: const EdgeInsets.only(
                left: 10, right: 10, bottom: 10, top: 15),
            clipBehavior: Clip.antiAlias,
            decoration:  ShapeDecoration(
              gradient: appLinearGradient(),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(5),
                  bottomRight: Radius.circular(5),
                ),
              ),
              shadows: const [
                BoxShadow(
                  color: Color(0x33000000),
                  blurRadius: 10,
                  offset: Offset(1, 2),
                  spreadRadius: 0,
                )
              ],
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
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                      height: 0),
                                  AppTextStyle(
                                      text: "@rztutul",
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      height: 0),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          GestureDetector(
                           onTap: () {
                             Get.toNamed(Routes.NOTIFICATION);
                            },
                            child: SvgPicture.asset(
                              Assets.icons.notificationIcon,
                              fit: BoxFit.fill,
                              height: 27.h,
                              width: 27.w,
                            ),
                          ),
                          SizedBox(
                            width: 20.w,
                          ),
                          InkWell(
                            onTap: () {
                              final homeController = Get.find<MainpageController>();
                              homeController.scaffoldKey.currentState?.openDrawer();

                            },
                            child: SvgPicture.asset(
                              Assets.icons.menuIcon,
                              fit: BoxFit.fill,
                              height: 25.h,
                              width: 25.w,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 0.17.sh,
            left: 20.w,
            right: 20.w,
            child: Container(
              padding: EdgeInsets.only(top: 12.w),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      LabelIconPointsWidget(
                        title: "Class".tr,
                        icon: Icons.star,
                        value: "IV",
                      ),
                      LabelIconPointsWidget(
                        title: "Roll No.".tr,
                        icon: Icons.format_list_numbered_rtl_sharp,
                        value: "11",
                      ),
                      LabelIconPointsWidget(
                        title: "Department".tr,
                        icon: Icons.book_rounded,
                        value: "Science",
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  CarouselSlider.builder(
                      itemCount: 5,
                      options: CarouselOptions(
                        aspectRatio: 2.3,
                        viewportFraction: 1,
                        initialPage: 0,
                        enableInfiniteScroll: true,
                        reverse: false,
                        autoPlay: true,
                        autoPlayInterval: const Duration(seconds: 3),
                        autoPlayAnimationDuration:
                        const Duration(milliseconds: 800),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enlargeCenterPage: true,
                        enlargeFactor: 0.2,
                        scrollDirection: Axis.horizontal,
                      ),
                      itemBuilder: (BuildContext context, int itemIndex,
                          int pageViewIndex) =>
                      const BannerWidget()),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}


