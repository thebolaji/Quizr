import 'package:flutter/material.dart';
import 'quizr_brain.dart';

QuizBrain quizBrain = QuizBrain();
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
      debugShowCheckedModeBanner: false,
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeper = [];

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
                quizBrain.getFulltext(questionCounter),
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
                setState(() {
                  questionCounter++;
                  bool correctAnswer = quizBrain.getAnswer(questionCounter);
                  if (correctAnswer == true) {
                    scoreKeeper.add(
                      Icon(Icons.check_circle_sharp,
                          size: 30, color: Colors.green),
                    );
                  } else {
                    scoreKeeper.add(
                      Icon(Icons.cancel, size: 30, color: Colors.red),
                    );
                  }
                });
              },
            ),
          ),
        ),
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
                setState(() {
                  questionCounter++;
                  bool correctAnswer2 = quizBrain.getAnswer(questionCounter);
                  if (correctAnswer2 == false) {
                    scoreKeeper.add(
                      Icon(Icons.cancel, size: 30, color: Colors.red),
                    );
                  } else {
                    scoreKeeper.add(
                      Icon(Icons.check_circle_sharp,
                          size: 30, color: Colors.green),
                    );
                  }
                });
              },
            ),
          ),
        ),
        Expanded(
          child: Wrap(
              direction: Axis.horizontal, // we need to specify the direction
              children: scoreKeeper),
        )
      ],
    );
  }
}
