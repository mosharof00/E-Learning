import 'package:get/get.dart';
import 'package:elearning/gen/assets.gen.dart';

class PublicProfileController extends GetxController {
  //TODO: Implement PublicProfileController


}

class SubItem {
  final String? title;
  final String? value;

  SubItem({required this.title, required this.value});
}

List<SubItem> subItem = [
  SubItem(
    title: 'Flutter',
    value: Assets.icons.englishIcon,
  ),
  SubItem(
    title: 'Design',
    value: Assets.images.scienceSvg,
  ),
  SubItem(
    title: 'Illustration',
    value: Assets.images.ban,
  ),
  SubItem(
    title: 'Coding',
    value: Assets.images.ban,
  ),
  SubItem(
    title: 'Playing',
    value: Assets.images.math,
  ),
];
