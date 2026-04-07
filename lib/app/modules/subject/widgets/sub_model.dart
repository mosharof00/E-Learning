import 'package:elearning/gen/assets.gen.dart';

class SubItem {
  final String? title;
  final String? value;

  SubItem({required this.title, required this.value});
}

List<SubItem> subItem = [
  SubItem(
    title: 'English 1st Paper',
    value: Assets.icons.englishIcon,
  ),
  SubItem(
    title: 'English 2nd Paper',
    value: Assets.icons.englishIcon,
  ),
  SubItem(
    title: 'Bangla 1st Paper',
    value: Assets.images.ban,
  ),
  SubItem(
    title: 'Bangla 2nd Paper',
    value: Assets.images.ban,
  ),
  SubItem(
    title: 'Math',
    value: Assets.images.math,
  ),
  SubItem(
    title: 'Science',
    value: Assets.images.scienceSvg,
  ),
];
