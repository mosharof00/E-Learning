import 'package:elearning/global/round_color_button_container.dart';
import 'package:elearning/helper/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../gen/colors.gen.dart';
import '../../../../../global/custom_appbar.dart';

class FeesDetails extends StatelessWidget {
  const FeesDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final status = Get.arguments['status'];
    Color statusColor = ColorName.black;
    String paidAmount = '1500/-';
    status == 'Paid' ? paidAmount = '0/-' : paidAmount;
    return Scaffold(
      appBar: CustomAppbar(
        // iconImage: Assets.images.appbar.path,
        title: 'Payment History',
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SizedBox(
          height: 350.h,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 10.h),
              buildInfoRow('Fees', 'Class Test', 'Last Date of Payment',
                  '00/00/0000', statusColor),
              SizedBox(
                height: 15.h,
              ),
              buildInfoRow(
                  'Amount', '1500/-', 'Paid Amount', paidAmount, statusColor),
              SizedBox(
                height: 15.h,
              ),
              buildInfoRow('Payment Method', 'Bkash', 'Payment Date',
                  '00/00/0000', statusColor),
              SizedBox(
                height: 15.h,
              ),
              buildInfoRow(
                  'Receipt No.', '123456789', 'Status', status, statusColor),
              const Spacer(
                flex: 2,
              ),
              status == 'Unpaid'
                  ? Center(
                      child: AppRoundColorButton(
                        text: 'Pay Now',
                        width: Get.width,
                        borderRadius: 30,
                      ),
                    )
                  : const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildInfoRow(String leftTitle, String leftValue, String rightTitle,
      String rightValue, Color statusColor) {
    if (rightValue == 'Paid') {
      statusColor = Colors.greenAccent;
    } else if (rightValue == 'Unpaid') {
      statusColor = Colors.redAccent;
    } else {
      statusColor;
    }
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Row(
        children: [
          Container(
            width: 2.w,
            height: 40.h,
            color: ColorName.pink.withOpacity(0.25),
          ),
          SizedBox(
            width: 5.w,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppTextStyle(
                  text: leftTitle,
                  color: Colors.black.withOpacity(0.7),
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                ),
                SizedBox(height: 4.h),
                AppTextStyle(
                  text: leftValue,
                  color: Colors.black,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w700,
                ),
              ],
            ),
          ),
          SizedBox(width: 40.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                AppTextStyle(
                  text: rightTitle,
                  color: Colors.black.withOpacity(0.7),
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                ),
                SizedBox(height: 4.h),
                AppTextStyle(
                  text: rightValue,
                  color: statusColor,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w700,
                ),
              ],
            ),
          ),
          SizedBox(
            width: 5.w,
          ),
          Container(
            width: 2.w,
            height: 40.h,
            color: ColorName.pink.withOpacity(0.25),
          ),
        ],
      ),
    );
  }
}
