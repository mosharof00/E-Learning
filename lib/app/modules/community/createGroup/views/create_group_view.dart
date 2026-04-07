import 'package:elearning/app/modules/community/choosePeople/controllers/choose_people_controller.dart';
import 'package:elearning/gen/colors.gen.dart';
import 'package:elearning/global/round_color_button_container.dart';
import 'package:elearning/helper/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../global/custom_appbar.dart';
import '../../../friends/widget/friend.dart';
import '../controllers/create_group_controller.dart';

class CreateGroupView extends GetView<CreateGroupController> {
  const CreateGroupView({super.key});
  @override
  Widget build(BuildContext context) {
    final choosePeopleController = Get.put(ChoosePeopleController());
    return Scaffold(
      appBar: CustomAppbar(
        // iconImage: Assets.images.appbar.path,
        title: 'Create Group',
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 60.h,
                  width: 60.w,
                  decoration: const BoxDecoration(
                    color: ColorName.bgColor,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    onPressed: () {
                      controller.pickImage();
                    },
                    icon: const Icon(Icons.photo_camera_rounded),
                  ),
                ),
                SizedBox(
                  width: 15.w,
                ),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                        hintStyle: const TextStyle(color: Colors.black),
                        hintText: "Enter Group Name".tr ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.r),
                ),
                hintStyle: const TextStyle(color: Colors.black),
                labelText: 'Enter Group Description'.tr,
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Obx(
              () => AppTextStyle(
                text:
                    '${'Participants'.tr}: ${choosePeopleController.selectedInvites.length}',
                fontSize: 15.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            Expanded(
              flex: 3,
              child: Obx(
                () => ListView.builder(
                    // scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: choosePeopleController.selectedInvites.length,
                    itemBuilder: (context, index) {
                      Friend friend =
                          choosePeopleController.selectedInvites[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
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
                                      choosePeopleController
                                          .removeInvited(friend);
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
                            SizedBox(
                              width: 5.w,
                            ),
                            AppTextStyle(
                              text: friend.name,
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w500,
                            )
                          ],
                        ),
                      );
                    }),
              ),
            ),
            SizedBox(height: 10.h),
            AppRoundColorButton(
              onTap: () {},
              width: Get.width,
              text: 'Save',
              borderRadius: 30,
            ),
          ],
        ),
      ),
    );
  }
}
