import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../gen/colors.gen.dart';
import '../../../../global/bottomsheet/filter.dart';
import '../../../../global/custom_appbar.dart';
import '../../../../global/widget/globalButton.dart';
import '../../../../helper/app_text_style.dart';
import '../../../../helper/config_file.dart';
import '../../../routes/app_pages.dart';
import '../controllers/complain_controller.dart';

class ComplainView extends GetView<ComplainController> {
  const ComplainView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        iconImage: Assets.images.icResult.path,
        title: 'Complain',
        elevation: 0,
      ),
      floatingActionButton: isStudent() || isParent()
          ? GlobalButton(
              onTap: () {
                Get.toNamed(Routes.ADD_COMPLAIN);
              },
              icon: Assets.icons.add,
              text: 'Add New')
          : const SizedBox(),
      body: Padding(
        padding: EdgeInsets.all(10.r),
        child: Column(
          children: [
            isStudent()
                ? const SizedBox()
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      AppTextStyle(
                        text: 'Complain List',
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                      FilterWidget(
                        dateValue: true,
                      )
                    ],
                  ),
            SizedBox(
              height: 10.h,
            ),
            Expanded(
                child: InkWell(
              onTap: () {
                Get.toNamed(Routes.COMPLAIN_DELAILS);
              },
              child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(bottom: 8.h),
                      child: Card(
                        color: ColorName.whiteSmoke,
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.all(10.r),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(12.r),
                                        bottomLeft: Radius.circular(12.r))),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      flex: 3,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          AppTextStyle(
                                            text: "Complain ID",
                                            fontSize: 12,
                                            color: Colors.black
                                                .withOpacity(0.699999988079071),
                                          ),
                                          SizedBox(
                                            height: 4.h,
                                          ),
                                          AppTextStyle(
                                            text: "CI000000",
                                            fontSize: 14,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      flex: 0,
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10.w),
                                        child: Container(
                                          width: 2.w,
                                          height: 40.h,
                                          color: Colors.red.withOpacity(0.2),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                        flex: 6,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            AppTextStyle(
                                              text: "Issue",
                                              fontSize: 12,
                                              color: Colors.black.withOpacity(
                                                  0.699999988079071),
                                            ),
                                            SizedBox(
                                              height: 4.h,
                                            ),
                                            const SizedBox(
                                              child: AppTextStyleOverFlow(
                                                text:
                                                    "We need to improve our We need to improve our...",
                                                fontSize: 14,
                                                fontWeight: FontWeight.w700,
                                                maxLines: 1,
                                              ),
                                            ),
                                          ],
                                        ))
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                                width: 30.50.w,
                                child: Center(
                                  child: SvgPicture.asset(
                                    Assets.icons.forewordArrowIcon,
                                    height: 18.h,
                                    width: 30.w,
                                  ),
                                ))
                          ],
                        ),
                      ),
                    );
                  }),
            ))
          ],
        ),
      ),
    );
  }
}
