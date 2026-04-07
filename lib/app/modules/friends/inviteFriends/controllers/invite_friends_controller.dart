import 'package:elearning/app/modules/friends/widget/friend.dart';
import 'package:elearning/gen/colors.gen.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class InviteFriendsController extends GetxController {
  final selectedInvites = [].obs;
  void addInvited(Friend friend) {
    if (selectedInvites.length < 5) {
      selectedInvites.add(friend);
    } else {
      Get.snackbar(
        'Limit Exceeded',
        'Cannot select more than 5 friends.',
        colorText: ColorName.white,
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.only(bottom: 15),
        backgroundColor: ColorName.primary,
      );
    }
    update();
  }

  void removeInvited(Friend friend) {
    selectedInvites.remove(friend);
    update();
  }
}
