import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:elearning/gen/colors.gen.dart';
import 'package:elearning/global/shimmer_loading.dart';
import 'package:elearning/helper/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import '../../../../../gen/assets.gen.dart';
import '../../../../../helper/awesome_alert_dialog.dart';
import '../controllers/normal_quiz_controller.dart';

class NormalQuizView extends GetView<NormalQuizController> {
  const NormalQuizView({super.key});

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
            "Warning!".tr,
            "Are you sure? You want to exit this Quiz?".tr,
            () {},
            () {
              Get.back();
            },
          );
        },
        child: Scaffold(
          backgroundColor: ColorName.bgColor,
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              if (controller.isSelected.value != false) {
                controller.nextQuestion();
              }
            },
            backgroundColor: ColorName.primary,
            child: Obx(() {
              if (controller.currentQuestionIndex.value !=
                  controller.quizList.length - 1) {
                return const Icon(
                  Icons.arrow_forward,
                  color: ColorName.white,
                );
              } else {
                return const Icon(
                  Icons.done,
                  color: ColorName.white,
                );
              }
            }),
          ),
          body: SafeArea(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                        width: 0.1.sw,
                        child: Center(
                            child: IconButton(
                                onPressed: () {
                                  awesomeAlertDialog(
                                      context,
                                      DialogType.warning,
                                      "Warning !",
                                      "Are you sure? You want to exit this Quiz?",
                                      () {}, () {
                                    Get.back();
                                  });
                                },
                                icon: const Icon(
                                  Icons.cancel,
                                  color: Colors.grey,
                                )))),
                    Obx(
                      () => LinearPercentIndicator(
                          barRadius: const Radius.circular(10),
                          width: 0.70.sw,
                          lineHeight: 14.0,
                          percent: (controller.currentQuestionIndex.value + 1)
                                  .toDouble() /
                              5.0,
                          backgroundColor: Colors.grey.shade300,
                          progressColor: ColorName.primary),
                    ),
                    Container(
                        width: 0.12.sw,
                        padding: const EdgeInsets.only(left: 5, right: 5),
                        margin: const EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            color: ColorName.primary,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10))),
                        child: Center(
                            child: Obx(() => AppTextStyle(
                                  text:
                                      '${controller.currentQuestionIndex.value + 1}/${controller.quizList.length}',
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ))))
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: SvgPicture.asset(
                        Assets.icons.ideaQuizIcon,
                        width: 30,
                        height: 30,
                      ),
                    ),
                    AppTextStyle(
                      text: "Physic Quiz",
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    )
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: Obx(
                    () => AppTextStyle(
                      text: controller
                          .quizList[controller.currentQuestionIndex.value]
                          .quizQus!,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Obx(() => CachedNetworkImage(
                      imageUrl: controller
                          .quizList[controller.currentQuestionIndex.value]
                          .imgUrl!,
                      imageBuilder: (context, imageProvider) {
                        return Container(
                          margin: const EdgeInsets.all(10),
                          height: 0.3.sh,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                  image: imageProvider, fit: BoxFit.cover)),
                        );
                      },
                      placeholder: (context, url) => shimmerLoadingWidget(),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    )),
                Expanded(
                  // flex: 3,
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
                          Color borderColor =
                              controller.checkBorderColor(index);
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InkWell(
                              onTap: () {
                                if (!controller.isClicked.value) {
                                  // Allow selecting an option only if not already clicked
                                  controller.onTapOption(
                                      index,
                                      controller
                                          .quizList[controller
                                              .currentQuestionIndex.value]
                                          .correctOptions);
                                }
                              },
                              child: Container(
                                margin: EdgeInsets.symmetric(horizontal: 20.w),
                                decoration: BoxDecoration(
                                  color: ColorName.white,
                                  border: Border.all(
                                    style: BorderStyle.solid,
                                    strokeAlign: BorderSide.strokeAlignInside,
                                    color: borderColor,
                                  ),
                                  borderRadius: BorderRadius.circular(10.r),
                                ),
                                padding: EdgeInsets.all(10.r),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Row(
                                    children: [
                                      AppTextStyle(
                                        text: controller
                                            .quizList[controller
                                                .currentQuestionIndex.value]
                                            .quizOptions![index],
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w500,
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
                                                  : controller.selectOption ==
                                                          index
                                                      ? Icons.close_outlined
                                                      : null,
                                              // Display close circle icon if incorrect
                                              color: Colors.white,
                                              size:
                                                  15, // Set icon color to white
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
        ));
  }
}
