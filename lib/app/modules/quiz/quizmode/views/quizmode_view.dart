import 'package:elearning/gen/assets.gen.dart';
import 'package:elearning/gen/colors.gen.dart';
import 'package:elearning/global/appbar_basic.dart';
import 'package:elearning/helper/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../../routes/app_pages.dart';
import '../controllers/quizmode_controller.dart';

class QuizModeView extends GetView<QuizModeController> {
  const QuizModeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SimpleAppBarWithBackButton(
        title: 'Quiz Mode',
      ),
      backgroundColor: ColorName.bgColor,
      body: SizedBox(
        width: 1.sw,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 0.01.sh,
              ),
              AppTextStyle(
                text: 'Let\'s Play Quiz !',
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: AppTextStyle(
                  text: 'Select a game mode',
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                 const bool playAloneQuiz = true;
                  final arguments = {
                    'playAloneQuiz': playAloneQuiz,
                  };
                  Get.toNamed(Routes.CHOOSE_CATEGORIES,arguments:arguments);
                },
                child: Container(
                  height: 190,
                  width: 0.6.sw,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 7,
                        offset:
                            const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Column(children: [
                    SvgPicture.asset(Assets.icons.tropyIcon,
                        height: 120, width: 120),
                    AppTextStyle(
                      text: 'Practice Alone',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      textAlign: TextAlign.center,
                    ),
                    AppTextStyle(
                      text: 'Improve your skills',
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      textAlign: TextAlign.center,
                    ),
                  ]),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  Get.toNamed(Routes.CHOOSE_CATEGORIES);
                },
                child: Container(
                  height: 190,
                  width: 0.6.sw,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 7,
                        offset:
                            const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Column(children: [
                    SvgPicture.asset(Assets.icons.winnerCompetitionIcon,
                        height: 120, width: 120),
                    AppTextStyle(
                      text: 'Challenge Friends',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      textAlign: TextAlign.center,
                    ),
                    AppTextStyle(
                      text: 'Choose a friend to challenge',
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      textAlign: TextAlign.center,
                    ),
                  ]),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  Get.toNamed(Routes.JOIN_COMPETITION);
                },
                child: Container(
                  height: 190,
                  width: 0.6.sw,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 7,
                        offset:
                            const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Column(children: [
                    SvgPicture.asset(Assets.icons.comeptionSuccessIcon,
                        height: 120, width: 120),
                    AppTextStyle(
                      text: 'Join a Competition',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      textAlign: TextAlign.center,
                    ),
                    AppTextStyle(
                      text: 'Join a competition and be the winner',
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      textAlign: TextAlign.center,
                    ),
                  ]),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
