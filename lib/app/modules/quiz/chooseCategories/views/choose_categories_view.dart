import 'package:cached_network_image/cached_network_image.dart';
import 'package:elearning/app/routes/app_pages.dart';
import 'package:elearning/gen/colors.gen.dart';
import 'package:elearning/helper/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../global/appbar_basic.dart';
import '../controllers/choose_categories_controller.dart';

class ChooseCategoriesView extends GetView<ChooseCategoriesController> {
  ChooseCategoriesView({super.key});
  final playAloneQuizValue =
      Get.arguments != null ? Get.arguments['playAloneQuiz'] : false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorName.bgColor,
        appBar: const SimpleAppBarWithBackButton(title: 'Pick Categories'),
        body: Column(
          children: [
            Expanded(child: ListView.builder(
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    buildQuestionBottomSheet(context);
                  },
                  child: Container(
                      margin: const EdgeInsets.all(10),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(color: Colors.grey),
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              AppTextStyle(
                                text: 'Category Name',
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                          CachedNetworkImage(
                            imageUrl:
                                "https://previews.123rf.com/images/mrcocoa/mrcocoa1705/mrcocoa170500133/77734679-color-box-physics-icon-background-and-graphics-the-illustration-is-colorful-flat-vector-pixel.jpg",
                            imageBuilder: (context, imageProvider) {
                              return Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                    image: imageProvider,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              );
                            },
                          )
                        ],
                      )),
                );
              },
            )),
          ],
        ));
  }

  Future<dynamic> buildQuestionBottomSheet(BuildContext context) {
    return showModalBottomSheet(
        isScrollControlled: false,
        context: context,
        builder: (BuildContext context) {
          String? selectedOption = "1";
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
            setSelectedOption(String? option) {
              setState(() {
                selectedOption = option;
              });
            }

            return Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Align(
                      alignment: Alignment.center,
                      child: AppTextStyle(text: 'Physics', fontSize: 20)),
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      child: AppTextStyle(text: 'Select Question Mode'),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: AppTextStyle(
                      text: 'Question will comes randomly',
                      fontSize: 10,
                    ),
                  ),
                  RadioListTile(
                    title: AppTextStyle(
                      text: 'Random Questions',
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    value: '1',
                    groupValue: selectedOption,
                    onChanged: (value) {
                      setSelectedOption(value);
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: AppTextStyle(
                      text: 'Question will comes selected chapter wise',
                      fontSize: 10,
                    ),
                  ),
                  RadioListTile(
                    title: AppTextStyle(
                      text: 'Chapter wise Questions',
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    value: '2',
                    groupValue: selectedOption,
                    onChanged: (value) {
                      setSelectedOption(value);
                      buildChapterQuestionBottomSheet(context);
                    },
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: ElevatedButton(
                      onPressed: () {
                        Get.back();
                        if (playAloneQuizValue == true) {
                          Get.toNamed(Routes.TIMER_QUIZ);
                        } else {
                          Get.toNamed(Routes.MULTI_USER_QUIZ);
                        }
                        // Get.toNamed(Routes.MULTI_USER_QUIZ);
                      },
                      child: AppTextStyle(
                        text: 'Next',
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: ColorName.primary,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            );
          });
        });
  }

  Future<dynamic> buildChapterQuestionBottomSheet(BuildContext context) {
    return showModalBottomSheet(
        isScrollControlled: false,
        context: context,
        builder: (BuildContext context) {
          List<String> texts = [
            "InduceSmile.com",
            "Flutter.io",
            "google.com",
            "youtube.com",
            "yahoo.com",
            "gmail.com"
          ];

          List<bool> isChecked;
          isChecked = List<bool>.filled(texts.length, false);

          return StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
            return Container(
              width: 0.5.sh,
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppTextStyle(
                              text: 'Physics',
                              fontSize: 17,
                              fontWeight: FontWeight.w400,
                            ),
                            AppTextStyle(
                              text: 'Select Chapter to play',
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.close),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(
                      child: ListView.builder(
                    itemCount: texts.length,
                    itemBuilder: (context, index) {
                      return CheckboxListTile(
                        title: AppTextStyle(
                          text: texts[index],
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        value: isChecked[index],
                        onChanged: (val) {
                          setState(
                            () {
                              isChecked[index] = val!;
                            },
                          );
                        },
                      );
                    },
                  )),
                ],
              ),
            );
          });
        });
  }
}
