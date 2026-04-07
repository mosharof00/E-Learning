import 'package:elearning/app/routes/app_pages.dart';
import 'package:elearning/gen/assets.gen.dart';
import 'package:elearning/helper/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';
import '../../../../gen/colors.gen.dart';
import '../../../../helper/constant_file.dart';
import '../controllers/introduction_page_controller.dart';

class IntroductionPageView extends GetView<IntroductionPageController> {
  const IntroductionPageView({super.key});
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: IntroductionScreen(
          globalBackgroundColor: ColorName.white,
          scrollPhysics: const BouncingScrollPhysics(),
          pages: [
            PageViewModel(
              titleWidget: SvgPicture.asset(
                Assets.icons.logo,
                fit: BoxFit.fill,
                height: 35.h,
                width: 200.w,
              ),
              bodyWidget: AppTextStyle(
                text:
                    'Embark on your E-Learning journey! Seamlessly manage classes, attendance, homework, lectures, exams, notices and more. Elevate your learning experience today!',
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
                textAlign: TextAlign.center,
              ),
              image: Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Image.asset(
                    Assets.images.elearningGif.path,
                    height: Get.height,
                    width: Get.width,
                  ),
                ),
              ),
            ),
            PageViewModel(
              titleWidget: AppTextStyle(
                text: 'Attendance',
                fontSize: 22.sp,
                fontWeight: FontWeight.bold,
              ),
              bodyWidget: Center(
                child: AppTextStyle(
                  text:
                      'Facilitate seamless attendance management with a single click! Both teachers and students can efficiently track attendance',
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  textAlign: TextAlign.center,
                ),
              ),
              image: Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Image.asset(
                    Assets.images.attendance.path,
                    height: Get.height,
                    width: Get.width,
                  ),
                ),
              ),
            ),
            PageViewModel(
              titleWidget: AppTextStyle(
                text: 'Exams',
                fontSize: 22.sp,
                fontWeight: FontWeight.bold,
              ),
              bodyWidget: AppTextStyle(
                text:
                    'Students can now attend exams conveniently via E-learning, ensuring flexibility and accessibility for academic assessments.',
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
                textAlign: TextAlign.center,
              ),
              image: Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Image.asset(
                    Assets.images.examsGif.path,
                    height: Get.height,
                    width: Get.width,
                  ),
                ),
              ),
            ),
            PageViewModel(
              titleWidget: AppTextStyle(
                text: 'Community',
                fontSize: 22.sp,
                fontWeight: FontWeight.bold,
              ),
              bodyWidget: AppTextStyle(
                text:
                    'Bridge the gap between students and teachers with our interactive platform, facilitating communication through Newsfeeds, Posts, Groups, Messages, and Q&A.',
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
                textAlign: TextAlign.center,
              ),
              image: Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Image.asset(
                    Assets.images.communityGif.path,
                    height: Get.height,
                    width: Get.width,
                  ),
                ),
              ),
            ),
            PageViewModel(
              titleWidget: AppTextStyle(
                text: 'Messages',
                fontSize: 22.sp,
                fontWeight: FontWeight.bold,
              ),
              bodyWidget: AppTextStyle(
                text:
                    'Connect instantly, learn collaboratively. Real-time chat for students and teachers makes learning dynamic and engaging. Join the conversation today!',
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
                textAlign: TextAlign.center,
              ),
              image: Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Image.asset(
                    Assets.images.messages.path,
                    height: Get.height,
                    width: Get.width,
                  ),
                ),
              ),
            ),
            PageViewModel(
              titleWidget: AppTextStyle(
                text: 'EQuiz',
                fontSize: 22.sp,
                fontWeight: FontWeight.bold,
              ),
              bodyWidget: AppTextStyle(
                text:
                    'Experience the thrill of competition with TimerQuiz, NormalQuiz and Contests. Earn attractive badges in this engaging, competitive environment.',
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
                textAlign: TextAlign.center,
              ),
              image: Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Image.asset(
                    Assets.images.equizGif.path,
                    height: Get.height,
                    width: Get.width,
                  ),
                ),
              ),
            ),
            PageViewModel(
              titleWidget: AppTextStyle(
                text: 'Courses',
                fontSize: 22.sp,
                fontWeight: FontWeight.bold,
              ),
              bodyWidget: AppTextStyle(
                text:
                    'Unlock your potential, expand your knowledge, and thrive with our courses. Empower yourself today for a brighter tomorrow!',
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
                textAlign: TextAlign.center,
              ),
              image: Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Image.asset(
                    Assets.images.courseGif.path,
                    height: Get.height,
                    width: Get.width,
                  ),
                ),
              ),
            ),
            PageViewModel(
              titleWidget: AppTextStyle(
                text: 'Teachers',
                fontSize: 22.sp,
                fontWeight: FontWeight.bold,
              ),
              bodyWidget: AppTextStyle(
                text:
                    'Teachers are qualified and ever-helpful, guide students through every step. Fostering growth and success in their educational journey',
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
                textAlign: TextAlign.center,
              ),
              image: Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Image.asset(
                    Assets.images.teacherGif.path,
                    height: Get.height,
                    width: Get.width,
                  ),
                ),
              ),
            ),
          ],
          onDone: () {
            Get.toNamed(Routes.LOGIN);
          },
          onSkip: () {
            Get.toNamed(Routes.LOGIN);
          },
          showSkipButton: true,
          skip: AppTextStyle(
            text: 'Skip',
            fontWeight: FontWeight.bold,
            fontSize: 18.sp,
            color: AppConstants.primary,
          ),
          next: Icon(
            Icons.arrow_forward,
            color: AppConstants.primary,
          ),
          done: AppTextStyle(
            text: 'Done',
            fontWeight: FontWeight.bold,
            fontSize: 18.sp,
            color: AppConstants.primary,
          ),
          dotsDecorator: DotsDecorator(
            size: const Size.square(5),
            activeSize: const Size(20, 10),
            color: ColorName.gray410,
            activeColor: AppConstants.primary,
            spacing: const EdgeInsets.symmetric(horizontal: 3),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
          ),
        ),
      ),
    );
  }
}
