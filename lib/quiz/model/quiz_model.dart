class QuizModel {
  String question;
  List answers;
  int correctAnswerIndex;

  QuizModel(
      {required this.question,
      required this.answers,
      required this.correctAnswerIndex});
}

List<QuizModel> getQuizQuestions() {
  return [
    QuizModel(
      question: "What is the capital of France?",
      answers: ["Berlin", "Madrid", "Paris"],
      correctAnswerIndex: 2,
    ),
    QuizModel(
      question: "What is the largest planet in our solar system?",
      answers: ["Earth", "Jupiter", "Mars"],
      correctAnswerIndex: 1,
    ),
    QuizModel(
      question: "Which element has the chemical symbol 'O'?",
      answers: ["Gold", "Oxygen", "Silver"],
      correctAnswerIndex: 1,
    ),
    QuizModel(
      question: "What is the square root of 64?",
      answers: ["6", "7", "8"],
      correctAnswerIndex: 2,
    ),
    QuizModel(
      question: "Who wrote 'Romeo and Juliet'?",
      answers: ["William Shakespeare", "Charles Dickens", "J.K. Rowling"],
      correctAnswerIndex: 0,
    ),
    QuizModel(
      question: "What is the fastest land animal?",
      answers: ["Cheetah", "Lion", "Horse"],
      correctAnswerIndex: 0,
    ),
    QuizModel(
      question: "What is the boiling point of water?",
      answers: ["50°C", "75°C", "100°C"],
      correctAnswerIndex: 2,
    ),
    QuizModel(
      question: "Which planet is known as the Red Planet?",
      answers: ["Earth", "Mars", "Jupiter"],
      correctAnswerIndex: 1,
    ),
    QuizModel(
      question: "How many continents are there on Earth?",
      answers: ["5", "6", "7"],
      correctAnswerIndex: 2,
    ),
    QuizModel(
      question: "Who painted the Mona Lisa?",
      answers: ["Vincent van Gogh", "Leonardo da Vinci", "Claude Monet"],
      correctAnswerIndex: 1,
    ),
  ];
}
