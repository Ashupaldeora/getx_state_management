import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/quiz_model.dart';

class QuizController extends GetxController {
  RxList<QuizModel> quiz = <QuizModel>[].obs;
  RxInt value = 4.obs, currentQuiz = 0.obs, selectedAnswerIndex = (-1).obs;
  var consecutiveWrongAnswers = 0.obs;
  var score = 0.obs;

  QuizController() {
    var questions = getQuizQuestions();
    quiz.addAll(questions);
    print(quiz);
  }

  void updateIndex(int index) {
    value.value = index;
    selectedAnswerIndex.value = index;
  }

  void nextQuestion() {
    value.value = 4;
    if (selectedAnswerIndex.value ==
        quiz[currentQuiz.value].correctAnswerIndex) {
      // Correct answer
      score.value++;
      consecutiveWrongAnswers.value = 0;
    } else {
      // Wrong answer
      consecutiveWrongAnswers.value++;
    }

    if (consecutiveWrongAnswers.value >= 3) {
      // End quiz due to 3 consecutive wrong answers
      Get.snackbar(
        'Quiz Ended',
        'You attempted 3 wrong answers continuously!',
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        margin: EdgeInsets.all(10),
        borderRadius: 10,
        duration: Duration(seconds: 3),
      );
    } else if (currentQuiz.value < quiz.length - 1) {
      // Move to next question
      currentQuiz.value++;
      selectedAnswerIndex.value = -1;
    } else {
      // Quiz is finished, show results
      Get.snackbar(
        'Quiz Completed',
        'You have completed the quiz! Your score is ${score.value}/${quiz.length}',
        backgroundColor: Colors.green,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        margin: EdgeInsets.all(10),
        borderRadius: 10,
        duration: Duration(seconds: 3),
      );
    }
  }
}
