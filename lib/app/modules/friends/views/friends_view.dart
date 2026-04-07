import 'package:elearning/app/modules/friends/widget/friends_list.dart';
import 'package:elearning/gen/colors.gen.dart';
import 'package:elearning/helper/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../controllers/friends_controller.dart';

class FriendsView extends GetView<FriendsController> {
  const FriendsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: [
          Scaffold(
            backgroundColor: ColorName.primary,
            body: Container(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 40.0),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: InkWell(
                            onTap: Get.back,
                            child: const Icon(
                              Icons.arrow_back,
                              size: 20,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const Spacer(),
                        AppTextStyle(
                          text: 'Invite Friends to Play',
                          color: ColorName.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 16.sp,
                        ),
                        const Spacer(),
                        SizedBox(width: 10.w,),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                    child: Container(
                      width: Get.width,
                      height: 45.h,
                      decoration: const BoxDecoration(
                        color: Colors
                            .white54, // Change to Colors.white for a solid white background
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: 'Search ID or Friends Name'.tr,
                          labelStyle: const TextStyle(
                              color: ColorName
                                  .white), // Set label text color to white
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          ),
                          prefixIcon: const Icon(
                            Icons.search,
                            color: ColorName.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 0.18.sh,
            left: 0,
            right: 0,
            child: Container(
              height: 0.9.sh,
              padding: const EdgeInsets.all(15),
              color: ColorName.bgColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppTextStyle(
                    text: 'My Friends',
                    fontSize: 18.sp,
                    color: ColorName.black,
                    fontWeight: FontWeight.w600,
                  ),
                  const Expanded(
                      child: FriendsList(
                    status: 0,
                  )),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
