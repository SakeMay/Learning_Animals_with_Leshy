import 'package:flutter/material.dart';
import 'quiz_brain.dart';
import 'result_page.dart';
import 'fail_page.dart';

QuizBrain quizBrain = QuizBrain();

class Quiz_Page extends StatelessWidget {
  Quiz_Page({required this.name});
  final String name;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'HEAVYWEIGHT',
      ),
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/inscryption_background.jpg"),
                fit: BoxFit.cover,
                alignment: Alignment.topCenter,
              ),
            ),
            child: QuizPage(name: name),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({required this.name, Key? key}) : super(key: key);
  final String name;

  @override
  _QuizPageState createState() => _QuizPageState(name: name);
}

class _QuizPageState extends State<QuizPage> {
  _QuizPageState({required this.name});
  final String name;
  List<Icon> scoreKeeper = [];
  int totalScore = 0;
  int failure = 0;

  void checkAnswer(int userButton) {
    int correctButton = quizBrain.getCorrectButton();
    setState(() {
      if (quizBrain.isFinished()) {
        if (correctButton == userButton) {
          totalScore++;
          if (failure > 0) failure--;
          scoreKeeper.add(const Icon(
            Icons.check,
            color: Colors.green,
          ));
        } else {
          failure++;
          scoreKeeper.add(const Icon(
            Icons.close,
            color: Colors.red,
          ));
        }
        if (failure < 3) {
          quizBrain.reset();
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      ResultPage(score: totalScore, name: name)));
        }
      } else {
        if (correctButton == userButton) {
          totalScore++;
          if (failure > 0) failure--;
          scoreKeeper.add(const Icon(
            Icons.check,
            color: Colors.green,
          ));
          quizBrain.nextQuestion();
        } else {
          failure++;
          scoreKeeper.add(const Icon(
            Icons.close,
            color: Colors.red,
          ));
          quizBrain.nextQuestion();
        }
      }
      if (failure >= 3) {
        quizBrain.reset();
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => FailPage(score: totalScore, name: name)));
      }
    });
  }

  int value = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Center(
                    child: Text(
                      'SCORE : $totalScore',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 40.0,
                        color: Color(0xFFee7726),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Center(
                    child: Text(
                      'FAILURE : $failure / 3',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 40.0,
                        color: Color(0xFFee7726),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Image.asset(
                '${quizBrain.getImagePath()}',
              ),
            ),
          ),
        ),
        Expanded(
          child: Row(
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Color(0xFF687257)),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      child: Text(
                        '${quizBrain.getChoices()[0]}',
                        style: TextStyle(
                          color: Color(0xFFc5d7a1),
                          fontSize: 30.0,
                        ),
                      ),
                    ),
                    onPressed: () {
                      checkAnswer(0);
                    },
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Color(0xffa82430)),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      child: Text(
                        '${quizBrain.getChoices()[1]}',
                        style: TextStyle(
                          color: Color(0xFF000000),
                          fontSize: 30.0,
                        ),
                      ),
                    ),
                    onPressed: () {
                      checkAnswer(1);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Row(
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Color(0xFF046AAF)),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      child: Text(
                        '${quizBrain.getChoices()[2]}',
                        style: TextStyle(
                          color: Color(0xFF17C0D1),
                          fontSize: 30.0,
                        ),
                      ),
                    ),
                    onPressed: () {
                      checkAnswer(2);
                    },
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Color(0xFF19B268)),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      child: Text(
                        '${quizBrain.getChoices()[3]}',
                        style: TextStyle(
                          color: Color(0xFF1D3925),
                          fontSize: 30.0,
                        ),
                      ),
                    ),
                    onPressed: () {
                      checkAnswer(3);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
        Wrap(
          direction: Axis.horizontal,
          children: scoreKeeper,
        ),
      ],
    );
  }
}
