import 'package:elearning/app/modules/community/choosePeople/controllers/choose_people_controller.dart';
import 'package:elearning/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../gen/colors.gen.dart';
import '../../../../helper/app_text_style.dart';
import '../inviteFriends/controllers/invite_friends_controller.dart';
import 'package:elearning/app/modules/friends/controllers/friends_controller.dart';
import 'friend.dart';

class FriendsList extends StatelessWidget {
  final Function(Friend)? onImageSelected; // Modified callback
  final Function(Friend)? onImageDeselected;
  final int
      status; //0 for normal Friend , 1 for Invite friend, 2 for Choose People (Group)
  const FriendsList({
    super.key,
    this.onImageSelected,
    this.onImageDeselected,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    int? selectedFriendIndex;
    final inviteController =
        status == 1 ? Get.find<InviteFriendsController>() : null;
    final groupController =
        status == 2 ? Get.find<ChoosePeopleController>() : null;

    return ListView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      itemCount: Friend.getUsers().length,
      itemBuilder: (context, index) {
        Friend f = Friend.getUsers()[index];
        return Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: InkWell(
            onTap: () {
              if (status == 0) {
                Get.toNamed(Routes.PUBLIC_PROFILE);
              } else {
                if (selectedFriendIndex != index) {
                  selectedFriendIndex = index;
                  // friendController.updateSelection(
                  //     index, status, f, groupFriends);
                  if (status == 1 && inviteController != null) {
                    inviteController.addInvited(f);
                  } else if (status == 2 && groupController != null) {
                    groupController.addInvited(f);
                  }
                }
              }
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 45.w,
                  height: 45.h,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: FutureBuilder(
                    future: precacheImage(NetworkImage(f.imageUrl), context),
                    builder: (BuildContext context,
                        AsyncSnapshot<dynamic> snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Shimmer.fromColors(
                          baseColor: ColorName.gray410,
                          highlightColor: ColorName.white,
                          child: Container(
                            width: 50.w,
                            height: 50.h,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors
                                  .white, // Change to whatever color you want
                            ),
                          ),
                        );
                      } else {
                        return CircleAvatar(
                          radius: 22.5,
                          backgroundImage: NetworkImage(f.imageUrl),
                        );
                      }
                    },
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                AppTextStyle(
                  text: f.name,
                  fontSize: 16.sp,
                  color: ColorName.black,
                  fontWeight: FontWeight.w600,
                ),
                const Spacer(),
                status !=0 ?
                Obx(
                  () => status == 1
                      ? inviteController!.selectedInvites.contains(f)
                          ? Container(
                              padding: const EdgeInsets.all(3),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: ColorName.primary,
                              ),
                              child: const Center(
                                child: Icon(
                                  Icons.check,
                                  color: Colors.white,
                                  size: 15,
                                ),
                              ),
                            )
                          : const SizedBox(width: 0.0, height: 0.0)
                      : status == 2
                          ? groupController!.selectedInvites.contains(f)
                              ? Container(
                                  padding: const EdgeInsets.all(3),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: ColorName.primary,
                                  ),
                                  child: const Center(
                                    child: Icon(
                                      Icons.check,
                                      color: Colors.white,
                                      size: 15,
                                    ),
                                  ),
                                )
                              : const SizedBox(width: 0.0, height: 0.0)
                          : const SizedBox(width: 0.0, height: 0.0),
                ) : const SizedBox(),
                SizedBox(
                  width: 5.w,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
