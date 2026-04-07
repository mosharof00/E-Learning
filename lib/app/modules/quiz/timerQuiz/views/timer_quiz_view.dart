import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:elearning/helper/awesome_alert_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:get/get.dart';
import '../../../../../gen/colors.gen.dart';
import '../../../../../global/shimmer_loading.dart';
import '../../../../../helper/app_text_style.dart';
import '../controllers/timer_quiz_controller.dart';

class TimerQuizView extends GetView<TimerQuizController> {
  const TimerQuizView({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (bool didPop) {
        if (didPop) {
          return;
        }
        awesomeAlertDialog(
          context,
          DialogType.warning,
          'Warning!'.tr,
          'Are you sure? You want to exit this Quiz?'.tr,
          () {},
          () {
            Get.back();
          },
        );
      },
      child: Scaffold(
        backgroundColor: ColorName.bgColor,
        body: Column(
          children: [
            Expanded(
              flex: 4,
              child: Stack(
                children: [
                  Container(
                    height: 0.3.sh,
                    decoration: BoxDecoration(
                      color: ColorName.primary,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(80.r),
                        bottomRight: Radius.circular(80.r),
                      ),
                    ),
                  ),
                  Positioned(
                    child: SafeArea(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppTextStyle(
                              text: "General Knowledge",
                              fontSize: 12.sp,
                              color: ColorName.white,
                            ),
                            Obx(() {
                              return AppTextStyle(
                                text: "Question "
                                    "${controller.currentQuestionIndex.value + 1} / "
                                    "${controller.quizList.length} ",
                                fontSize: 12.sp,
                                color: ColorName.white,
                              );
                            }),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0.18.sh,
                    left: 0,
                    right: 0,
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 30.w),
                          constraints: BoxConstraints(
                            minHeight: 250.h,
                          ),
                          decoration: BoxDecoration(
                            color: ColorName.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            // mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Obx(() {
                                          return AppTextStyle(
                                            text: controller.correctAnswers
                                                .toString(),
                                            //correct ans check
                                            fontSize: 20.sp,
                                            color: ColorName.primary,
                                          );
                                        }),
                                        SizedBox(
                                          width: 5.w,
                                        ),
                                        SizedBox(
                                          width: 50.w,
                                          child: Obx(() {
                                            return LinearProgressIndicator(
                                              value: controller.correctAnswers /
                                                  controller.quizList.length,
                                              backgroundColor:
                                                  ColorName.bgColor,
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                      ColorName.primary),
                                            );
                                          }),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: 50.w,
                                          child: Obx(() {
                                            return LinearProgressIndicator(
                                              value: controller
                                                      .incorrectAnswers /
                                                  controller.quizList.length,
                                              backgroundColor:
                                                  ColorName.bgColor,
                                              valueColor:
                                                  const AlwaysStoppedAnimation<
                                                      Color>(Colors.red),
                                            );
                                          }),
                                        ),
                                        SizedBox(
                                          width: 5.w,
                                        ),
                                        Obx(() {
                                          return AppTextStyle(
                                            text: controller.incorrectAnswers
                                                .toString(),
                                            //incorrect ans check
                                            fontSize: 20.sp,
                                            color: Colors.red,
                                          );
                                        }),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Obx(() => Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: CachedNetworkImage(
                                      height: 120.h,
                                      width: 250.w,
                                      fit: BoxFit.fill,
                                      imageUrl: controller
                                          .quizList[controller
                                              .currentQuestionIndex.value]
                                          .imgUrl!,
                                      placeholder: (context, url) =>
                                          shimmerLoadingWidget(),
                                      errorWidget: (context, url, error) =>
                                          const Icon(Icons.error),
                                    ),
                                  )),
                              ListView.builder(
                                itemCount:
                                    1, // Only one item for the current question
                                shrinkWrap: true,
                                physics: const ScrollPhysics(),
                                itemBuilder: (context, index) {
                                  return Obx(() => Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: AppTextStyle(
                                          text: controller
                                              .quizList[controller
                                                  .currentQuestionIndex.value]
                                              .quizQus!,
                                          fontSize: 13.sp,
                                          color: ColorName.primary,
                                        ),
                                      ));
                                },
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          // Timer
                          top: -60,
                          left: 0,
                          right: 0,
                          child: Container(
                            padding: const EdgeInsets.all(5),
                            decoration: const BoxDecoration(
                              color: ColorName.white,
                              shape: BoxShape.circle,
                            ),
                            child: Obx(
                              () => CircularPercentIndicator(
                                //Timer
                                animateFromLastPercent: true,
                                animation: true,
                                animationDuration:
                                    controller.totalTime.value * 30,
                                radius: 55.r,
                                lineWidth: 10.0,
                                percent: controller.progress.value,
                                center: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    AppTextStyle(
                                      text: "Time Left",
                                      fontSize: 10.sp,
                                      color: ColorName.primary,
                                    ),
                                    AppTextStyle(
                                      text:
                                          controller.totalTime.value.toString(),
                                      fontSize: 25.sp,
                                      color: ColorName.primary,
                                    ),
                                  ],
                                ),
                                backgroundColor: Colors.white,
                                progressColor: ColorName.primary,
                                reverse: true,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: Align(
                alignment: Alignment.topCenter,
                child: ListView.builder(
                  itemCount: controller
                      .quizList[controller.currentQuestionIndex.value]
                      .quizOptions!
                      .length,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Obx(() {
                      Color borderColor = controller.checkBorderColor(index);
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {
                            if (!controller.isClicked.value) {
                              // Allow selecting an option only if not already clicked
                              controller.onTapOption(
                                  index,
                                  controller
                                      .quizList[
                                          controller.currentQuestionIndex.value]
                                      .correctOptions);
                            }
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 30.w),
                            decoration: BoxDecoration(
                              color: ColorName.white,
                              border: Border.all(
                                style: BorderStyle.solid,
                                strokeAlign: BorderSide.strokeAlignInside,
                                color: borderColor,
                              ),
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            padding: const EdgeInsets.all(10),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Row(
                                children: [
                                  AppTextStyle(
                                    text: controller
                                        .quizList[controller
                                            .currentQuestionIndex.value]
                                        .quizOptions![index],
                                    fontSize: 12.sp,
                                    color: ColorName.primary,
                                  ),
                                  const Spacer(),
                                  Visibility(
                                    visible: controller.isClicked.value,
                                    // Check if option is clicked
                                    child: CircleAvatar(
                                      backgroundColor: controller
                                              .checkRightWrong(index)
                                          ? Colors
                                              .green // Color green for correct option
                                          : controller.selectOption == index
                                              ? Colors.red
                                              : Colors.white,
                                      // Color red for incorrect option
                                      radius: 10,
                                      // Adjust the radius according to your requirement
                                      child: Center(
                                        child: Icon(
                                          controller.checkRightWrong(index)
                                              ? Icons
                                                  .check_outlined // Display check circle icon if correct
                                              : controller.selectOption == index
                                                  ? Icons.close_outlined
                                                  : null,
                                          // Display close circle icon if incorrect
                                          color: Colors.white,
                                          size: 15, // Set icon color to white
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    });
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
