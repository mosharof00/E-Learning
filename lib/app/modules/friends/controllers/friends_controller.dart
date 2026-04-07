import 'package:elearning/app/modules/friends/widget/friend.dart';
import 'package:get/get.dart';
import '../../community/choosePeople/controllers/choose_people_controller.dart';
import '../inviteFriends/controllers/invite_friends_controller.dart';

class FriendsController extends GetxController {
  final users = [].obs;

  @override
  void onInit() {
    users.value = Friend.getUsers();
    super.onInit();
  }
}
