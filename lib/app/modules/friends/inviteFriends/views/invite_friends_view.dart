import 'package:elearning/app/modules/friends/widget/friends_list.dart';
import 'package:elearning/app/routes/app_pages.dart';
import 'package:elearning/gen/colors.gen.dart';
import 'package:elearning/global/round_color_button_container.dart';
import 'package:elearning/helper/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../widget/friend.dart';
import '../controllers/invite_friends_controller.dart';

class InviteFriendsView extends GetView<InviteFriendsController> {
  const InviteFriendsView({super.key});

  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = ScrollController();
    return Material(
      child: Stack(
        children: [
          Scaffold(
            backgroundColor: ColorName.primary,
            body: SafeArea(
              child: Container(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0, top: 15),
                      child: AppTextStyle(
                        text: 'Invite Friends to Play',
                        color: ColorName.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 16.sp,
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
                        child:  TextField(
                          decoration: InputDecoration(
                            labelText: 'Search ID or Friends Name'.tr,
                            labelStyle: const TextStyle(
                                color: ColorName
                                    .white), // Set label text color to white
                            border: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
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
          ),
          Positioned(
            top: 0.30.sh,
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
                  SizedBox(height: 70.h),
                  AppTextStyle(
                    text: 'My Friends',
                    fontSize: 18.sp,
                    color: ColorName.black,
                    fontWeight: FontWeight.w600,
                  ),
                  Expanded(
                    child: FriendsList(
                      status: 1,
                      onImageDeselected: (friend) {
                        controller.removeInvited(friend);
                      },
                      onImageSelected: (friend) {
                        controller.addInvited(friend);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 0.19.sh,
            left: 25,
            right: 25,
            child: Container(
              padding: const EdgeInsets.all(15),
              height: 158.h,
              width: 150.w,
              decoration: const BoxDecoration(
                  color: ColorName.white,
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              child: Obx(
                () => Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        AppTextStyle(
                          text:
                              '${controller.selectedInvites.length} ${'Selected Friends'.tr}',
                          fontWeight: FontWeight.w800,
                          fontSize: 16.sp,
                        ),
                      ],
                    ),
                    Expanded(
                      child: Scrollbar(
                        controller: scrollController,
                        trackVisibility: true,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: controller.selectedInvites.length,
                            itemBuilder: (context, index) {
                              Friend friend = controller.selectedInvites[index];
                              return Padding(
                                padding: const EdgeInsets.only(right: 15.0),
                                child: Column(
                                  children: [
                                    Stack(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            width: 45.w,
                                            height: 45.h,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              image: DecorationImage(
                                                image: NetworkImage(
                                                  friend.imageUrl,
                                                ),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          top: 5,
                                          right: 5,
                                          child: GestureDetector(
                                            onTap: () {
                                              controller.removeInvited(friend);
                                            },
                                            child: Container(
                                              decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Colors.red,
                                              ),
                                              child: const Center(
                                                child: Icon(
                                                  Icons.close,
                                                  color: Colors.white,
                                                  size: 20,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    AppTextStyle(
                                      text: friend.name,
                                      fontSize: 14,
                                    )
                                  ],
                                ),
                              );
                            }),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 0.89.sh,
            right: 0,
            left: 0,
            child: Container(
              padding: const EdgeInsets.only(
                  top: 15, left: 10, right: 10, bottom: 20),
              height: 90.h,
              color: ColorName.white,
              child: AppRoundColorButton(
                onTap: () {
                  // Get.toNamed(Routes.MULTI_USER_QUIZ);
                  Get.back();
                },
                text: 'Send Invite & Play Now',
                width: Get.width,
                fontSize: 15.sp,
                borderRadius: 30,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
