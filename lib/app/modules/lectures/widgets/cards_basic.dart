import 'package:elearning/app/routes/app_pages.dart';
import 'package:elearning/gen/assets.gen.dart';
import 'package:elearning/gen/colors.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../../helper/app_text_style.dart';
import 'package:shimmer/shimmer.dart';


class BasicCards extends StatelessWidget {
  BasicCards({super.key});

 final Widget thumbnail = Stack(
    children: <Widget>[
      CachedNetworkImage(
        //thumbnail update here
        imageUrl: "https://picsum.photos/250?image=9",
        width: 93.w,
        height: 62.h,
        fit: BoxFit.fill,
        placeholder: (context, url) => Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: Container(
            width: 93.w,
            height: 62.h,
            color: Colors.white,
          ),
        ),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
      Positioned(
        top: 18,
        left: 30,
        child: SvgPicture.asset(
          Assets.images.play,
          fit: BoxFit.fill,
          height: 24.h,
          width: 24.w,
        ),
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      itemCount: 15,
      itemBuilder: (context, item) {
        return GestureDetector(
          onTap: () {
            Get.toNamed(Routes.VIDEO_LECTURE);
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: const EdgeInsets.all(10),
              clipBehavior: Clip.antiAlias,
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                shadows: const [
                  BoxShadow(
                    color: Color(0x33000000),
                    blurRadius: 7,
                    offset: Offset(1, 2),
                    spreadRadius: 0,
                  )
                ],
              ),
              child: Row(
                // mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 93.w,
                    height: 62.h,
                    child: thumbnail,
                  ),
                  SizedBox(width: 10.w),
                  Container(
                    width: 2.w,
                    height: 40.h,
                    color: ColorName.pink.withOpacity(0.25),
                  ),
                  SizedBox(width: 10.w),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(width: 5.w),
                      SizedBox(
                        width: 202.w,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: double.infinity,
                              child: AppTextStyle(
                                text: 'Video Title ',
                                color: const Color(0xFF11436A),
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w700,
                                height: 0,
                              ),
                            ),
                            SizedBox(height: 4.h),
                            AppTextStyle(
                              text: '15:30 mins',
                              color: const Color(0xFF11436A),
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              height: 0,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
