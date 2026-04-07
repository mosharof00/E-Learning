import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../gen/colors.gen.dart';
import '../../../../routes/app_pages.dart';
import '../../summary/controllers/summary_controller.dart';

class NormalQuizController extends GetxController {
  //TODO: Implement NormalQuizController

 final didPop = false.obs;


  final quizList = [].obs;
  Rx<bool> isClicked = false.obs;
  int? selectOption = 1000;
  final summaryController = Get.put(SummaryController(), permanent: true);
  RxDouble progress = 1.0.obs;
  final currentQuestionIndex = 0.obs;
  RxInt correctAnswers = 0.obs;
  RxInt incorrectAnswers = 0.obs;
  RxInt questionsServed = 0.obs;
  RxList<List> selectedIndicesList = <List>[].obs;
  final isSelected = false.obs;

  void toggleClickedIndex(int index) {
    selectOption = index;
  }

  bool checkRightWrong(int selectedIndex) {
    if (selectedIndex == quizList[currentQuestionIndex.value].correctOptions) {
      return true;
    } else {
      return false;
    }
  }

  @override
  void onInit() {
    super.onInit();
    quizList.value = QuizQus.getNormalQuizQuestions();
  }

  void onTapOption(int selectedOption, int correctOption) {
    selectOption = selectedOption;
    isClicked.value = true;
    isSelected.value = true;

    checkRightWrong(selectedOption)
        ? correctAnswers.value++
        : incorrectAnswers.value++;
  }

  void resetClickedIndices() {
    selectOption = 1000;
  }

  void nextQuestion() {
    isClicked.value = false;
    isSelected.value = false;
    if (currentQuestionIndex < quizList.length - 1) {
      currentQuestionIndex.value++;
      resetClickedIndices();
    } else {

      final encodedSelectedIndices = jsonEncode(selectedIndicesList);
      final arguments = {
        'selectedIndices': encodedSelectedIndices,
        'quizLength': quizList.length,
        'correctAnswer': correctAnswers.value,
      };
      Get.offNamed(
        Routes.SUMMARY,
        arguments: arguments,
      );
    }
  }

  Color checkBorderColor(int index) {
    Color borderColor;

    // Check if the option is selected
    if (checkRightWrong(index) && selectOption == index) {
      // If the selected option is correct, show green border
      borderColor = Colors.green;
    } else if (!checkRightWrong(index) && selectOption == index) {
      // If the selected option is incorrect, show red border
      borderColor = Colors.red;
    } else {
      borderColor = ColorName.gray70;
    }
    return borderColor;
  }

}



class QuizQus {
  final String? quizQus;
  final String? imgUrl;
  final List<String>? quizOptions;
  final int? correctOptions;
  QuizQus({
    this.quizQus,
    this.imgUrl,
    this.quizOptions,
    this.correctOptions,
  });

  static List<QuizQus> getNormalQuizQuestions() {
    return [
      QuizQus(
        quizQus: "What is the formula of water?",
        imgUrl:
        "https://cdn.britannica.com/34/216534-138-645B4F31/Catalyst-splits-water-into-hydrogen-and-oxygen.jpg?w=800&h=450&c=crop",
        quizOptions: ["H3O", "H2O", "NH2", "2HO"],
        correctOptions: 1,
      ),
      QuizQus(
        quizQus: "What is the Axis focus length?",
        imgUrl:
        "https://mmerevise.co.uk/app/uploads/2022/11/Picture11-3-1536x732.png.webp",
        quizOptions: [
          "Axis Length - 0",
          "Axis Length - 3",
          "Axis Length - 8",
          "Axis Length - 10",
        ],
        correctOptions: 0,
      ),
      QuizQus(
        quizQus: "What is the main focus length?",
        imgUrl:
        "https://www.bbc.co.uk/staticarchive/b1a2d5cb46fd8a5a8dbcb9961ae6e8b2d5b524ba.gif",
        quizOptions: [
          "Focal Length - 1",
          "Focal Length - 0.3",
          "Focal Length - 0.8",
          "Focal Length - 0",
        ],
        correctOptions: 3,
      ),
      QuizQus(
        quizQus: "2.5: Thin Lenses Ray Tracing and Thin Lenses?",
        imgUrl: "https://i.ytimg.com/vi/arM3IxHpNiI/maxresdefault.jpg",
        quizOptions: [
          "Object",
          "Real image",
          "Object lens",
          "focus of object lens",
        ],
        correctOptions: 2,
      ),
      QuizQus(
        quizQus: "What is convex lens?",
        imgUrl: "https://o.quizlet.com/edRWFNkUyXToIqFrgKXHRA.png",
        quizOptions: [
          "Converging - 1",
          "Converging - 2",
          "Converging - 3",
          "Converging - 4",
        ],
        correctOptions: 2,
      ),
    ];
  }
}