import 'package:get/get.dart';
import '../../../friends/widget/friend.dart';

class ChoosePeopleController extends GetxController {

  final selectedInvites = [].obs;
  void addInvited(Friend friend) {
    selectedInvites.add(friend);
    update();
  }

  void removeInvited(Friend friend) {
    selectedInvites.remove(friend);
    update();
  }

}
