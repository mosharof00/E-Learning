import 'package:cached_network_image/cached_network_image.dart';
import 'package:draggable_home/draggable_home.dart';
import 'package:elearning/helper/constant_file.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../gen/colors.gen.dart';
import '../../../../global/app_primary_theme_method.dart';
import '../../../../global/label_with_title_view_all.dart';
import '../../../../global/shimmer_loading.dart';
import '../../../../helper/app_text_style.dart';
import '../../../../helper/config_file.dart';
import '../../../routes/app_pages.dart';
import '../controllers/courses_controller.dart';

class CoursesView extends GetView<CoursesController> {
  const CoursesView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CoursesController());
    return DraggableHome(
      scrollController: controller.scrollController,
      leading: IconButton(
        onPressed: () {
          controller.scrollToTop();
        },
        icon: const Icon(
          Icons.arrow_back_ios,
          color: Colors.white,
        ),
      ),
      title: Align(
        alignment: Alignment.centerLeft,
        child: AppTextStyle(
            text: "E-Courses",
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w700,
            height: 1.5),
      ),
      actions: [
        IconButton(
          onPressed: () {
            Get.toNamed(Routes.LECTURE);
          },
          icon: const Icon(
            Icons.search,
            color: Colors.white,
          ),
        ),
      ],
      headerWidget: Container(
        height: 20,
        decoration: BoxDecoration(
          gradient: appLinearGradient(),
        ),
        child: SafeArea(
          child: Stack(
            children: [
              Positioned(
                right: 0,
                child: SvgPicture.asset(
                  Assets.icons.onlineLearningImage,
                  height: 170,
                  width: 200,
                ),
              ),
              Column(
                children: [
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 3, top: 8.0),
                        child: SvgPicture.asset(
                          Assets.icons.logo,
                          fit: BoxFit.fill,
                          height: 25,
                          width: 25,
                          colorFilter: const ColorFilter.mode(
                              ColorName.white, BlendMode.srcIn),
                        ),
                      )),
                  const SizedBox(
                    height: 15,
                  ),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15, top: 15.0),
                        child: AppTextStyle(
                            text: "Find your Online Courses",
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            height: 1.3),
                      )),
                  Container(
                      margin:
                          const EdgeInsets.only(left: 15, right: 15, top: 15),
                      padding: const EdgeInsets.only(left: 10),
                      decoration: BoxDecoration(
                        color: ColorName.bgColor,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 5.0,
                            spreadRadius: 0.0,
                            offset: Offset(
                                0.0, 2.0), // shadow direction: bottom right
                          )
                        ],
                      ),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontFamily: AppConstants.fontFamily,
                          ),
                          hintText: 'Enter your keyword'.tr,
                          suffixIcon: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey.shade400,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SvgPicture.asset(
                                Assets.icons.searchIcon,
                                height: 15,
                                width: 15,
                                colorFilter: const ColorFilter.mode(
                                    ColorName.white, BlendMode.srcIn),
                              ),
                            ),
                          ),
                          border: InputBorder.none,
                        ),
                      ))
                ],
              ),
            ],
          ),
        ),
      ),
      // headerBottomBar: headerBottomBarWidget(),

      body: [
        ListView(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          children: [
            TitleWithViewAllWidget(
                topPadding: 0,
                title: "Course for you",
                viewAll: "View All",
                onTap: () {
                  Get.toNamed(Routes.ALL_COURSES);
                }),
            SizedBox(
              height: 200,
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Get.toNamed(Routes.COURSE_DETAILS);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        constraints: const BoxConstraints(
                          maxWidth: 150,
                        ),
                        decoration: BoxDecoration(
                          color: ColorName.bgColor,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.grey,
                              blurRadius: 5.0,
                              spreadRadius: 0.0,
                              offset: Offset(
                                  0.0, 2.0), // shadow direction: bottom right
                            )
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                height: 100,
                                width: 150,
                                decoration: BoxDecoration(
                                  color: ColorName.bgColor,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: CachedNetworkImage(
                                    imageUrl:
                                        "https://www.buddyboss.com/wp-content/uploads/2023/03/Why-You-Should-Create-An-Online-Course-1.png",
                                    fit: BoxFit.fill,
                                    placeholder: (context, url) =>
                                         shimmerLoadingWidget(width: 150, height: 100),
                                  ),
                                )),
                            const Padding(
                              padding: EdgeInsets.only(top: 8.0, left: 10),
                              child: AppTextStyleOverFlow(
                                  text: "Mathematics 101 - Calculus",
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  height: 1.3),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0, left: 10),
                              child: AppTextStyle(
                                  text: "Rz Tutul",
                                  color: Colors.grey.shade500,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w700,
                                  height: 1.3),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0, left: 10),
                              child: AppTextStyle(
                                  text: "Free",
                                  color: Colors.green,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                  height: 1.3),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                shrinkWrap: true,
              ),
            ),
            TitleWithViewAllWidget(
                topPadding: 0,
                title: "Course Category",
                viewAll: "View All",
                onTap: () {
                  Get.toNamed(Routes.ALL_CATEGORY_COURSES);
                }),
            SizedBox(
              height: 120,
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                     Get.toNamed(Routes.COURSE_DETAILS);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          CachedNetworkImage(
                            imageUrl:
                                "https://static.vecteezy.com/system/resources/previews/000/442/113/original/humidity-vetor-icon-vector.jpg",
                            fit: BoxFit.fill,
                            imageBuilder: (context, imageProvider) => Container(
                              width: 70,
                              height: 70,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                  image: imageProvider,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            placeholder: (context, url) =>
                                shimmerLoadingWidget(width: 70, height: 70),
                          ),
                          const SizedBox(height: 8),
                          AppTextStyle(
                              text: "Mathematics",
                              color: Colors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              height: 1.3),
                        ],
                      ),
                    ),
                  );
                },
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                shrinkWrap: true,
              ),
            ),
            TitleWithViewAllWidget(
                topPadding: 0,
                title: "Trending Courses",
                viewAll: "View All",
                onTap: () {
                  Get.toNamed(Routes.ALL_TRENDING_COURSES);
                }),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 200,
                  width: Get.width,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    // physics: const NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.zero,
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: (){
                          Get.toNamed(Routes.COURSE_DETAILS);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            constraints: const BoxConstraints(
                              maxWidth: 150,
                            ),
                            decoration: BoxDecoration(
                              color: ColorName.bgColor,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 5.0,
                                  spreadRadius: 0.0,
                                  offset: Offset(
                                      0.0, 2.0), // shadow direction: bottom right
                                )
                              ],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: CachedNetworkImage(
                                    imageUrl:
                                        "https://foundr.com/wp-content/uploads/2021/09/Best-online-course-platforms.png",
                                    fit: BoxFit.contain,
                                    placeholder: (context, url) =>
                                        shimmerLoadingWidget(width: 150, height: 100),
                                  ),
                                ),
                                const Padding(
                                  padding:
                                      EdgeInsets.only(top: 8.0, left: 10),
                                  child: AppTextStyleOverFlow(
                                      text: "Mathematics 101 - Calculus",
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                      height: 1.3),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 8.0, left: 10),
                                  child: AppTextStyle(
                                      text: "Rz Tutul",
                                      color: Colors.grey.shade500,
                                      fontSize: 10,
                                      fontWeight: FontWeight.w700,
                                      height: 1.3),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 8.0, left: 10),
                                  child: AppTextStyle(
                                      text: "1050 tk",
                                      color: Colors.green,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700,
                                      height: 1.3),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    // gridDelegate:
                    //     const SliverGridDelegateWithFixedCrossAxisCount(
                    //   mainAxisExtent: 210,
                    //   crossAxisCount: 2,
                    //   crossAxisSpacing: 0,
                    //   mainAxisSpacing: 0,
                    // ),
                  ),
                ),
              ],
            ),
          ],
        )
      ],
      headerExpandedHeight: getExpandedHeightCoursePage(context),
      //fullyStretchable: true,
      backgroundColor: ColorName.bgColor,
      appBarColor: ColorName.primary,
    );
  }
}
