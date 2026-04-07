import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:readmore/readmore.dart';
import '../../gen/assets.gen.dart';
import '../../gen/colors.gen.dart';
import '../../helper/app_text_style.dart';
import '../../helper/constant_file.dart';
import '../bottomsheet/comment_bottom_sheet_dialog.dart';
import '../bottomsheet/custom_bottom_sheet.dart';

class PostItemsWidget extends StatelessWidget {
  const PostItemsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 10,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CachedNetworkImage(
                        imageUrl:
                            'https://fiverr-res.cloudinary.com/image/upload/f_auto,q_auto,t_profile_original/v1/attachments/profile/photo/ae3f34209c95914947ab5cdcda730b85-783618421632738574026/JPEG_20210927_162929_1225386559600372517.jpg',
                        imageBuilder: (context, imageProvider) => Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.circular(5),
                                image: DecorationImage(
                                    image: imageProvider, fit: BoxFit.cover),
                              ),
                            )),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppTextStyle(
                            text: 'Rz Tutul',
                            fontSize: 14,
                            fontWeight: FontWeight.w700),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 3.0),
                          child: AppTextStyle(
                            text: '2h ago',
                            fontSize: 10,
                            fontWeight: FontWeight.normal,
                            color: Colors.grey,
                          ),
                        ),
                        AppTextStyle(
                          text: 'ADMIN',
                          fontSize: 11,
                          fontWeight: FontWeight.normal,
                          color: ColorName.primary,
                        )
                      ],
                    ),
                  ],
                ),
                IconButton(
                  onPressed: () {
                    customBottomSheet(
                        context: context,
                        onTap1: () {},
                        svgPicture1: SvgPicture.asset(
                          Assets.icons.shareBlackIcon,
                        ),
                        text1: 'Share',
                        onTap2: () {},
                        svgPicture2: SvgPicture.asset(
                          Assets.icons.saveSharpIcon,
                        ),
                        text2: 'Save');
                  },
                  icon: const Icon(Icons.more_vert),
                ),
              ],
            ),
          ),
          Container(
              padding: const EdgeInsets.all(8),
              child: AppTextStyle(
                  text: 'Exam Preparation',
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  height: 1.5)),
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: ReadMoreText(
              'How to solve the quadratic equation? How to solve the quadratic equation? lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. ',
              trimLines: 3,
              style: TextStyle(
                  fontFamily: AppConstants.fontFamily,
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
              colorClickableText: ColorName.primary,
              trimMode: TrimMode.Line,
              trimCollapsedText: '...Read more',
              trimExpandedText: ' Less',
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CachedNetworkImage(
                imageUrl:
                    "https://media.istockphoto.com/id/502281790/photo/getting-help-on-a-homework-question.jpg?s=612x612&w=0&k=20&c=a3leVCL7ShtKOuTgj5J8UX6uN0DoIezAeFJC28mA9xs=",
                width: double.infinity,
                fit: BoxFit.cover,
                imageBuilder: (context, imageProvider) => Container(
                      height: 155,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(3),
                        image: DecorationImage(
                            image: imageProvider, fit: BoxFit.cover),
                      ),
                    ),
                height: 155),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(Assets.icons.likeButtonIcon,
                        colorFilter: ColorFilter.mode(
                            ColorName.primary, BlendMode.srcIn),
                        fit: BoxFit.fill,
                        width: 20,
                        height: 20),
                    const SizedBox(width: 5),
                    AppTextStyle(
                        text: '5.3K',
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey),
                  ],
                ),
                const SizedBox(width: 20),
                InkWell(
                  onTap: () {
                    commentDialog("10", "Comments", context);
                  },
                  child: Row(
                    children: [
                      SvgPicture.asset(Assets.icons.commnetIcon,
                          fit: BoxFit.fill, width: 20, height: 20),
                      const SizedBox(width: 5),
                      AppTextStyle(
                          text: '5.3K',
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey),
                    ],
                  ),
                ),
                const SizedBox(width: 20),
                Row(
                  children: [
                    Image.asset(Assets.images.shareIconIos.path,
                        fit: BoxFit.fill, width: 20, height: 20),
                    const SizedBox(width: 5),
                    AppTextStyle(
                        text: '5.3K',
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey),
                  ],
                ),
              ],
            ),
          ),
          /*    Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                CachedNetworkImage(
                    imageUrl:
                    'https://fiverr-res.cloudinary.com/image/upload/f_auto,q_auto,t_profile_original/v1/attachments/profile/photo/ae3f34209c95914947ab5cdcda730b85-783618421632738574026/JPEG_20210927_162929_1225386559600372517.jpg',
                    imageBuilder: (context, imageProvider) => Container(
                      width: 25,
                      height: 25,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(5),
                        image: DecorationImage(
                            image: imageProvider, fit: BoxFit.cover),
                      ),
                    )),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration.collapsed(
                        hintStyle: TextStyle(
                            fontSize: 12, color: Colors.grey.shade400),
                        hintText: 'Add a comment...'),
                  ),
                ),
              ],
            ),
          ),*/
        ],
      ),
    );
  }
}
