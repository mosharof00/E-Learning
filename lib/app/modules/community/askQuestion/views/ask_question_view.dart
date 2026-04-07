import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:elearning/gen/colors.gen.dart';
import 'package:elearning/global/shimmer_loading.dart';
import 'package:elearning/helper/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../../gen/assets.gen.dart';
import '../../../../../global/bottomsheet/comment_bottom_sheet_dialog.dart';
import '../../../../../global/bottomsheet/custom_bottom_sheet.dart';
import '../controllers/ask_question_controller.dart';

class AskQuestionView extends GetView<AskQuestionController> {
  const AskQuestionView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorName.bgColor,
      body: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8, top: 10),
        child: Column(
          children: [
            InkWell(
              onTap: () {
                askQuestionBottomDialog(context);
              },
              child: Container(
                padding: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.question_answer,
                      color: Colors.grey,
                    ),
                    const SizedBox(width: 10),
                    DefaultTextStyle(
                      style: const TextStyle(
                        fontSize: 17.0,
                        color: Colors.grey,
                      ),
                      child: AnimatedTextKit(
                        animatedTexts: [
                          WavyAnimatedText('Ask a question...'),
                        ],
                        isRepeatingAnimation: true,
                        onTap: () {
                          askQuestionBottomDialog(context);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.only(top: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(
                                0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                const CircleAvatar(
                                  radius: 20,
                                  backgroundImage: NetworkImage(
                                      'https://www.w3schools.com/howto/img_avatar.png'),
                                ),
                                const SizedBox(width: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AppTextStyle(
                                        text: 'Rashed',
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.grey.shade800),
                                    AppTextStyle(
                                        text: 'class-12',
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.grey.shade500),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0, top: 8),
                            child: AppTextStyle(
                                text:
                                    'I am facing this problem for a long time. Can anyone help me to solve this problem?',
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey.shade800),
                          ),
                          const SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: CachedNetworkImage(
                              imageUrl:
                                  'https://img.theepochtimes.com/assets/uploads/2019/06/10/Simple-Math-fb-1.jpg',
                              fit: BoxFit.cover,
                              imageBuilder: (context, imageProvider) =>
                                  Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                      image: imageProvider, fit: BoxFit.cover),
                                ),
                                width: double.infinity,
                                height: 200,
                              ),
                              width: double.infinity,
                              height: 200,
                              placeholder: (context, url) => Center(
                                child: shimmerLoadingWidget(),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Row(
                                  children: [
                                    const Icon(Icons.thumb_up_alt_outlined,
                                        color: Colors.grey),
                                    const SizedBox(width: 5),
                                    const Text('10',
                                        style: TextStyle(
                                            fontSize: 12, color: Colors.grey)),
                                    const SizedBox(width: 25),
                                    InkWell(
                                      onTap: () {
                                        commentDialog(
                                            "10", "Comments", context);
                                      },
                                      child: const Row(
                                        children: [
                                          Icon(Icons.comment_outlined,
                                              color: Colors.grey),
                                          SizedBox(width: 5),
                                          Text('2',
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.grey)),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Row(
                                children: [
                                  Icon(Icons.access_time,
                                      color: Colors.grey.shade500),
                                  const SizedBox(width: 5),
                                  AppTextStyle(
                                      text: '2 days ago',
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.grey.shade500),
                                  IconButton(
                                      onPressed: () {
                                        customBottomSheet(
                                            context: context,
                                            onTap1: () {},
                                            svgPicture1: SvgPicture.asset(
                                              Assets.icons.shareBlackIcon,
                                            ),
                                            text1: 'Share',
                                            onTap2: () {},
                                            svgPicture2: SvgPicture.asset(
                                              Assets.icons.saveSharpIcon,
                                            ),
                                            text2: 'Save');
                                      },
                                      icon: const Icon(Icons.more_vert,
                                          color: Colors.grey)),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }

  void askQuestionBottomDialog(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    List<String> listOfUrls = [
      "https://cosmosmagazine.com/wp-content/uploads/2020/02/191010_nature.jpg",
      "https://scx2.b-cdn.net/gfx/news/hires/2019/2-nature.jpg",
      "https://upload.wikimedia.org/wikipedia/commons/7/77/Big_Nature_%28155420955%29.jpeg",
      "https://s23574.pcdn.co/wp-content/uploads/Singular-1140x703.jpg",
      "https://www.expatica.com/app/uploads/sites/9/2017/06/Lake-Oeschinen-1200x675.jpg",
    ];
    final TextEditingController textEditingControllercontroller = TextEditingController(text: "");
    showModalBottomSheet<void>(
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      context: context,
      backgroundColor: ColorName.bgColor,
      builder: (BuildContext context) {
        return StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
          return Form(
            key: formKey,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: AnimatedPadding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                duration: const Duration(milliseconds: 100),
                curve: Curves.decelerate,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                            style: TextButton.styleFrom(),
                            onPressed: () {
                              Get.back();
                            },
                            child: AppTextStyle(
                              text: 'Cancel',
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey,
                            ),
                          ),
                          TextButton(
                            style: TextButton.styleFrom(),
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                formKey.currentState!.save();
                                Navigator.pop(context);
                              }
                            },
                            child: AppTextStyle(
                              text: 'Post',
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: ColorName.primary,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          const CircleAvatar(
                            radius: 20,
                            backgroundImage: NetworkImage(
                                'https://www.w3schools.com/howto/img_avatar.png'),
                          ),
                          const SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppTextStyle(
                                  text: 'Rashed',
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey.shade800),
                              AppTextStyle(
                                  text: 'class-12',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey.shade500),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: textEditingControllercontroller,
                        maxLines: 5,
                        decoration: const InputDecoration(
                          hintText: 'Write your question here...',
                          border: InputBorder.none,
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: 200,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: listOfUrls.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  width: 100,
                                  height: 100,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                        image: NetworkImage(listOfUrls[index]),
                                        fit: BoxFit.cover),
                                  ),
                                ),
                              );
                            }),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
      },
    );
  }
}
