import 'package:flutter/material.dart';
import 'quiz_brain.dart';
import 'main.dart';

QuizBrain quizBrain = QuizBrain();

class ResultPage extends StatelessWidget {
  ResultPage({required this.score, required this.name});
  final int score;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                  "images/inscryption-screen${score == quizBrain.getQuestionLength() ? '5' : '4'}.jpg"),
              fit: BoxFit.cover,
              alignment: Alignment.topCenter,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 11,
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Center(
                    child: FittedBox(
                      fit: BoxFit.contain,
                      child: Text(
                        '${score >= quizBrain.getQuestionLength() ? 'Magnificent, $name,\nyou guessed all ${quizBrain.getQuestionLength()} beasts correctly' : 'Great... $name,\nYou guessed it right $score out of ${quizBrain.getQuestionLength()} beasts'}',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 40.0,
                          color: Color(0xffee7726),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 52,
                child: SizedBox(
                  height: 0,
                ),
              ),
              Expanded(
                flex: 7,
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Center(
                    child: FittedBox(
                      fit: BoxFit.contain,
                      child: Text(
                        '${score == quizBrain.getQuestionLength() ? 'Ending 3 of 3 : Real Ending' : 'Ending 2 of 3 : True? Ending'}',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 40.0,
                          color: Color(0xFF687257),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => FirstScreen()));
                },
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(
                          top: 5.0,
                        ),
                        child: const Text(
                          'PLAY AGAIN?',
                          style: TextStyle(
                            fontSize: 30.0,
                            color: Color(0xFFc5d7a1),
                          ),
                        ),
                        color: Color(0xFF687257),
                        height: 50.0,
                        alignment: Alignment.center,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
