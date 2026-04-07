import 'dart:io';
import 'package:elearning/gen/assets.gen.dart';
import 'package:elearning/gen/colors.gen.dart';
import 'package:elearning/helper/app_text_style.dart';
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
import '../../../../global/custom_appbar.dart';
import '../../../../global/widget/globalButton.dart';
import '../controllers/id_card_controller.dart';

class IdCardView extends GetView<IdCardController> {
  IdCardView({super.key});
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
      backgroundColor: ColorName.bgColor,
      appBar: const CustomAppbar(
        title: 'ID Card',
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: EdgeInsets.only(top: 15.h, right: 15.w),
                child: GlobalButton(
                  onTap: () async {
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
                  icon: Assets.icons.printIcon,
                  text: "Print",
                ),
              ),
            ),
            ExportFrame(
                frameId: "demo",
                exportDelegate: exportDelegate,
                child: Container(
                  height: 480.h,
                  width: Get.width,
                  margin: EdgeInsets.all(20.r),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30.r),
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0x33000000),
                        blurRadius: 5,
                        offset: Offset(0, 1),
                        spreadRadius: 0,
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Stack(
                        children: [
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                children: [
                                  SvgPicture.asset(
                                    Assets.images.idCardTopLeftBgImage,
                                    height: 70.h,
                                  ),
                                  SvgPicture.asset(
                                    Assets.images.idCardTopRightBgImage,
                                    height: 70.h,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10.h,
                              )
                            ],
                          ),
                          Positioned(
                              top: 15.h,
                              left: 0,
                              right: 0,
                              child: Image.network(
                                'https://i.pinimg.com/474x/35/b1/f3/35b1f31461c3a83ab53c5ee465fae2ce.jpg',
                                height: 50.h,
                                width: 50.w,
                              )
                
                              // CircleAvatar(
                              //   radius: 35.r,
                              //   backgroundImage: NetworkImage(
                              //       'https://i.pinimg.com/474x/35/b1/f3/35b1f31461c3a83ab53c5ee465fae2ce.jpg',),
                              // )
                              )
                        ],
                      ),
                      Expanded(
                          child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: SizedBox(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              AppTextStyle(
                                text:
                                    'School Name School Name School\nName School',
                                textAlign: TextAlign.center,
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w700,
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              CircleAvatar(
                                radius: 40.r,
                                backgroundImage: const NetworkImage(
                                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTANoPi6XIyIEExjFKW4Gcem3COGfMPDde6DA&s'),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: SizedBox(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          inFo("Student's ID"),
                                          inFo("Student's Name"),
                                          inFo("Father/Guardian"),
                                          inFo("Class"),
                                          inFo("Emergency Call"),
                                          inFo("Expired"),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: SizedBox(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          inFo(" :  " "123456"),
                                          inFo(" :  " "Name Here"),
                                          inFo(" :  " "Name Here"),
                                          inFo(" :  " "Class Here"),
                                          inFo(" :  " "01000 000000"),
                                          inFo(" :  " "00/00/0000"),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      )),
                      Stack(
                        children: [
                          SvgPicture.asset(
                            Assets.images.idCardBottomBgImage,
                            height: 70.h,
                          ),
                          Positioned(
                            bottom: 0.h,
                            left: 0.w,
                            right: 0.w,
                            child: Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              children: [
                                SvgPicture.asset(
                                  Assets.images.idCardBottomLeftBgImage,
                                  height: 72.h,
                                ),
                                SvgPicture.asset(
                                    Assets.images.idCardBottomRightBgImage,
                                    height: 70.h),
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                )),
            ExportFrame(frameId: "demo", exportDelegate: exportDelegate, child:  Container(
              height: 480.h,
              width: Get.width,
              margin: EdgeInsets.all(20.r),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30.r),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x33000000),
                    blurRadius: 5,
                    offset: Offset(0, 1),
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            children: [
                              SvgPicture.asset(
                                Assets.images.idCardTopLeftBgImage,
                                height: 70.h,
                              ),
                              SvgPicture.asset(
                                Assets.images.idCardTopRightBgImage,
                                height: 70.h,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20.h,
                          )
                        ],
                      ),
                      Positioned(
                          top: 15.h,
                          left: 0,
                          right: 0,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              AppTextStyle(
                                text: 'If found please return to:',
                                fontSize: 13.sp,
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Image.network(
                                'https://i.pinimg.com/474x/35/b1/f3/35b1f31461c3a83ab53c5ee465fae2ce.jpg',
                                height: 50.h,
                                width: 50.w,
                              ),
                            ],
                          )
                        // CircleAvatar(
                        //   radius: 35.r,
                        //   backgroundImage: NetworkImage(
                        //       'https://pngtree.com/freepng/school-logo_6851480.html'),
                        // ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: SizedBox(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              AppTextStyle(
                                text:
                                'School Name School Name School\nName School',
                                textAlign: TextAlign.center,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w700,
                              ),
                              AppTextStyle(
                                text: "ESTD: 2010, Gulshan, Dhaka.",
                                fontSize: 15.sp,
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              AppTextStyle(
                                text: "Phone: +8800 000000",
                                fontSize: 14.sp,
                              ),
                              AppTextStyle(
                                text: "Email: email@mail.com",
                                fontSize: 14.sp,
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              SvgPicture.asset(
                                Assets.images.barcodeImage,
                                height: 80.h,
                                width: 80.w,
                              ),
                              SizedBox(
                                height: 60.h,
                              ),
                              Container(
                                height: 1.h,
                                width: 100.w,
                                color: Colors.grey,
                              ),
                              AppTextStyle(
                                text: "Headmaster",
                                fontSize: 17.sp,
                                fontWeight: FontWeight.w700,
                              )
                            ],
                          ),
                        ),
                      )),
                  Stack(
                    children: [
                      SvgPicture.asset(
                        Assets.images.idCardBottomBgImage,
                        height: 70.h,
                      ),
                      Positioned(
                        bottom: 0.h,
                        left: 0.w,
                        right: 0.w,
                        child: Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                          children: [
                            SvgPicture.asset(
                              Assets.images.idCardBottomLeftBgImage,
                              height: 72.h,
                            ),
                            SvgPicture.asset(
                                Assets.images.idCardBottomRightBgImage,
                                height: 70.h),
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),)
          ],
        ),
      ),
    );
  }
}

Widget inFo(String text) {
  return Padding(
    padding: EdgeInsets.only(top: 3.h, bottom: 3.h),
    child: AppTextStyle(
      text: text,
      fontSize: 14.sp,
    ),
  );
}
