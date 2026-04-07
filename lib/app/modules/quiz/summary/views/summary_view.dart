import 'dart:math';
import 'package:confetti/confetti.dart';
import 'package:elearning/app/modules/quiz/timerQuiz/controllers/timer_quiz_controller.dart';
import 'package:elearning/app/routes/app_pages.dart';
import 'package:elearning/global/app_primary_theme_method.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../../gen/colors.gen.dart';
import '../../../../../../helper/app_text_style.dart';
import '../../timerQuiz/animateQuiz/controllers/animate_quiz_controller.dart';
import '../controllers/summary_controller.dart';

class SummaryView extends GetView<SummaryController> {
  SummaryView({super.key});

  final int quizLength = Get.arguments != null
      ? Get.arguments['quizLength'] as int
      : 10; // Static default

  final int correctAnswer = Get.arguments != null
      ? Get.arguments['correctAnswer'] as int
      : 0; // Static default



  final timerController = Get.put(TimerQuizController());
  final animateController = Get.put(AnimateQuizController());

  @override
  Widget build(BuildContext context) {
    animateController.controllerTopLeft.play();
    return Stack(
      children: [
        GetBuilder<SummaryController>(
          init: SummaryController(),
          builder: (controller) => Scaffold(
            backgroundColor: ColorName.bgColor,
            body: Stack(
              children: [
                Container(
                  height: 0.5.sh,
                  decoration: BoxDecoration(
                    gradient: appLinearGradient(),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(60.r),
                      bottomRight: Radius.circular(60.r),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: EdgeInsets.only(top: 100.h),
                    child: AnimatedBuilder(
                      animation: controller.bounceAnimation,
                      builder: (context, child) {
                        return Container(
                          width: 160.w + controller.bounceAnimation.value,
                          height: 160.h + controller.bounceAnimation.value,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.greenAccent.withOpacity(0.3),
                          ),
                          child: Center(
                            child: Container(
                              width: 140.w + controller.bounceAnimation.value,
                              height: 140.h + controller.bounceAnimation.value,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.green.shade50,
                                border: Border.all(
                                  color: Colors.transparent,
                                  width: 5.0,
                                ),
                              ),
                              child: Center(
                                child: Container(
                                  width:
                                      120.w + controller.bounceAnimation.value,
                                  height:
                                      120.h + controller.bounceAnimation.value,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white,
                                    border: Border.all(
                                      color: Colors.transparent,
                                      width: 5.0,
                                    ),
                                  ),
                                  child: Center(
                                    child: Container(
                                      width: 130.w +
                                          controller.bounceAnimation.value,
                                      height: 130.h +
                                          controller.bounceAnimation.value,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.white,
                                        border: Border.all(
                                          color: Colors.transparent,
                                          width: 5.0,
                                        ),
                                      ),
                                      child: Center(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            AppTextStyle(
                                              text: "Your Score",
                                              color: ColorName.primary,
                                              fontSize: 15.sp,
                                              fontWeight: FontWeight.bold,
                                              height: 1.5,
                                            ),
                                            AppTextStyle(
                                              text: (correctAnswer * 20)
                                                  .toInt()
                                                  .toString(),
                                              color: ColorName.primary,
                                              fontSize: 30.sp,
                                              fontWeight: FontWeight.bold,
                                              height: 1.5,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Positioned(
                  top: 0.4.sh,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 0.25.sh,
                    margin: EdgeInsets.only(left: 30.w, right: 30.w),
                    decoration: BoxDecoration(
                      color: ColorName.white,
                      borderRadius: BorderRadius.all(Radius.circular(20.r)),
                    ),
                    child: Padding(
                      padding:
                          EdgeInsets.only(left: 20.w, right: 20.w, top: 5.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ValueWithTitle(
                                title: "Your\nPoints",
                                value: (correctAnswer * 20).toInt().toString(),
                                color: ColorName.primary,
                              ),
                              const Spacer(),
                              ValueWithTitle(
                                title: "Total\nQuestions",
                                value: quizLength.toString(),
                                color: Colors.tealAccent.shade400,
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ValueWithTitle(
                                title: "Correct",
                                value: correctAnswer.toString(),
                                color: Colors.greenAccent.shade700,
                              ),
                              const Spacer(),
                              ValueWithTitle(
                                title: "Incorrect",
                                value: (quizLength - correctAnswer).toString(),
                                color: Colors.redAccent.shade400,
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 0.75.sh, // Adjust the position as needed
                  left: 20,
                  right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () {
                          Get.offAllNamed(Routes.MAINPAGE);
                        },
                        child: Column(
                          children: [
                            Container(
                              height: 50.h,
                              width: 50.w,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.greenAccent.shade700,
                              ),
                              child: const Icon(
                                Icons.home,
                                color: ColorName.white,
                              ),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            AppTextStyle(
                              text: 'Home',
                              fontWeight: FontWeight.w400,
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          final selectedIndices =
                              Get.arguments['selectedIndices'];
                          final args = {'selectedIndices': selectedIndices};
                          Get.toNamed(Routes.QUS_ANS_REVIEW, arguments: args);
                        },
                        child: Column(
                          children: [
                            Container(
                              height: 50.h,
                              width: 50.w,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.tealAccent.shade700,
                              ),
                              child: const Icon(
                                Icons.remove_red_eye,
                                color: ColorName.white,
                              ),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            AppTextStyle(
                              text: 'Answer Review',
                              fontWeight: FontWeight.w400,
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          final args = {'quizLength':quizLength, 'correctAnswer' : correctAnswer, 'status': true};
                          Get.toNamed(Routes.LEADER_BOAED, arguments: args);
                        },
                        child: Column(
                          children: [
                            Container(
                              height: 50.h,
                              width: 50.w,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.redAccent.shade400,
                              ),
                              child: const Icon(
                                Icons.leaderboard,
                                color: ColorName.white,
                              ),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            AppTextStyle(
                              text: 'Leaderboard',
                              fontWeight: FontWeight.w400,
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
        ConfettiWidget(
          emissionFrequency: 0.1,
          maxBlastForce: 40,
          minBlastForce: 15,
          gravity: 0.15,
          blastDirectionality: BlastDirectionality.explosive,
          blastDirection: pi / 3,
          confettiController: animateController.controllerTopLeft,
          colors: [
            Colors.yellowAccent,
            ColorName.pink,
            Colors.greenAccent,
            ColorName.primary,
            Colors.orangeAccent,
            Colors.pinkAccent,
            ColorName.secondPrimary,
          ],
          // createParticlePath: drawStar,
        ),
      ],
    );
  }
}

class ValueWithTitle extends StatelessWidget {
  const ValueWithTitle({
    super.key,
    required this.value,
    required this.title,
    this.color,
  });

  final String value;
  final String title;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: 20.w,
          height: 20.h,
          decoration: BoxDecoration(
            color: color ?? ColorName.primary,
            shape: BoxShape.circle,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppTextStyle(
                text: value,
                color: ColorName.primary,
                fontSize: 15.sp,
                fontWeight: FontWeight.bold,
              ),
              AppTextStyle(
                text: title,
                color: ColorName.black,
                fontSize: 13.sp,
                fontWeight: FontWeight.bold,
              ),
            ],
          ),
        )
      ],
    );
  }
}
