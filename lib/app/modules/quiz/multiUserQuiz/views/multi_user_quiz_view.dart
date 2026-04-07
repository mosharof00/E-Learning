import 'package:cached_network_image/cached_network_image.dart';
import 'package:elearning/gen/colors.gen.dart';
import 'package:elearning/global/app_primary_theme_method.dart';
import 'package:elearning/global/appbar_basic.dart';
import 'package:elearning/global/round_color_button_container.dart';
import 'package:elearning/helper/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../../../../../helper/dummy_data.dart';
import '../../../../routes/app_pages.dart';
import '../controllers/multi_user_quiz_controller.dart';

class MultiUserQuizView extends GetView<MultiUserQuizController> {
  const MultiUserQuizView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorName.bgColor,
      appBar: const SimpleAppBarWithBackButton(
        title: 'Waiting for players',
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Container(
              margin: const EdgeInsets.only(top: 10),
              padding: const EdgeInsets.all(10),
              width: 0.9.sw,
              decoration: BoxDecoration(
                color: ColorName.bgColor,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(left: 10),
                            height: 25,
                            width: 25,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [ColorName.primary, Colors.blueAccent],
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 1,
                                  blurRadius: 5,
                                  offset: const Offset(
                                      0, 3), // changes position of shadow
                                ),
                              ],
                            ),
                            child: const Icon(
                              Icons.topic,
                              color: Colors.white,
                              size: 15,
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: AppTextStyle(
                              text: 'Physics',
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Row(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(left: 10),
                              height: 25,
                              width: 25,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    ColorName.primary,
                                    Colors.blueAccent
                                  ],
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 1,
                                    blurRadius: 5,
                                    offset: const Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: const Icon(
                                Icons.supervised_user_circle_rounded,
                                color: Colors.white,
                                size: 15,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: AppTextStyle(
                                text: '10',
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 10),
                        height: 25,
                        width: 25,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [ColorName.primary, Colors.blueAccent],
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 5,
                              offset: const Offset(
                                  0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: const Icon(
                          Icons.question_mark,
                          color: Colors.white,
                          size: 15,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: AppTextStyle(
                          text: 'Question: Random',
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Center(
                    child: Container(
                      decoration: BoxDecoration(
                        color: ColorName.bgColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: QrImageView(
                        eyeStyle: QrEyeStyle(
                          eyeShape: QrEyeShape.square,
                          color: ColorName.primary,
                        ),
                        dataModuleStyle: QrDataModuleStyle(
                          dataModuleShape: QrDataModuleShape.square,
                          color: ColorName.primary,
                        ),
                        data: '1234567890',
                        version: QrVersions.auto,
                        size: 200.0,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  AppTextStyle(
                      text: '123 567 890',
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: ColorName.primary),
                  const SizedBox(height: 10),
                  AppTextStyle(
                      text:
                          'Scan the QR code or Enter the code to join this Quiz',
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: ColorName.primary),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 100,
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: users.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: SizedBox(
                      width: 90,
                      child: Stack(
                        children: [
                          Center(
                            child: CircleAvatar(
                              radius: 30,
                              backgroundImage: CachedNetworkImageProvider(
                                  users[index].imageUrl),
                            ),
                          ),
                          Positioned(
                            bottom: 10,
                            left: 0,
                            right: 0,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.circular(10),
                                  gradient: appLinearGradient(),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 1,
                                      blurRadius: 5,
                                      offset: const Offset(
                                          0, 3), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 3.0),
                                    child: AppTextStyleOverFlow(
                                      text: users[index].name,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              AppRoundColorButton(
                borderRadius: 30,
                width: 0.4.sw,
                text: 'Invite Friends'.tr,
                onTap: () {
                  Get.toNamed(Routes.INVITE_FRIENDS);
                },
              ),
              AppRoundColorButton(
                borderRadius: 30,
                width: 0.4.sw,
                text: 'Start Quiz'.tr,
                onTap: () {
                  Get.toNamed(Routes.TIMER_QUIZ, arguments: true);
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
