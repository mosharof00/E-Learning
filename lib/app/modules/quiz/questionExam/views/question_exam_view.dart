import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:elearning/gen/colors.gen.dart';
import 'package:elearning/global/image_view_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:slide_countdown/slide_countdown.dart';
import '../../../../../global/app_primary_theme_method.dart';
import '../../../../../global/icon_with_label_horizontal.dart';
import '../../../../../helper/app_text_style.dart';
import '../../../../../helper/awesome_alert_dialog.dart';
import '../controllers/question_exam_controller.dart';

class QuestionExamView extends GetView<QuestionExamController> {
  const QuestionExamView({super.key});
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (bool didPop) {
        if (didPop) {
          return;
        }
        awesomeAlertDialog(context, DialogType.warning, "Warning !",
            "Are you sure? You want to exit this Exam?", () {}, () {
          Get.back();
        });
      },
      child: Scaffold(
        backgroundColor: ColorName.bgColor,
        floatingActionButton: FloatingActionButton(
          backgroundColor: ColorName.primary,
          onPressed: () {},
          child: const Icon(
            Icons.arrow_downward_rounded,
            color: Colors.white,
          ),
        ),
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Colors.white, //change your color here
          ),
          title: AppTextStyle(
            text: 'Exam',
            fontSize: 20,
            color: Colors.white,
          ),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: appLinearGradient(),
            ),
          ),
          centerTitle: false,
        ),
        body: Column(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    LabelWithIconHorizontal(
                      label: "Physic",
                      icon: Icons.subject,
                    ),
                    LabelWithIconHorizontal(
                      label: "1 hr 30 min",
                      icon: Icons.timer_sharp,
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    LabelWithIconHorizontal(
                      label: "Introduction Physic",
                      icon: Icons.topic_outlined,
                    ),
                    LabelWithIconHorizontal(
                      label: "Mark: 100",
                      icon: Icons.scoreboard,
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: SlideCountdownSeparated(
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                separatorType: SeparatorType.title,
                slideDirection: SlideDirection.up,
                duration: Duration(hours: 1, minutes: 30),
                countUp: false,
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      constraints: const BoxConstraints(maxHeight: 2000),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          AppTextStyle(
                            text: 'Question. ${index + 1}',
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          InkWell(
                            onTap: () {
                              Get.to(MyPhotoGallery(
                                const [
                                  'https://images.ctfassets.net/4yflszkpcwkt/1fdUZwTlyjjOH9Ke7NTqxt/c79c530229692b16fb49c2672eeff8df/1.jpg'
                                ],
                                downloadAvailable: false,
                              ));
                            },
                            child: CachedNetworkImage(
                                imageUrl:
                                    'https://images.ctfassets.net/4yflszkpcwkt/1fdUZwTlyjjOH9Ke7NTqxt/c79c530229692b16fb49c2672eeff8df/1.jpg'),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: AppTextStyle(
                              text:
                                  'Boojho stands at A just on the side of a plane mirror as shown in Fig. 16.21. Can he see himself in the mirror? Also, can he see the image of objects situated at P, Q, and R?',
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          ListView.builder(
                            padding: EdgeInsets.zero,
                            itemCount: 4,
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: AppTextStyle(
                                  text:
                                      "(a) Find out the position of the image of an object situated at A in the plane mirror (Fig. 16.23).",
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black,
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
