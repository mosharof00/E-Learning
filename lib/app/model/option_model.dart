import '../../gen/assets.gen.dart';

class OptionItem {
  final String? title;
  final String? value;

  OptionItem({this.title, this.value});
}

List<OptionItem> optionItem = [
  OptionItem(
    title: 'Attendance',
    value: Assets.icons.attendanceIcon,
  ),
  OptionItem(
    title: 'Home Work',
    value: Assets.icons.homeWorkIcon,
  ),
  OptionItem(
    title: 'Routine',
    value: Assets.icons.routineIcon,
  ),
  OptionItem(
    title: 'Lecture',
    value: Assets.icons.lectureIcon,
  ),
  OptionItem(
    title: 'Exam',
    value: Assets.icons.examIcon,
  ),
  OptionItem(
    title: 'Result',
    value: Assets.icons.resultIcon,
  ),
  OptionItem(
    title: 'Fees',
    value: Assets.icons.feesIcon,
  ),
  OptionItem(
    title: 'Teachers',
    value: Assets.icons.teahersIcon,
  ),
  OptionItem(
    title: 'Notice',
    value: Assets.icons.notificationColorIcon,
  ),
  OptionItem(
    title: 'Report',
    value: Assets.icons.reportIcon,
  ),
  OptionItem(
    title: 'Apply Leave',
    value: Assets.icons.leaveApplicationIcon,
  ),
  OptionItem(
    title: 'Complain',
    value: Assets.icons.complainIcon,
  ),
  OptionItem(
    title: 'Admit Card',
    value: Assets.icons.admit,
  ),
  OptionItem(
    title: 'Id Card',
    value: Assets.icons.idcard,
  ),
];
