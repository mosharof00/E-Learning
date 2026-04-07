import 'package:cached_network_image/cached_network_image.dart';
import 'package:elearning/gen/colors.gen.dart';
import 'package:elearning/global/custom_appbar.dart';
import 'package:elearning/helper/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../../../gen/assets.gen.dart';
import '../../../../../global/bottomsheet/comment_bottom_sheet_dialog.dart';
import '../../../../../global/shimmer_loading.dart';
import '../controllers/notice_details_controller.dart';

class NoticeDetailsView extends GetView<NoticeDetailsController> {
  const NoticeDetailsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppbar(
          title: 'Notice Details',
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  CachedNetworkImage(
                    imageUrl:
                        "https://i.dailymail.co.uk/i/pix/2011/01/06/article-1344868-08738F81000005DC-465_1024x615_large.jpg",
                    imageBuilder: (context, imageProvider) => Container(
                      height: 200,
                      width: double.infinity,
                      margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    placeholder: (context, url) =>
                         shimmerLoadingWidget(
                           width: 200.0
                         ),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 0.7.sw,
                              child: AppTextStyle(
                                text:
                                    'Exam will be held on 10th of this month at 10:00 AM',
                                fontSize: 15,
                                color: ColorName.black,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 20.0),
                              child: SvgPicture.asset(
                                Assets.icons.shareIcon,
                                height: 20,
                                width: 20,
                              ),
                            ),

                            //
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  const CircleAvatar(
                                    radius: 12,
                                    backgroundImage: NetworkImage(
                                        "https://i.dailymail.co.uk/i/pix/2011/01/06/article-1344868-08738F81000005DC-465_1024x615_large.jpg"),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: AppTextStyle(
                                      text: 'By ${'Admin'.tr}',
                                      fontSize: 12,
                                      color: ColorName.black.withOpacity(0.5),
                                    ),
                                  ),
                                ],
                              ),
                              AppTextStyle(
                                text: 'Posted on 10th March 2024',
                                fontSize: 12,
                                color: ColorName.black.withOpacity(0.5),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 15.0),
                          child: AppTextStyle(
                            text:
                                'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC,'
                                ' making it over 2000 years old. Richard McClintock, '
                                ' making it over 2000 years old. Richard McClintock, '
                                ' making it over 2000 years old. Richard McClintock, '
                                ' making it over 2000 years old. Richard McClintock, '
                                ' making it over 2000 years old. Richard McClintock, '
                                'a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.',
                            fontSize: 15,
                            color: ColorName.black.withOpacity(0.5),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SvgPicture.asset(
                          Assets.icons.likeButtonIcon,
                          height: 20,
                          width: 20,
                        ),
                      ),
                      AppTextStyle(
                        text: '100 ${'Likes'.tr}',
                        fontSize: 15,
                        color: ColorName.black.withOpacity(0.5),
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      commentDialog("10", "Comments".tr, context);
                    },
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SvgPicture.asset(
                            Assets.icons.commnetIcon,
                            height: 20,
                            width: 20,
                          ),
                        ),
                        AppTextStyle(
                          text: '100 ${'Comments'.tr}',
                          fontSize: 15,
                          color: ColorName.black.withOpacity(0.5),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SvgPicture.asset(
                          Assets.icons.shareIcon,
                          height: 20,
                          width: 20,
                        ),
                      ),
                      AppTextStyle(
                        text: 'Share',
                        fontSize: 15,
                        color: ColorName.black.withOpacity(0.5),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ));
  }
}
