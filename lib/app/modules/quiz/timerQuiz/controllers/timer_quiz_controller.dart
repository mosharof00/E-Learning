import 'dart:async';
import 'dart:convert';
import 'package:elearning/app/modules/quiz/timerQuiz/widgets/timer_quiz_qus.dart';
import 'package:elearning/app/routes/app_pages.dart';
import 'package:elearning/gen/colors.gen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../summary/controllers/summary_controller.dart';

class TimerQuizController extends GetxController {
  final quizList = [].obs;
  Rx<bool> isClicked = false.obs;
  int? selectOption = 1000;
  final summaryController = Get.put(
    SummaryController(),
  );

  RxInt totalTime = 0.obs;
  RxDouble progress = 1.0.obs;
  final currentQuestionIndex = 0.obs;
  Timer? _timer;
  RxInt correctAnswers = 0.obs;
  RxInt incorrectAnswers = 0.obs;
  RxInt questionsServed = 0.obs;
  RxList<List> selectedIndicesList = <List>[].obs;

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
    quizList.value = QuizQus.getQuestions();
    if (quizList.isNotEmpty) {
      totalTime.value = quizList[currentQuestionIndex.value].time!;
    }
    startTimer();
  }

  void onTapOption(int selectedOption, int correctOption) {
    if (totalTime.value > 0) {
      selectOption = selectedOption;
      isClicked.value = true;
      checkRightWrong(selectedOption)
          ? correctAnswers.value++
          : incorrectAnswers.value++;

      // If the user didn't answer the question, add null to selectedIndicesList
      if (!isClicked.value) {
        selectedIndicesList.add([null]);
      } else {
        selectedIndicesList.add([selectedOption]);
      }

      _timer?.cancel();
      Future.delayed(const Duration(seconds: 3), () {
        resetClickedIndices();
        nextQuestion();
      });
    }
  }

  void resetClickedIndices() {
    selectOption = 1000;
  }

  void nextQuestion() {
    totalTime.value = quizList[currentQuestionIndex.value].time!;
    isClicked.value = false;
    if (currentQuestionIndex < quizList.length - 1) {
      currentQuestionIndex.value++;
      resetTimer();
      resetClickedIndices();
      // loadOptions();
      startTimer();
    } else {
      totalTime.value = 0;
      _timer?.cancel();
      // summaryController.correctAnswers = correctAnswers;
      // summaryController.incorrectAnswers = incorrectAnswers;
      final encodedSelectedIndices = jsonEncode(selectedIndicesList);
      final arguments = {
        'selectedIndices': encodedSelectedIndices,
        'quizLength': quizList.length,
        'correctAnswer': correctAnswers.value,
      };
      final bool? leaderboard = Get.arguments as bool?;
      if (leaderboard != null && leaderboard) {
        Get.offNamed(Routes.LEADER_BOAED, arguments: arguments);
      } else if (leaderboard == null) {
        Get.offNamed(
          Routes.SUMMARY,
          arguments: arguments,
        );
      }
      // Get.offNamed(
      //   Routes.SUMMARY,
      //   arguments: arguments,
      // );
    }
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) async {
      if (totalTime.value > 0) {
        totalTime.value--;
        progress.value =
            totalTime.value / quizList[currentQuestionIndex.value].time!;
      } else {
        _timer?.cancel();
        nextQuestion();
      }
    });
  }

  void resetTimer() {
    totalTime.value = quizList[currentQuestionIndex.value].time!;
    progress.value = 1.0;
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

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }
}
