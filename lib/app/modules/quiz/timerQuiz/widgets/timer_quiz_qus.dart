class QuizQus {
  final String? quizQus;
  final String? imgUrl;
  final List<String>? quizOptions;
  final int? correctOptions;
  final int? time;
  QuizQus({
     this.quizQus,
     this.imgUrl,
     this.quizOptions,
     this.correctOptions,
    this.time
  });

  static List<QuizQus> getQuestions() {
    return [
      QuizQus(
        quizQus: 'What is the Capital City of BD 1',
        imgUrl:
            'https://img.jagranjosh.com/images/2023/March/2332023/Current-Affairs-Quiz-English-Image.webp',
        quizOptions: ['Option 1.1', 'Option 1.2', 'Option 1.3', 'Option 1.4'],
        correctOptions: 1,
        time: 7,
      ),
      QuizQus(
        quizQus: 'What is the Capital City of BD 2',
        imgUrl:
            'https://img.jagranjosh.com/images/2023/March/1732023/PuzzleIQTestSpotPatterntoReplaceQuestionMark.webp',
        quizOptions: ['Option 2.1', 'Option 2.2', 'Option 2.3', 'Option 2.4'],
        correctOptions: 2,
        time: 5,
      ),
      QuizQus(
        quizQus: 'What is the Capital City of BD 3',
        imgUrl:
            'https://img.jagranjosh.com/images/2023/March/1632023/Spot-3-Differences-in-6-Seconds.webp',
        quizOptions: ['Option 3.1', 'Option 3.2', 'Option 3.3', 'Option 3.4'],
        correctOptions: 3,
        time: 5,
      ),
    ];
  }
}
