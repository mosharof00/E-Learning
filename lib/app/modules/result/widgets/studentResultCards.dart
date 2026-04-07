import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../gen/colors.gen.dart';
import '../../../../helper/app_text_style.dart';

class StudentResultCards extends StatelessWidget {
  const StudentResultCards({super.key});

  @override
  Widget build(BuildContext context) {

  List<String> pic = [
    Assets.images.eng,
    Assets.images.ban,
    Assets.images.math,
    Assets.images.scienceSvg,
  ];
  List<String> sub = [
    'English',
    'Bangla',
    'Math',
    'Science',
  ];


  return ListView.builder(
      itemCount: 10,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        String picToShow = pic[index % pic.length];
        String subToShow = sub[index % sub.length];
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: GestureDetector(
            onTap: (){
              // Get.toNamed(Routes.REPORT);
            },
            child: Container(
              padding: const EdgeInsets.all(10),
              clipBehavior: Clip.antiAlias,
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                shadows: const [
                  BoxShadow(
                    color: Color(0x19000000),
                    blurRadius: 5,
                    offset: Offset(1, 2),
                    spreadRadius: 0,
                  )
                ],
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SvgPicture.asset(picToShow,
                          width: 50.w, height: 50.h),
                      SizedBox(height: 4.h),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppTextStyle(
                            text: subToShow,
                            color: const Color(0xFF11436A),
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w700,
                          ),
                          AppTextStyle(
                            text: 'Chapter 1-5',
                            color: const Color(0xB211436A),
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(width: 20.w),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          AppTextStyle(
                            text: 'Saturday, 06/01/2024',
                            color: const Color(0xB211436A),
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                          ),
                          SizedBox(height: 6.h),
                          AppTextStyle(
                            text: '09:00 AM - 10:00 AM',
                            color: const Color(0xB211436A),
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                          ),
                          SizedBox(height: 6.h),
                          AppTextStyle(
                            text: 'Marks'.tr+': 90  |  '+'Grade'.tr+': A',
                            color: const Color(0xFF11436A),
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ],
                      ),
                      SizedBox(width: 5.w),
                      Container(
                        height: 70.h,
                        decoration: BoxDecoration(
                          color: ColorName.pink.withOpacity(0.25),
                          borderRadius: BorderRadius.circular(5.r),
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
