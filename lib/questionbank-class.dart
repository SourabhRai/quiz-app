import 'Question-class.dart';

class Quizbrain {
  List<Question> _questionbank = [
    Question( 'my name is sourabh rai', true),
    Question('I am 21 years old', false),
    Question("I love cricket", true),
  ];
  int i = 0;
  String getquestion() {
    return _questionbank[i].questiontext;
  }

  bool getanswer() {
    return _questionbank[i].answer;
  }

  void nextquestion() {
    if (i < _questionbank.length - 1) i++;
  }

  bool isfinished() {
    if (i == _questionbank.length - 1) {
      return true;
    } else
      return false;
  }

  void reset() {
    i = 0;
  }
}
