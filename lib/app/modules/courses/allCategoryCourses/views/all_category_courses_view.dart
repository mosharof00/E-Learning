import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../gen/assets.gen.dart';
import '../../../../../gen/colors.gen.dart';
import '../../../../../global/custom_appbar.dart';
import '../../../../../global/shimmer_loading.dart';
import '../../../../../helper/app_text_style.dart';
import '../../../../routes/app_pages.dart';
import '../controllers/all_category_courses_controller.dart';

class AllCategoryCoursesView extends GetView<AllCategoryCoursesController> {
  const AllCategoryCoursesView({super. key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorName.bgColor,
        appBar: CustomAppbar(
          iconImage: Assets.images.icResult.path,
          title: 'All Category Courses',
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
                  mainAxisExtent: 150,
                  crossAxisCount: 3,
                  crossAxisSpacing: 0,
                  mainAxisSpacing: 0,
                ),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Get.toNamed(Routes.ALL_TRENDING_COURSES);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        // height: 100,
                        // constraints: const BoxConstraints(
                        //   maxWidth: 150,
                        // ),
                        decoration: BoxDecoration(
                          color: ColorName.bgColor,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.grey,
                              blurRadius: 2.0,
                              spreadRadius: 0.0,
                              offset: Offset(
                                  0.0, 2.0), // shadow direction: bottom right
                            )
                          ],
                        ),
                        child:Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CachedNetworkImage(
                              imageUrl:
                              "https://static.vecteezy.com/system/resources/previews/000/442/113/original/humidity-vetor-icon-vector.jpg",
                              fit: BoxFit.fill,
                              imageBuilder: (context, imageProvider) => Container(
                                width: 70,
                                height: 70,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                    image: imageProvider,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              placeholder: (context, url) =>
                                  shimmerLoadingWidget(width: 70, height: 70),
                            ),
                            const SizedBox(height: 8),
                            AppTextStyle(
                                text: "Mathematics",
                                color: Colors.black,
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                                height: 1.3),
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
