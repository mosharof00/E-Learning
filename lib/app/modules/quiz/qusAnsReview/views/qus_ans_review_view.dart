import 'package:elearning/app/modules/quiz/timerQuiz/controllers/timer_quiz_controller.dart';
import 'package:elearning/gen/colors.gen.dart';
import 'package:elearning/helper/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../../global/custom_appbar.dart';
import '../controllers/qus_ans_review_controller.dart';

class QusAnsReviewView extends GetView<QusAnsReviewController> {
  QusAnsReviewView({super.key});
  final timerController = Get.put(TimerQuizController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorName.bgColor,
      appBar: const CustomAppbar(
        title: 'Quiz Answer Review',
        elevation: 0,
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 5, right: 5, top: 10),
            height: 45.h,
            decoration: BoxDecoration(
                color: ColorName.primary,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.r),
                    topRight: Radius.circular(20.r))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: 10.w,
                ),
                Expanded(
                  flex: 1,
                  child: AppTextStyle(
                    text: 'ST.',
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: ColorName.white,
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: AppTextStyle(
                      text: 'Question',
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: ColorName.white,
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: AppTextStyle(
                      text: 'Answer',
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: ColorName.white,
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: AppTextStyle(
                      text: 'Given',
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: ColorName.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: timerController.quizList.length,
            itemBuilder: (context, index) {
              // final args = Get.arguments as Map<String, dynamic>;
              // final decodedSelectedIndices =
              // jsonDecode(args['selectedIndices']!) as List<dynamic>;
              //
              // final List selectedIndices = decodedSelectedIndices.isNotEmpty
              //     ? decodedSelectedIndices[index]
              //     : [];

              List<String> givenAnswersTextList = [
                'Options 1.2', // For question 1
                'Options 2.3', // For question 2
                'Options 3.4', // For question 3
                // Add more given answer texts for additional questions if needed
              ];

              String givenAnswersText =
                  givenAnswersTextList[index % givenAnswersTextList.length];

              String question = timerController.quizList[index].quizQus!;
              List<int> correctAnswerIndices = [
                timerController.quizList[index].correctOptions!
              ];
              List<dynamic> correctAnswers = correctAnswerIndices
                  .map((idx) =>
                      timerController.quizList[index].quizOptions![idx])
                  .toList();
              // List selectedIndices = decodedSelectedIndices[index];
              // List<dynamic> givenAnswers = selectedIndices
              //     .map((idx) =>
              //         timerController.quizList[index].quizOptions![idx])
              //     .toList();

              // bool isCorrect = true;
              // Widget statusIcon = isCorrect
              //     ? const Icon(Icons.check, color: Colors.green)
              //     : const Icon(Icons.close, color: Colors.red);
               Widget statusIcon = const Icon(Icons.check, color: Colors.green);
              String correctAnswersText =
                  correctAnswers.isNotEmpty ? correctAnswers.join(', ') : '';
              // String givenAnswersText =
              //     givenAnswers!.isNotEmpty ? givenAnswers.join(', ') : '';

              return Padding(
                padding:
                    const EdgeInsets.only(top: 8.0, bottom: 8.0, right: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: statusIcon,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: 1,
                      height: 50,
                      color: Colors.grey.withOpacity(0.5),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      flex: 4,
                      child: AppTextStyle(
                        text: question,
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: 1,
                      height: 50,
                      color: Colors.grey.withOpacity(0.5),
                    ),
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: AppTextStyle(
                          text: correctAnswersText,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    Container(
                      width: 1,
                      height: 50,
                      color: Colors.grey.withOpacity(0.5),
                    ),
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: AppTextStyle(
                          text: givenAnswersText,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
