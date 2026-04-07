import 'package:cached_network_image/cached_network_image.dart';
import 'package:elearning/gen/colors.gen.dart';
import 'package:elearning/helper/config_file.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../global/label_with_title_view_all.dart';
import '../../../../global/option_item_lcon_label.dart';
import '../../../../helper/app_text_style.dart';
import '../../../model/option_model.dart';
import '../../../routes/app_pages.dart';

ListView homepageBody() {
  return ListView(
    physics: const NeverScrollableScrollPhysics(),
    shrinkWrap: true,
    padding: EdgeInsets.zero,
    children: [
      Column(
        children: [
          TitleWithViewAllWidget(
              topPadding: 0,
              title: "Choose option",
              viewAll: "View All",
              onTap: () {
                Get.toNamed(Routes.CHOOSE_OPTION);
              }),
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.zero,
                  itemCount: optionItem.length > 9 ? 9 : optionItem.length,
                  itemBuilder: (context, index) {
                    return OptionItemLabel(
                        onTap: () {
                          if (index == 0) {
                            (isStudent() || isParent())
                                ? Get.toNamed(Routes.ATTENDANCE)
                                : Get.toNamed(Routes.ATTENDANCETEACHER);
                          } else if (index == 1) {
                            Get.toNamed(Routes.HOME_WORK);
                          } else if (index == 2) {
                            Get.toNamed(Routes.ROUTINE);
                          } else if (index == 3) {
                            Get.toNamed(Routes.SUBJECT);
                          } else if (index == 4) {
                            Get.toNamed(Routes.EXAM);
                          } else if (index == 5) {
                            (isStudent() || isParent())
                                ? Get.toNamed(Routes.RESULT)
                                : Get.toNamed(Routes.TEACHER_RESULT);
                          } else if (index == 6) {
                            Get.toNamed(Routes.FEES);
                          } else if (index == 7) {
                            Get.toNamed(Routes.TEACHERLIST);
                          } else if (index == 8) {
                            Get.toNamed(Routes.NOTICE);
                          }
                        },
                        title: optionItem[index].title!,
                        icon: optionItem[index].value!);
                  },
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisExtent: 110,
                    crossAxisCount: 3,
                    crossAxisSpacing: 0,
                    mainAxisSpacing: 0,
                  ),
                ),
              ),
            ],
          ),
          TitleWithViewAllWidget(
              title: "Highlights Posts", viewAll: "View All", onTap: () {
                Get.toNamed(Routes.POST_FEED);

          }),
          SizedBox(
            height: 245,
            child: ListView.builder(
              padding: EdgeInsets.zero,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: 5,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Get.toNamed(Routes.NOTICE_DETAILS);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 210.w,
                      padding: const EdgeInsets.only(bottom: 8),
                      clipBehavior: Clip.antiAlias,
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        shadows: const [
                          BoxShadow(
                            color: Color(0x33000000),
                            blurRadius: 10,
                            offset: Offset(1, 2),
                            spreadRadius: 0,
                          )
                        ],
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CachedNetworkImage(
                              imageUrl:
                                  "https://media.istockphoto.com/id/502281790/photo/getting-help-on-a-homework-question.jpg?s=612x612&w=0&k=20&c=a3leVCL7ShtKOuTgj5J8UX6uN0DoIezAeFJC28mA9xs=",
                              fit: BoxFit.fill,
                              width: 280,
                              height: 155),
                          const SizedBox(height: 8),
                          const Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 4),
                            child: AppTextStyleOverFlow(
                                text:
                                    'How to solve the quadratic equation?How to solve the quadratic equation?',
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                                height: 1.5),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 6),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SvgPicture.asset(
                                          Assets.icons.likeButtonIcon,
                                          fit: BoxFit.fill,
                                          width: 20,
                                          height: 20,
                                          colorFilter: ColorFilter.mode(
                                              ColorName.primary,
                                              BlendMode.srcIn),
                                        ),
                                        const SizedBox(width: 5),
                                        AppTextStyle(
                                            text: '5.3K',
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                            height: 0.08),
                                      ],
                                    ),
                                    const SizedBox(width: 25),
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SvgPicture.asset(
                                          Assets.icons.commnetIcon,
                                          fit: BoxFit.fill,
                                          width: 20,
                                          height: 20,
                                          colorFilter: ColorFilter.mode(
                                              ColorName.primary,
                                              BlendMode.srcIn),
                                        ),
                                        const SizedBox(width: 5),
                                        AppTextStyle(
                                            text: '1.3K',
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                            height: 0.08),
                                      ],
                                    ),
                                  ],
                                ),
                                SvgPicture.asset(
                                  Assets.icons.shareIcon,
                                  fit: BoxFit.fill,
                                  width: 20,
                                  height: 20,
                                  colorFilter: ColorFilter.mode(
                                      ColorName.primary, BlendMode.srcIn),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      )
    ],
  );
}
