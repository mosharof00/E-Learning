import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../gen/assets.gen.dart';
import '../../gen/colors.gen.dart';
import '../../helper/app_text_style.dart';
import '../routes/app_pages.dart';

class BannerWidget extends StatelessWidget {
  const BannerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(5),
        width: double.infinity,
        decoration:  BoxDecoration(
          borderRadius:
          const BorderRadius.all(Radius.circular(10)),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [ColorName.primary, ColorName.secondPrimary],
          ),
        ),
        child: Row(
          mainAxisAlignment:
          MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment:
                MainAxisAlignment.center,
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: [
                  AppTextStyle(
                    text: "Exam Notice",
                    fontSize: 15.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  AppTextStyle(
                    text:
                    "Exam will be held on 20th March 2024",
                    fontSize: 10.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius:
                        BorderRadius.circular(10.0),
                      ),
                    ),
                    onPressed: () {
                      Get.toNamed(Routes.NOTICE_DETAILS);
                    },
                    child: AppTextStyle(
                      text: "Check Now",
                      fontSize: 10.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            SvgPicture.asset(
              Assets.icons.graduationIcon,
              width: 80,
              height: 80,
            )
          ],
        ));
  }
}
