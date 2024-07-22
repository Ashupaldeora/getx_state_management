import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_state_management/quiz/controller/quiz_controller.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    QuizController quizController = Get.put(QuizController());
    return Scaffold(
      backgroundColor: Color(0xff252C4A),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Obx(
          () => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 100,
              ),
              (quizController.consecutiveWrongAnswers >= 3)
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                            onPressed: () {
                              quizController.consecutiveWrongAnswers.value = 0;
                              quizController.currentQuiz.value = 0;
                            },
                            child: Text(
                              "Restart",
                              style: TextStyle(color: Colors.white),
                            ))
                      ],
                    )
                  : SizedBox(),
              Row(
                children: [
                  Text(
                    "Question ${quizController.currentQuiz.value + 1}",
                    style: TextStyle(
                        color: Color(
                          0xff959EC6,
                        ),
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "/10",
                    style: TextStyle(
                        color: Color(0xff6F779D),
                        fontWeight: FontWeight.w500,
                        fontSize: 17),
                  ),
                ],
              ),
              Divider(),
              SizedBox(
                height: 20,
              ),
              Text(
                quizController.quiz[quizController.currentQuiz.value].question,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 30),
              ),
              Spacer(),
              Obx(
                () => ListView.builder(
                  shrinkWrap: true,
                  itemCount: quizController
                      .quiz[quizController.currentQuiz.value].answers.length,
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () {
                      quizController.updateIndex(index);
                    },
                    child: Obx(
                      () => Container(
                        padding: EdgeInsets.only(left: 20),
                        margin: EdgeInsets.only(bottom: 20),
                        height: 70,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                                color: (quizController.value.value == index)
                                    ? Colors.green
                                    : Color(
                                        0xff224668,
                                      ),
                                width: 3)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              quizController
                                  .quiz[quizController.currentQuiz.value]
                                  .answers[index],
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Spacer(),
              Center(
                child: GestureDetector(
                  onTap: () {
                    quizController.nextQuestion();
                  },
                  child: Container(
                    height: 70,
                    width: 180,
                    margin: EdgeInsets.only(bottom: 30),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(50)),
                    child: Text(
                      "Next",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
