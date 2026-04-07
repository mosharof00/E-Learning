import 'package:elearning/helper/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../../../gen/assets.gen.dart';
import '../../../../../gen/colors.gen.dart';

class LeaderList extends StatelessWidget {
  const LeaderList({super.key, this.index});
  final int? index;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount:
          index != null ? 1 : 10, // If index is provided, show only 1 item
      padding: EdgeInsets.zero,
      itemBuilder: (context, idx) {
        final int currentIndex =
            index ?? idx; // Use provided index or current index
        return Padding(
          padding: const EdgeInsets.only(bottom: 10.0, left: 8.0, right: 8.0),
          child: buildListItem(currentIndex),
        );
      },
    );
  }

  Widget buildListItem(int index) {
    if (index == 0) {
      return buildLeaderListItem(
        gradient: const LinearGradient(
          begin: Alignment(1.00, 0.00),
          end: Alignment(-1, 0),
          colors: [Color(0xFFFFD949), Color(0xFFFFEC7B)],
        ),
        trophyIcon: SvgPicture.asset(Assets.icons.goldTropy),
        name: 'Jason W.',
        value: 12524,
      );
    } else if (index == 1) {
      return buildLeaderListItem(
        gradient: const LinearGradient(
          begin: Alignment(1.00, 0.00),
          end: Alignment(-1, 0),
          colors: [Color(0xFFD8D8C7), Color(0xFFDFDFD0)],
        ),
        trophyIcon: SvgPicture.asset(Assets.icons.silverTropy),
        name: 'John D.',
        value: 10000,
      );
    } else if (index == 2) {
      return buildLeaderListItem(
        gradient: const LinearGradient(
          begin: Alignment(1.00, 0.00),
          end: Alignment(-1, 0),
          colors: [Color(0xFFF4AA6A), Color(0xFFF4B37B)],
        ),
        trophyIcon: SvgPicture.asset(Assets.icons.bronzeTropy),
        name: 'Jane S.',
        value: 8000,
      );
    } else {
      return buildLeaderListItem(
        gradient: null,
        trophyIcon: null,
        name: 'User',
        value: index + 1,
      );
    }
  }

  Widget buildLeaderListItem({
    LinearGradient? gradient,
    SvgPicture? trophyIcon,
    required String name,
    required int value,
  }) {
    return Container(
      width: Get.width,
      height: 70.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: gradient,
        color: gradient == null ? ColorName.bgColor : null,
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _buildAvatarContainer(trophyIcon),
            const SizedBox(width: 15),
            Text(
              name,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
            const Spacer(),
            SvgPicture.asset(
              Assets.icons.coin,
              width: 18.w,
              height: 18.h,
            ),
            const SizedBox(width: 5),
            Text(
              '$value K',
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(width: 15),
          ],
        ),
      ),
    );
  }

  Widget _buildAvatarContainer(SvgPicture? trophyIcon) {
    int value = 4;
    return Stack(
      alignment: AlignmentDirectional.topStart,
      children: [
        Container(
          width: 40.w,
          height: 40.h,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: NetworkImage(
                "https://img.freepik.com/free-photo/front-view-male-student-wearing-black-backpack-holding-copybooks-files-blue-wall_140725-42636.jpg?size=626&ext=jpg&ga=GA1.1.1328086042.1707023822&semt=sph",
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        if (trophyIcon != null)
          Container(
            width: 18.w,
            height: 18.h,
            decoration: const BoxDecoration(
              color: ColorName.bgColor,
              shape: BoxShape.circle,
            ),
            child: Center(child: trophyIcon),
          ),
        if (trophyIcon == null)
          Container(
            width: 18.w,
            height: 18.h,
            decoration: BoxDecoration(
              color: Colors.orangeAccent.shade200,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: AppTextStyle(
                text: '${value + 1}',
                color: ColorName.black,
              ),
            ),
          ),
      ],
    );
  }
}
