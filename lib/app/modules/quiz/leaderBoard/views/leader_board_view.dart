import 'package:elearning/app/routes/app_pages.dart';
import 'package:elearning/gen/assets.gen.dart';
import 'package:elearning/gen/colors.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../../../global/app_primary_theme_method.dart';
import '../../../../../helper/app_text_style.dart';
import '../controllers/leader_board_controller.dart';

class LeaderBoardView extends GetView<LeaderBoardController> {
  const LeaderBoardView({super.key});
  @override
  Widget build(BuildContext context) {
    final bool? status = Get.arguments['status'] as bool?;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Container(
            height: Get.height,
            width: Get.width,
            decoration: BoxDecoration(
              gradient: appLinearGradient(),
            ),
            child: Stack(
              children: [
                Positioned(
                  top: 50,
                  left: 15,
                  right: 30,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                      ),
                      const Spacer(),
                      AppTextStyle(
                        text: 'Leaderboard',
                        textAlign: TextAlign.center,
                        color: Colors.white,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                      const Spacer(),
                      status != null
                          ? const SizedBox()
                          : InkWell(
                              onTap: () {
                                final int quizLength = Get.arguments != null
                                    ? Get.arguments['quizLength'] as int
                                    : 3; // Static default
                                final int correctAnswer = Get.arguments != null
                                    ? Get.arguments['correctAnswer'] as int
                                    : 2;
                                final args = {
                                  'quizLength': quizLength,
                                  'correctAnswer': correctAnswer,
                                };
                                Get.toNamed(Routes.SUMMARY, arguments: args);
                              },
                              child: SvgPicture.asset(
                                Assets.icons.summary,
                                colorFilter: const ColorFilter.mode(
                                  ColorName.white,
                                  BlendMode.srcIn,
                                ),
                                height: 25.h,
                                width: 25.w,
                              ),
                            ),
                    ],
                  ),
                ),
                Positioned(
                  top: 80.h,
                  left: 50.w,
                  right: 50.w,
                  child: Column(
                    children: [
                      AppTextStyle(
                        text: '1',
                        textAlign: TextAlign.center,
                        color: Colors.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w800,
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      ScaleTransition(
                        scale: controller.animation,
                        child: SvgPicture.asset(
                          Assets.images.crown,
                          height: 50,
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      _leaderCustomContainer(
                        imageLink:
                            'https://avatars.githubusercontent.com/u/37795928?v=4',
                        height: 140.h,
                        width: 140.w,
                        radius: 70.r,
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      AppTextStyle(
                        text: 'Rz Tutul',
                        textAlign: TextAlign.center,
                        color: Colors.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        height: 0,
                      ),
                      AppTextStyle(
                        text: '100',
                        textAlign: TextAlign.center,
                        color: Colors.yellow,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w800,
                      ),
                    ],
                  ),
                ),
                Positioned(
                    top: 205.h,
                    left: 15.w,
                    right: 15.w,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            AppTextStyle(
                              text: '2',
                              color: Colors.white,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w800,
                            ),
                            _leaderCustomContainer(
                              imageLink:
                                  'https://media.istockphoto.com/id/1392990621/photo/smart-handsome-positive-indian-or-arabian-guy-with-glasses-in-casual-wear-student-or.jpg?b=1&s=612x612&w=0&k=20&c=gSKl9O_Q9yDbe4abhs-GqHZIS3xvXj2ZZgum6a7vYvA=',
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            AppTextStyle(
                              text: 'Mosharof Khan',
                              textAlign: TextAlign.center,
                              color: Colors.white,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                            ),
                            AppTextStyle(
                              text: '90',
                              textAlign: TextAlign.center,
                              color: Colors.yellow,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w800,
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            AppTextStyle(
                              text: '3',
                              color: Colors.white,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w800,
                            ),
                            _leaderCustomContainer(
                              imageLink:
                                  'https://media.istockphoto.com/id/1342062117/photo/smart-arab-guy-student-with-backpack-and-books.jpg?b=1&s=612x612&w=0&k=20&c=6NQZ9g_IbiPh9S5xSia9lVHSW_yE-KOpIPD7v_u4lA8=',
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            AppTextStyle(
                              text: 'Mainul Islam',
                              textAlign: TextAlign.center,
                              color: Colors.white,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                            ),
                            AppTextStyle(
                              text: '90',
                              textAlign: TextAlign.center,
                              color: Colors.yellow,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w800,
                            ),
                          ],
                        ),
                      ],
                    )),
                Positioned(
                  bottom: 0.h,
                  child: Container(
                    padding: EdgeInsets.all(15.r),
                    height: 375.h,
                    width: Get.width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30.r),
                        topLeft: Radius.circular(30.r),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: ListView.builder(
                            itemCount: 10,
                            itemBuilder: (context, index) {
                              return ListTile(
                                leading: CircleAvatar(
                                  radius: 30.r,
                                  backgroundImage: const NetworkImage(
                                      'https://avatars.githubusercontent.com/u/37795928?v=4'),
                                ),
                                title: AppTextStyle(
                                  text: 'Rz Tutul',
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                                subtitle: AppTextStyle(
                                  text: 'Math, Physics, Chemistry',
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.grey,
                                ),
                                trailing: Container(
                                  height: 30.h,
                                  width: 30.w,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        width: 2.w, color: Colors.green),
                                  ),
                                  child: Center(
                                    child: AppTextStyle(
                                      text: '4',
                                      textAlign: TextAlign.center,
                                      color: Colors.green,
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 357.h,
                  left: 50.w,
                  right: 50.w,
                  child: Container(
                    height: 35.h,
                    width: 320.w,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          offset: Offset(1, 2),
                        ),
                      ],
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: TextField(
                        controller: controller.searchController,
                        keyboardAppearance: Brightness.dark,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.only(left: 15),
                          border: InputBorder.none,
                          hintText: 'Search Player',
                          hintStyle: TextStyle(color: Colors.grey),
                          suffixIcon: Icon(
                            Icons.search,
                            color: Colors.green,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

Widget _leaderCustomContainer({
  required String imageLink,
  double? height,
  double? width,
  double? radius,
}) {
  return Container(
    height: height ?? 110.h,
    width: width ?? 110.w,
    decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
            color: Colors.white,
            // Color(0xff03DBC4),
            width: 5.w)),
    child: Center(
      child: CircleAvatar(
        radius: radius ?? 55.r,
        // foregroundColor: const Color(0xff03DBC4),
        backgroundImage: NetworkImage(imageLink),
      ),
    ),
  );
}
