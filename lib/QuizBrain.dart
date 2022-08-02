import 'package:quizapp/Question.dart';

class QuizBrain {
  int _questionNumber = 0;
  List<Question> _questionBank = [
    Question("Founder of Apple is Steve Jobs", true),
    Question("Capital of Pakistan is Karachi", false),
    Question("Old Name of Flutter is Sky.", true),
    Question("Most Landlocked Country is Kazakhstan", true),
    Question("Flutter is free but not open-source.", false),
    Question("Dependencies of flutter is in gradle", false),
    Question("Quiz was invented by Job Daly", true),
    Question(
        "Firebase Database won`t enable you to access and manipulate the cloud database",
        false),
    Question("Popular database package used in the Flutter is Sqflite database",
        true),
    Question("Capital of Poland is Warsaw", true),
    Question("Streams in Flutter can be of five types", false)
  ];
  String getQuestionText() {
    return _questionBank[_questionNumber].questionText;
  }

  bool getQuestionAnswer() {
    return _questionBank[_questionNumber].questionAnswer;
  }

  bool isFinished() {
    if (_questionNumber >= _questionBank.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  void reset() {
    _questionNumber = 0;
  }

  nextQuestion() {
    if (_questionNumber < _questionBank.length - 1) {
      _questionNumber++; //incrementing the question number
    }
  }
}
