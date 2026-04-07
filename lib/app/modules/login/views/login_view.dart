import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';
import 'package:elearning/helper/config_file.dart';
import 'package:elearning/helper/dummy_data.dart';
import 'package:elearning/services/firebase_db_service.dart';
import 'package:elearning/services/local_store_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../global/input_textform_field_border.dart';
import '../../../../global/round_color_button_container.dart';
import '../../../../helper/app_text_style.dart';
import '../../../routes/app_pages.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: SizedBox(
        height: 1.sh,
        child: Stack(
          children: [
            SvgPicture.asset(
              Assets.icons.backgroundDoodle,
              fit: BoxFit.fill,
              height: double.infinity,
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppTextStyle(
                    text: "hello".tr,
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w400,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  SvgPicture.asset(
                    Assets.icons.logo,
                    fit: BoxFit.fill,
                    height: 35.h,
                    width: 200.w,
                  ),
                  SizedBox(
                    height: 50.h,
                  ),
                  Obx(() {
                    return CustomSlidingSegmentedControl<int>(
                      fromMax: true,
                      height: 50,
                      innerPadding: EdgeInsets.zero,
                      children: {
                        0: AppTextStyle(
                          text: "STUDENT",
                          fontSize: 13,
                          color: controller.tabSelectedIndex.value == 0
                              ? Colors.white
                              : Colors.black,
                          fontWeight: FontWeight.w700,
                        ),
                        1: AppTextStyle(
                          text: "TEACHER",
                          fontSize: 13,
                          color: controller.tabSelectedIndex.value == 1
                              ? Colors.white
                              : Colors.black,
                          fontWeight: FontWeight.w700,
                        ),
                        2: AppTextStyle(
                          text: "PARENT",
                          fontSize: 13,
                          color: controller.tabSelectedIndex.value == 2
                              ? Colors.white
                              : Colors.black,
                          fontWeight: FontWeight.w700,
                        ),
                      },
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      clipBehavior: Clip.none,
                      isShowDivider: true,
                      dividerSettings: DividerSettings(
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                        ),
                        thickness: 1,
                      ),
                      padding: 20,
                      thumbDecoration: BoxDecoration(
                        borderRadius: controller.dynamicBorder.value,
                        gradient: controller.tabSelectedIndex.value == 1
                            ? controller.linearGradientTeacher.value
                            : controller.linearGradientStudent.value,
                      ),
                      onValueChanged: (int value) {
                        switch (value) {
                          case 0:
                            AppConfig.appFlavor = AppFlavor.student;
                            controller.dynamicBorder.value =
                                const BorderRadius.only(
                              topLeft: Radius.circular(20),
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(0),
                              topRight: Radius.circular(0),
                            );
                            controller.tabSelectedIndex.value = value;
                            break;
                          case 1:
                            AppConfig.appFlavor = AppFlavor.teacher;
                            controller.dynamicBorder.value =
                                const BorderRadius.only(
                              topLeft: Radius.circular(0),
                              bottomLeft: Radius.circular(0),
                              bottomRight: Radius.circular(0),
                              topRight: Radius.circular(0),
                            );
                            controller.tabSelectedIndex.value = value;
                            break;
                          case 2:
                            controller.dynamicBorder.value =
                                const BorderRadius.only(
                              topLeft: Radius.circular(0),
                              bottomLeft: Radius.circular(0),
                              bottomRight: Radius.circular(20),
                              topRight: Radius.circular(20),
                            );
                            controller.tabSelectedIndex.value = value;
                            break;
                          default:
                        }
                      },
                    );
                  }),
                  SizedBox(
                    height: 30.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30.w),
                    child: AppInputTextFormField(
                      fillColor: Colors.white,
                      enabledBorderColor: Colors.grey.shade300,
                      prefixIcon: const Icon(
                        Icons.person,
                        color: Colors.grey,
                      ),
                      hintText: "Enter User ID".tr,
                      borderRadius: 30.r,
                      controller: controller.passwordController,
                      textInputAction: TextInputAction.done,
                      keyboardType: TextInputType.visiblePassword,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter user id";
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30.w),
                    child: Obx(() {
                      return AppInputTextFormField(
                        fillColor: Colors.white,
                        enabledBorderColor: Colors.grey.shade300,
                        prefixIcon: const Icon(
                          Icons.password,
                          color: Colors.grey,
                        ),
                        obscureText: controller.obscureText.value,
                        suffixIcon: InkWell(
                          onTap: () {
                            controller.obscureText.value =
                                !controller.obscureText.value;
                          },
                          child: controller.obscureText.value
                              ? const Icon(
                                  Icons.visibility_off,
                                  color: Colors.grey,
                                )
                              : const Icon(
                                  Icons.visibility,
                                  color: Colors.grey,
                                ),
                        ),
                        hintText: "Enter Password".tr,
                        borderRadius: 30.r,
                        controller: controller.passwordController,
                        textInputAction: TextInputAction.done,
                        keyboardType: TextInputType.visiblePassword,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please enter password";
                          }
                          return null;
                        },
                      );
                    }),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30.w),
                      child: TextButton(
                          onPressed: () {},
                          child: AppTextStyle(
                            text: "Forgot Password?",
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey,
                          )),
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30.w),
                    child: GestureDetector(
                      onTap: () {
                        if (AppConfig.appFlavor == AppFlavor.student) {
                          HiveService.setUserID(users[0].id.toString());
                          FirebaseDBService.addedUser(users[0], 'Student');
                          Get.offAllNamed(Routes.MAINPAGE);
                        } else {
                          HiveService.setUserID(users[1].id.toString());
                          FirebaseDBService.addedUser(users[1], 'Teacher');
                          Get.offAllNamed(Routes.MAINPAGE);
                        }
                      },
                      child: Obx(() {
                        return AppRoundColorButton(
                          text: "Login".tr,
                          width: 200.w,
                          height: 50.h,
                          borderRadius: 20.r,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                          fontFamily: Assets.fonts.gothicA1Regular,
                          linearGradient: controller.tabSelectedIndex.value == 1
                              ? controller.linearGradientTeacher.value
                              : controller.linearGradientStudent.value,
                        );
                      }),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
