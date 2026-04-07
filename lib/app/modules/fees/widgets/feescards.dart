import 'package:elearning/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../gen/assets.gen.dart';
import '../../../../helper/app_text_style.dart';

class FeesCards extends StatelessWidget {
  const FeesCards({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> fees = [
      'Class Test',
      'First Revision',
      'Second Revision',
      'Final',
    ];
    List<String> status = [
      'Paid',
      'Unpaid',
    ];
    Color col;

    return ListView.builder(
      shrinkWrap: true,
      itemCount: 10,
      padding: EdgeInsets.zero,
      itemBuilder: (context, index) {
        String textToShow = fees[index % fees.length];
        String statusToShow = status[index % status.length];
        if (statusToShow == status[0]) {
          col = Colors.greenAccent;
        } else {
          col = Colors.redAccent;
        }
        return Padding(
          padding: const EdgeInsets.all(5.0),
          child: InkWell(
            onTap: (){
              final paymentStatus = { 'status' : statusToShow };
              Get.toNamed(Routes.FEESDETAILS, arguments: paymentStatus);
            },
            child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      clipBehavior: Clip.antiAlias,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x19000000),
                            blurRadius: 5,
                            offset: Offset(1, 2),
                            spreadRadius: 0,
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AppTextStyle(
                                  text: 'Fees',
                                  color: Colors.black.withOpacity(0.7),
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                                SizedBox(height: 4.h),
                                AppTextStyle(
                                  text: textToShow,
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                ),
                              ],
                            ),
                          ),
                          // SizedBox(width: 50.w),
                          Expanded(
                            flex: 1,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                AppTextStyle(
                                  text: 'Amount',
                                  color: Colors.black.withOpacity(0.7),
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                                SizedBox(height: 5.h),
                                AppTextStyle(
                                  text: '1500/-',
                                  color: Colors.black,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w700,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 40.w),
                          Expanded(
                            flex: 1,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    AppTextStyle(
                                      text: 'Status',
                                      color: Colors.black.withOpacity(0.7),
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    SizedBox(height: 5.h),
                                    AppTextStyle(
                                      text: statusToShow,
                                      color: col,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 15.w,
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Center(
                                    child: SvgPicture.asset(
                                      Assets.icons.forewordArrowIcon,
                                      height: 22.h,
                                      width: 10.5.w,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
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
