import 'package:flutter/material.dart';
import 'quiz_page.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'QuizPage !!',
      home: FirstScreen(),
      theme: ThemeData(
        fontFamily: 'HEAVYWEIGHT',
      ),
    ),
  );
}

class FirstScreen extends StatefulWidget {
  FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  final myController = TextEditingController();
  bool _validate = false;
  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/inscryption-screen3.jpg"),
              fit: BoxFit.cover,
              alignment: Alignment.topCenter,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const Expanded(
                flex: 18,
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Center(
                    child: FittedBox(
                      fit: BoxFit.contain,
                      child: Text(
                        'ANOTHER CHALLENGER...\nTELL ME, WHAT\'S YOUR NAME?',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 35.0,
                          color: Color(0xFFee7726),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 40,
                child: SizedBox(height: 0),
              ),
              Expanded(
                flex: 14,
                child: Padding(
                  padding: EdgeInsets.only(left: 50.0, right: 50.0),
                  child: TextField(
                    style: TextStyle(fontSize: 30, height: 1.2),
                    textAlign: TextAlign.center,
                    controller: myController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white54,
                      border: OutlineInputBorder(),
                      hintText: 'Enter your username',
                      errorText: _validate
                          ? 'Your username must include at least one alphabet'
                          : null,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 8,
                child: GestureDetector(
                  onTap: () {
                    if (!myController.text.contains(RegExp('[a-zA-Z]'))) {
                      setState(() {
                        _validate = true;
                      });
                    } else {
                      setState(() {
                        _validate = false;
                      });
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  Quiz_Page(name: myController.text)));
                    }
                  },
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(left: 200.0, right: 200.0),
                          child: Container(
                            padding: EdgeInsets.only(
                              top: 5.0,
                            ),
                            decoration: BoxDecoration(
                                color: Color(0xff994713),
                                border: Border.all(
                                  color: Color(0xff181818),
                                  width: 1.5,
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5))),
                            child: Text(
                              'NEXT',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 30.0,
                                color: Color(0xff000000),
                              ),
                            ),
                            height: 50.0,
                            alignment: Alignment.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 50,
                child: SizedBox(height: 0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
