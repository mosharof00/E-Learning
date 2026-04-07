import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:elearning/app/modules/quiz/contestLeaderboard/widget/banner.dart';
import 'package:elearning/gen/colors.gen.dart';
import 'package:elearning/global/app_primary_theme_method.dart';
import 'package:elearning/helper/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import '../../../../gen/assets.gen.dart';
import '../../../routes/app_pages.dart';
import '../controllers/quiz_controller.dart';

class QuizView extends GetView<QuizController> {
  const QuizView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: AppTextStyle(
              text: 'EQuiz',
              fontSize: 23,
              fontWeight: FontWeight.w700,
              color: Colors.white),
          centerTitle: false,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: appLinearGradient(),
            ),
          ),
        ),
        body: ListView(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                gradient: appLinearGradient(),
              ),
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                ),
                child: Container(
                    margin: EdgeInsets.all(10.h),
                    padding: EdgeInsets.all(10.w),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      gradient: appLinearGradient(),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppTextStyle(
                                text: "Challenge your friends",
                                fontSize: 15.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                              AppTextStyle(
                                text: "Invite your friends to play quiz game",
                                fontSize: 10.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              TextButton(
                                style: TextButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                                onPressed: () {
                                  Get.toNamed(Routes.QUIZMODE);
                                },
                                child: AppTextStyle(
                                  text: "Start Now",
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SvgPicture.asset(
                          Assets.icons.tropyIcon,
                          width: 110,
                          height: 100,
                        )
                      ],
                    )),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppTextStyle(
                      text: "Today Test",
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                  AppTextStyle(
                      text: "Here is your test list for today",
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey),
                  SizedBox(
                    height: 160,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 10,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Get.toNamed(Routes.ANIMATE_QUIZ);
                          },
                          child: Container(
                              margin: const EdgeInsets.only(
                                  right: 10, bottom: 3, top: 2),
                              width: 145,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    blurRadius: 0.4,

                                    offset: const Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Stack(
                                children: [
                                  SvgPicture.asset(
                                    Assets.icons.examImageIcon,
                                    fit: BoxFit.cover,
                                  ),
                                  Positioned(
                                      right: 0,
                                      bottom: 20,
                                      child: Container(
                                        padding: const EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                          color: Colors.black.withOpacity(0.7),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(10),
                                            bottomLeft: Radius.circular(10),
                                          ),
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            AppTextStyle(
                                                text: "Mathematics Exam",
                                                fontSize: 12,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.white),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 3.0),
                                              child: Row(
                                                children: [
                                                  const Icon(
                                                    Icons.access_time,
                                                    color: Colors.white,
                                                    size: 12,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 5.0),
                                                    child: AppTextStyle(
                                                        text: "45 Minutes",
                                                        fontSize: 10,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: Colors.white),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ))
                                ],
                              )),
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  AppTextStyle(
                      text: "Features Categories",
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                      height: 115,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 10,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                Get.toNamed(Routes.CATEGORIES_DETAILS);
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: Column(
                                  children: [
                                    CachedNetworkImage(
                                        imageUrl:
                                            "https://previews.123rf.com/images/mrcocoa/mrcocoa1705/mrcocoa170500133/77734679-color-box-physics-icon-background-and-graphics-the-illustration-is-colorful-flat-vector-pixel.jpg",
                                        imageBuilder:
                                            (context, imageProvider) =>
                                                Container(
                                                  decoration: BoxDecoration(
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: Colors.grey
                                                            .withOpacity(0.5),
                                                        spreadRadius: 1,
                                                        blurRadius: 5,
                                                        offset: const Offset(0,
                                                            3), // changes position of shadow
                                                      ),
                                                    ],
                                                    shape: BoxShape.circle,
                                                    image: DecorationImage(
                                                      image: imageProvider,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                        width: 80,
                                        height: 80),
                                    const SizedBox(
                                      height: 6,
                                    ),
                                    AppTextStyle(
                                        text: "Physics",
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black87),
                                  ],
                                ),
                              ),
                            );
                          })),
                  const SizedBox(
                    height: 15,
                  ),
                  CarouselSlider.builder(
                      itemCount: 5,
                      options: CarouselOptions(
                        aspectRatio: 2.2,
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
                        enlargeFactor: 0.25,
                        scrollDirection: Axis.horizontal,
                      ),
                      itemBuilder: (BuildContext context, int itemIndex,
                              int pageViewIndex) =>
                          const ContestBannerWidget()),
                  const SizedBox(
                    height: 15,
                  ),
                  AppTextStyle(
                      text: "Recent Result",
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                  const SizedBox(
                    height: 15,
                  ),
                  ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: 5,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Container(
                            margin: const EdgeInsets.only(right: 10),
                            height: 100,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      width: 70,
                                      height: 70,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: (index % 2) == 0
                                            ? ColorName.primary.withOpacity(0.6)
                                            : Colors.pink.shade300,
                                      ),
                                      child: Center(
                                        child: AppTextStyle(
                                            text: "${index + 1}",
                                            fontSize: 25,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 8.0),
                                            child: AppTextStyle(
                                              text: "Mathematics",
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 8.0),
                                            child: AppTextStyle(
                                              text: "45/50",
                                              fontSize: 20,
                                              fontWeight: FontWeight.w700,
                                              color: Colors.black45,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      LinearPercentIndicator(
                                        barRadius: const Radius.circular(10),
                                        width: 140.0,
                                        lineHeight: 14.0,
                                        percent: 0.5,
                                        backgroundColor: Colors.white,
                                        progressColor: (index % 2) == 0
                                            ? ColorName.primary
                                            : Colors.pink.shade300,
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            )),
                      );
                    },
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
