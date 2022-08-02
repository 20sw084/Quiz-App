import 'package:flutter/material.dart';
import 'package:quizapp/QuizBrain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() {
  runApp(QuizApp());
}

QuizBrain qb = QuizBrain();

class QuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[900],
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  void checkAnswer(bool userAnswer) {
    bool correctAnswer = qb.getQuestionAnswer();
    setState(() {
      if (qb.isFinished() == true) {
        Alert(
                context: context,
                title: 'Finished',
                desc: 'You have reached the end of Quiz')
            .show();
        qb.reset();
        scoresList = [];
      } else {
        if (userAnswer == correctAnswer) {
          scoresList.add(
            Icon(Icons.check, color: Color.fromARGB(255, 5, 132, 10)),
          );
        } else {
          scoresList.add(
            Icon(Icons.close, color: Colors.red),
          );
        }
        qb.nextQuestion();
      }
    });
  }

  int _counter = 0;
  List<Icon> scoresList = [];
  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        //TODO: Step 3 - Testing
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            flex: 5,
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Center(
                child: Text(
                  qb.getQuestionText(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: FlatButton(
                textColor: Colors.white,
                color: Colors.green,
                onPressed: () {
                  checkAnswer(true);
                },
                child: Text(
                  'True',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: FlatButton(
                textColor: Colors.white,
                color: Colors.red,
                // onPressed: () {},
                onPressed: () {
                  checkAnswer(true);
                },
                child: Text(
                  'False',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),

          //TODO: Add a Row here as your score keeper
          Row(
            children: scoresList,
          )
          // Row(
          //   children: <Widget>[
          //     Expanded(
          //       child: Padding(
          //         padding: EdgeInsets.all(15.0),
          //         child: Text(
          //           'Score: $_counter',
          //           textAlign: TextAlign.center,
          //           style: TextStyle(
          //             fontSize: 25.0,
          //             color: Colors.white,
          //           ),
          //         ),
          //       ),
          //     ),
          //   ],
          // ),
        ]);
  }
}
