import 'package:flutter/material.dart';
import 'quiz_brain.dart';
import 'main.dart';

QuizBrain quizBrain = QuizBrain();

class FailPage extends StatelessWidget {
  FailPage({required this.score, required this.name});
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
                  "images/inscryption-screen2.jpg"),
              fit: BoxFit.cover,
              alignment: Alignment.topCenter,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 8,
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Center(
                    child: FittedBox(
                      fit: BoxFit.contain,
                      child: Text(
                        'HOW DISAPPOINTING... ONLY $score OUT OF ${quizBrain.getQuestionLength()}',
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
                flex: 55,
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
                        'Ending 1 of 3 : Bad Ending',
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
