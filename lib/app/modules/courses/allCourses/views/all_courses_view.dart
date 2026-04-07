import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../../gen/assets.gen.dart';
import '../../../../../gen/colors.gen.dart';
import '../../../../../global/custom_appbar.dart';
import '../../../../../global/shimmer_loading.dart';
import '../../../../../helper/app_text_style.dart';
import '../../../../routes/app_pages.dart';
import '../controllers/all_courses_controller.dart';

class AllCoursesView extends GetView<AllCoursesController> {
  const AllCoursesView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorName.bgColor,
        appBar: CustomAppbar(
          iconImage: Assets.images.icResult.path,
          title: 'All Courses',
          elevation: 0,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: GridView.builder(
                shrinkWrap: true,
                // physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                itemCount: 10,
                gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisExtent: 210,
                  crossAxisCount: 2,
                  crossAxisSpacing: 0,
                  mainAxisSpacing: 0,
                ),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Get.toNamed(Routes.COURSE_DETAILS);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        constraints: const BoxConstraints(
                          maxWidth: 150,
                        ),
                        decoration: BoxDecoration(
                          color: ColorName.bgColor,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.grey,
                              blurRadius: 5.0,
                              spreadRadius: 0.0,
                              offset: Offset(
                                  0.0, 2.0), // shadow direction: bottom right
                            )
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                height: 100,
                                width: 150,
                                decoration: BoxDecoration(
                                  color: ColorName.bgColor,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: CachedNetworkImage(
                                    imageUrl:
                                    "https://www.buddyboss.com/wp-content/uploads/2023/03/Why-You-Should-Create-An-Online-Course-1.png",
                                    fit: BoxFit.fill,
                                    placeholder: (context, url) =>
                                        shimmerLoadingWidget(width: 150, height: 100),
                                  ),
                                )),
                            const Padding(
                              padding: EdgeInsets.only(top: 8.0, left: 10),
                              child: AppTextStyleOverFlow(
                                  text: "Mathematics 101 - Calculus",
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  height: 1.3),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0, left: 10),
                              child: AppTextStyle(
                                  text: "Rz Tutul",
                                  color: Colors.grey.shade500,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w700,
                                  height: 1.3),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0, left: 10),
                              child: AppTextStyle(
                                  text: "Free",
                                  color: Colors.green,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                  height: 1.3),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },

              ),
            ),
          ],
        )
    );
  }
}
