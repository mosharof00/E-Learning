import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:elearning/app/modules/friends/widget/friend.dart';
import 'package:elearning/gen/assets.gen.dart';
import 'package:elearning/gen/colors.gen.dart';
import 'package:elearning/global/app_primary_theme_method.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_to_pdf/export_delegate.dart';
import 'package:flutter_to_pdf/export_frame.dart';
import 'package:flutter_to_pdf/options/checkbox_options.dart';
import 'package:flutter_to_pdf/options/export_options.dart';
import 'package:flutter_to_pdf/options/text_field_options.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import '../../../../global/bottomsheet/filter.dart';
import '../../../../global/custom_appbar.dart';
import '../../../../global/shimmer_loading.dart';
import '../../../../helper/app_text_style.dart';
import '../controllers/admit_card_controller.dart';

class AdmitCardView extends GetView<AdmitCardController> {
  AdmitCardView({super.key});
  Future<void> saveFile(document, String name) async {
    final Directory dir = await getApplicationDocumentsDirectory();
    final File file = File('${dir.path}/$name.pdf');

    await file.writeAsBytes(await document.save());
    debugPrint('Saved exported PDF at: ${file.path}');
  }

  final ExportDelegate exportDelegate = ExportDelegate();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        // iconImage: Assets.images.appbar.path,
        title: 'Admit Card'.tr,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppTextStyle(
                        text: "Admit Card",
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                      ),
                      AppTextStyle(
                        text: "Filter Admit Card by Class",
                        fontSize: 10.sp,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                ElevatedButton(
                  onPressed: () async {
                    final ExportOptions overrideOptions = ExportOptions(
                      textFieldOptions: TextFieldOptions.uniform(
                        interactive: false,
                      ),
                      checkboxOptions: CheckboxOptions.uniform(
                        interactive: false,
                      ),
                    );
                    final pdf = await exportDelegate.exportToPdfDocument('demo',
                        overrideOptions: overrideOptions);
                    saveFile(pdf, 'static-example');
                  },
                  child: Icon(Icons.save_alt_outlined),
                )
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            ExportFrame(
              frameId: 'demo',
              exportDelegate: exportDelegate,
              child: Container(
                width: Get.width,
                height: 230.h,
                padding: const EdgeInsets.all(10),
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.r),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x19000000),
                      blurRadius: 5,
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
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: double.infinity,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8.0, right: 8),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // SvgPicture.asset(
                                //   Assets.icons.schoolLogo,
                                //   height: 50.h,
                                //   width: 50.w,
                                // ),
                                Image.network(
                                  'https://i.pinimg.com/474x/35/b1/f3/35b1f31461c3a83ab53c5ee465fae2ce.jpg',
                                  height: 50.h,
                                  width: 60.w,
                                ),
                                // SizedBox(width: 6.w),
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        AppTextStyle(
                                          text:
                                              'School Name School Name School\nName School',
                                          textAlign: TextAlign.center,
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w700,
                                        ),
                                        SizedBox(height: 4.h),
                                        AppTextStyle(
                                          text: 'ESTD: 2010, Gulshan, Dhaka.',
                                          textAlign: TextAlign.center,
                                          fontSize: 10.sp,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 8.h),
                                    Container(
                                      height: 20.h,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      decoration: BoxDecoration(
                                        gradient: appLinearGradient(),
                                        borderRadius: BorderRadius.circular(5.r),
                                        boxShadow: const [
                                          BoxShadow(
                                            color: Color(0x19000000),
                                            blurRadius: 5,
                                            offset: Offset(1, 2),
                                            spreadRadius: 0,
                                          )
                                        ],
                                      ),
                                      child: Center(
                                        child: AppTextStyle(
                                          text: 'ADMIT CARD',
                                          textAlign: TextAlign.center,
                                          fontSize: 12.sp,
                                          color: ColorName.white,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(width: 6.w),

                                CachedNetworkImage(
                                  imageUrl: Friend.getUsers()[0].imageUrl,
                                  height: 60.h,
                                  width: 50.w,
                                  imageBuilder: (context, imageProvider) {
                                    return Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5.r),
                                          image: DecorationImage(
                                              image: imageProvider,
                                              fit: BoxFit.cover)),
                                    );
                                  },
                                  placeholder: (context, url) =>
                                      shimmerLoadingWidget(),
                                  errorWidget: (context, url, error) =>
                                      const Icon(Icons.error),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 15.h),
                        SizedBox(
                          width: double.infinity,
                          height: 64.h,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AppTextStyle(
                                      text: 'Student\'s Name:',
                                      textAlign: TextAlign.center,
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                    AppTextStyle(
                                      text: 'Rz Tutul',
                                      color: Colors.black,
                                      textAlign: TextAlign.start,
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.w600,
                                      decoration: TextDecoration.underline,
                                      decorationStyle:
                                          TextDecorationStyle.dotted,
                                    ),
                                  ],
                                ),
                                SizedBox(height: 8.h),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AppTextStyle(
                                      text: 'Registration No:',
                                      color: Colors.black,
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    SizedBox(width: 10.w),
                                    Expanded(
                                      flex: 1,
                                      child: AppTextStyle(
                                        text: 'RT123456',
                                        color: Colors.black,
                                        textAlign: TextAlign.start,
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.w600,
                                        decoration: TextDecoration.underline,
                                        decorationStyle:
                                            TextDecorationStyle.dotted,
                                      ),
                                    ),
                                    SizedBox(width: 10.w),
                                    AppTextStyle(
                                      text: 'Section:',
                                      color: Colors.black,
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    SizedBox(width: 5.w),
                                    Expanded(
                                      flex: 1,
                                      child: AppTextStyle(
                                        text: 'A',
                                        color: Colors.black,
                                        textAlign: TextAlign.start,
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.w600,
                                        decoration: TextDecoration.underline,
                                        decorationStyle:
                                            TextDecorationStyle.dotted,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10.h),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AppTextStyle(
                                      text: 'Class:',
                                      color: Colors.black,
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    SizedBox(width: 5.w),
                                    Expanded(
                                      flex: 1,
                                      child: AppTextStyle(
                                        text: 'Six',
                                        color: Colors.black,
                                        textAlign: TextAlign.start,
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.w600,
                                        decoration: TextDecoration.underline,
                                        decorationStyle:
                                            TextDecorationStyle.dotted,
                                      ),
                                    ),
                                    SizedBox(width: 65.w),
                                    AppTextStyle(
                                      text: 'Roll No:',
                                      color: Colors.black,
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    SizedBox(width: 5.w),
                                    AppTextStyle(
                                      text: '2',
                                      color: Colors.black,
                                      textAlign: TextAlign.start,
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.w600,
                                      decoration: TextDecoration.underline,
                                      decorationStyle:
                                          TextDecorationStyle.dotted,
                                    ),
                                    const Spacer(),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0, right: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                '- - - - - - - - - - - - - - -',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 10.sp),
                              ),
                              AppTextStyle(
                                text: 'Class Teacher',
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ],
                          ),
                          const Spacer(),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                '- - - - - - - - - - - - - - -',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 10.sp),
                              ),
                              AppTextStyle(
                                text: 'Class Teacher',
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
