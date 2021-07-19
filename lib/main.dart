import 'package:flutter/material.dart';
//import 'Question-class.dart';
import 'questionbank-class.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

Quizbrain quiz = Quizbrain();
void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  // List<String> questions = [
  //   "my name is sourabh rai",
  //   "I am 21 years old",
  //   "I love cricket",
  // ];
  // List<bool> answers = [
  //   true,
  //   false,
  //   true,
  // ];
  // question q1 = question(q: "this is a question", a: true);
  List<Widget> scoreKeeper = [];
  void checkanswer(bool useranswer) {
    if (useranswer == quiz.getanswer()) {
      scoreKeeper.add(
        Icon(
          Icons.check,
          color: Colors.green,
        ),
      );
    } else {
      scoreKeeper.add(
        Icon(
          Icons.close,
          color: Colors.red,
        ),
      );
    }
    setState(
      () {
        //quiz.questionbank[i].answer = true;
        quiz.nextquestion();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quiz.getquestion(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ), //question
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.green,
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                if (quiz.isfinished()) {
                  Alert(
                    context: context,
                    type: AlertType.error,
                    title: "Quiz is over.",
                    desc: "Click OK to restart the quiz.",
                    buttons: [
                      DialogButton(
                          child: Text(
                            "OK",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          onPressed: () {
                            // Navigator.pop(context),
                            setState(() {
                              quiz.reset();
                              scoreKeeper = [];
                            });
                          }
                          //  width: 120,
                          )
                    ],
                  ).show();
                }
                checkanswer(true);
              },
            ),
          ),
        ), //true
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.red,
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                if (quiz.isfinished()) {
                  Alert(
                    context: context,
                    type: AlertType.error,
                    title: "Quiz Over !",
                    desc: "Quiz is over ,Click below to restart.",
                    buttons: [
                      DialogButton(
                          child: Text(
                            "Restart Quiz.",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          onPressed: () {
                            setState(() {
                              quiz.reset();
                              scoreKeeper = [];
                            });
                          }
                          //  width: 120,
                          )
                    ],
                  ).show();
                }
                checkanswer(false);
              },
            ),
          ),
        ), //false
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: scoreKeeper,
          ),
        ), //row telling about tick and cross
        //TODO: Add a Row here as your score keeper
      ],
    );
  }
}
// scoreKeeper.add(
// Icon(
// Icons.check,
// color: Colors.green,
// ),
// );
/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/
