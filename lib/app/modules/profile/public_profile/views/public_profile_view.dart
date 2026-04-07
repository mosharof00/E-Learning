import 'package:elearning/gen/assets.gen.dart';
import 'package:elearning/gen/colors.gen.dart';
import 'package:elearning/helper/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../controllers/public_profile_controller.dart';

class PublicProfileView extends GetView<PublicProfileController> {
  const PublicProfileView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorName.bgColor,
        body: Column(
          children: [
            Container(
                height: 320.h,
                width: Get.width,
                color: ColorName.bgColor,
                child: Stack(
                  children: [
                    SizedBox(
                        height: 200,
                        width: Get.width,
                        child: SvgPicture.asset(
                          Assets.images.profileBgAppbar,
                          fit: BoxFit.cover,
                          colorFilter: ColorFilter.mode(
                              ColorName.primary, BlendMode.srcIn),
                        )),
                    Positioned(
                        top: 50,
                        left: 15,
                        right: 50,
                        child: Row(
                          // mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                                onTap: Get.back,
                                child: const Icon(
                                  Icons.arrow_back,
                                  color: Colors.white,
                                )),
                            const Spacer(),
                            AppTextStyle(
                              text: 'Public Profile',
                              textAlign: TextAlign.center,
                              color: Colors.white,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w700,
                              height: 0,
                            ),
                            const Spacer()
                          ],
                        )),
                    Positioned(
                        top: 105,
                        left: 50,
                        right: 50,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 120.w,
                              height: 120.h,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  image: DecorationImage(
                                      image:
                                          AssetImage(Assets.images.model.path),
                                      fit: BoxFit.contain),
                                  shape: BoxShape.circle,
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Color(0x33000000),
                                      blurRadius: 7,
                                      offset: Offset(1, 2),
                                      spreadRadius: 0,
                                    )
                                  ]),
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                AppTextStyle(
                                  text: 'RZ Tutul',
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w700,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                              ],
                            ),
                            const SizedBox(height: 5),
                            AppTextStyle(
                              text: 'Class 8 | A | Roll - 01',
                              color: Colors.black,
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w400,
                              height: 0,
                            ),
                          ],
                        )),
                  ],
                )),
            Expanded(
              child: Container(
                  width: Get.width,
                  padding: EdgeInsets.only(top: 30.h, left: 20.w, right: 20.w),
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(50),
                          topLeft: Radius.circular(50)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 9,
                          // spreadRadius: 2,
                        )
                      ]),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                              onTap: () {},
                              child: _customProfileHeaderOptions(
                                text: 'Add Friend',
                                svgIcon: Assets.icons.inviteFriendsIcon,
                              )),
                          SizedBox(
                            width: 45.w,
                          ),
                          InkWell(
                              onTap: () {
                                // Get.toNamed(Routes.PUBLIC_PROFILE);
                              },
                              child: _customProfileHeaderOptions(
                                text: 'Message',
                                svgIcon: Assets.icons.shareWhiteIcon,
                              )),
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      AppTextStyle(
                        text: 'Skills',
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: 5.h,
                        ),
                        child: SizedBox(
                          height: 110,
                          width: Get.width,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: subItem.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      CircleAvatar(
                                        radius: 34,
                                        backgroundColor: Colors.white,
                                        child: SvgPicture.asset(
                                          subItem[index].value.toString(),
                                          width: 70.w,
                                        ),
                                      ),
                                      AppTextStyle(
                                        text: subItem[index].title.toString(),
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w500,
                                      )
                                    ],
                                  ),
                                );
                              }),
                        ),
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      AppTextStyle(
                        text: 'About',
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                      ),
                      SizedBox(height: 10.h),
                      Expanded(
                        child: SizedBox(
                          width: Get.width,
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 10.0, bottom: 10.0),
                                  child: AppTextStyle(
                                    text:
                                        'I am a professional teacher with 5 years of experience. I have completed my graduation from Dhaka University. I am a professional teacher with 5 years of experience. I have completed my graduation from Dhaka University. I am a professional teacher with 5 years of experience. I have completed my graduation from Dhaka University. I am a professional teacher with 5 years of experience. I have completed my graduation from Dhaka University',
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w300,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
            )
          ],
        ));
  }
}

Widget _customProfileHeaderOptions(
    {required String text, required String svgIcon}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Container(
        height: 44.h,
        width: 44.w,
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                color: Color(0x3F000000),
                blurRadius: 7,
                offset: Offset(0.50, 1),
                spreadRadius: 0,
              )
            ],
            borderRadius: BorderRadius.circular(50)),
        child: Center(
          child: SvgPicture.asset(
            svgIcon,
            colorFilter:
                const ColorFilter.mode(Colors.black54, BlendMode.srcIn),
            height: 23.h,
          ),
        ),
      ),
      SizedBox(
        height: 5.h,
      ),
      AppTextStyle(
        text: text,
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
      ),
    ],
  );
}
