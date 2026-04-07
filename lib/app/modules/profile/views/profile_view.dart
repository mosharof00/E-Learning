import 'package:elearning/app/modules/profile/views/profile_ui_helper.dart';
import 'package:elearning/app/routes/app_pages.dart';
import 'package:elearning/gen/assets.gen.dart';
import 'package:elearning/gen/colors.gen.dart';
import 'package:elearning/helper/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(ProfileController());
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
                      child: SvgPicture.asset(Assets.images.profileBgAppbar,
                          fit: BoxFit.cover,
                          colorFilter: ColorFilter.mode(
                              ColorName.primary, BlendMode.srcIn))),
                  Positioned(
                      top: 50,
                      left: 50,
                      right: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AppTextStyle(
                            text: 'Profile',
                            textAlign: TextAlign.center,
                            color: Colors.white,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w700,
                            height: 0,
                          )
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
                                    image: AssetImage(Assets.images.model.path),
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
                              Container(
                                width: 20.w,
                                height: 20.h,
                                decoration: BoxDecoration(
                                  color: Colors.black.withAlpha(60),
                                  shape: BoxShape.circle,
                                ),
                                child: Center(
                                    child: SvgPicture.asset(
                                  Assets.images.profileEditIcon,
                                )),
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),
                          AppTextStyle(
                            text: 'Class 8',
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
                      color: Colors.black26,
                      blurRadius: 6,
                      // spreadRadius: 2,
                    )
                  ]),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                          onTap: () {
                            Get.toNamed(Routes.PROFILE_DETAILS);
                          },
                          child: customProfileHeaderOptions(
                            text: 'Profile Details',
                            svgIcon: Assets.icons.userIcon,
                          )),
                      InkWell(
                          onTap: () {
                            Get.toNamed(Routes.PUBLIC_PROFILE);
                          },
                          child: customProfileHeaderOptions(
                            text: 'Public Profile',
                            svgIcon: Assets.icons.publicProfileViewIcon,
                          )),
                      InkWell(
                        onTap: () {
                          Get.toNamed(Routes.MY_ALL_COURSES);
                        },
                        child: customProfileHeaderOptions(
                          text: 'My Courses',
                          svgIcon: Assets.icons.favouriteBookIcon,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 5.h,
                          ),
                          InkWell(
                            onTap: () {
                              Get.toNamed(Routes.FRIENDS);
                            },
                            child: customProfileOptions(
                                svgPicture: Assets.icons.friendsIcon,
                                iconColor: const ColorFilter.mode(
                                    Colors.black54, BlendMode.srcIn),
                                text: "My Friends"),
                          ),
                          InkWell(
                            onTap: () {
                              Share.share('https://arcadexit.com/');
                            },
                            child: customProfileOptions(
                                svgPicture: Assets.icons.inviteFriendsIcon,
                                iconColor: const ColorFilter.mode(
                                    Colors.black54, BlendMode.srcIn),
                                text: "Invite Friends"),
                          ),
                          InkWell(
                            onTap: () {
                              Get.toNamed(Routes.LANGUAGE);
                            },
                            child: customProfileOptions(
                                svgPicture: Assets.icons.languageIcon,
                                iconColor: const ColorFilter.mode(
                                    Colors.black54, BlendMode.srcIn),
                                text: "Language"),
                          ),
                          InkWell(
                            onTap: () {
                              // Get.toNamed(Routes.LANGUAGE);
                            },
                            child: customProfileOptions(
                                svgPicture: Assets.icons.settingsIcon,
                                iconColor: const ColorFilter.mode(
                                    Colors.black54, BlendMode.srcIn),
                                text: "Settings"),
                          ),
                          InkWell(
                            onTap: () {
                              //  String? encodeQueryParameters(
                              //  Map<String,String> params
                              //  ){
                              //    return params.entries.map(( MapEntry<String,String>e) => "${Uri.encodeComponent(e.key)} = ${Uri.encodeComponent(e.key).join("&")}" )
                              //  }
                              // final Uri emailUri = Uri(
                              //   scheme: 'mailto',
                              //   path: "arcadexit.tech@gmail.com",
                              //   query:
                              // );
                            },
                            child: customProfileOptions(
                                svgPicture: Assets.icons.helpCenterIcon,
                                iconColor: const ColorFilter.mode(
                                    Colors.black54, BlendMode.srcIn),
                                text: "Help Center"),
                          ),
                          InkWell(
                            onTap: () {
                              controller.goToOurWebsite();
                            },
                            child: customProfileOptions(
                                svgPicture: Assets.icons.aboutUsSvgIcon,
                                iconColor: ColorFilter.mode(
                                    Colors.black.withOpacity(0.6),
                                    BlendMode.srcIn),
                                text: "About Us"),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          customProfileOptions(
                            svgPicture: Assets.icons.logOutIcon,
                            containerColor: Colors.white,
                            iconColor: const ColorFilter.mode(
                                Colors.red, BlendMode.srcIn),
                            text: "Log Out",
                            color: Colors.red,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
