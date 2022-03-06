import 'dart:math';
import 'question.dart';

class QuizBrain {
  int questionNumber = 0;
  int correctButton = 0;
  int correctChoice = 0;
  int beastLength = 0;
  int questionLength = 0;
  String? correctName = '';
  List<int> questionOrder = [];
  List<int> randomBeasts = [];

  QuizBrain() {
    beastLength = getBeastLength();
    questionLength = beastLength - 4 + 1;
    reset();
  }

  final List<Question> beastList = [
    Question(p: 1, a: 'ADDER'),
    Question(p: 2, a: 'ANT QUEEN'),
    Question(p: 3, a: 'BAT'),
    Question(p: 4, a: 'BEAVER'),
    Question(p: 5, a: 'BEE'),
    Question(p: 6, a: 'BLACK GOAT'),
    Question(p: 7, a: 'BLOODHOUND'),
    Question(p: 8, a: 'BULLFROG'),
    Question(p: 9, a: 'CAT'),
    Question(p: 10, a: 'COCKROACH'),
    Question(p: 11, a: 'COYOTE'),
    Question(p: 12, a: 'ELK'),
    Question(p: 13, a: 'ELK FAWN'),
    Question(p: 14, a: 'FIELD MICE'),
    Question(p: 15, a: 'GREAT WHITE'),
    Question(p: 16, a: 'GRIZZLY'),
    Question(p: 17, a: 'KINGFISHER'),
    Question(p: 18, a: 'MANTIS'),
    Question(p: 19, a: 'MOLE'),
    Question(p: 20, a: 'MOOSE BUCK'),
    Question(p: 21, a: 'OPOSSUM'),
    Question(p: 22, a: 'PORCUPINE'),
    Question(p: 23, a: 'PRONGHORN'),
    Question(p: 24, a: 'RABBIT'),
    Question(p: 25, a: 'RATTLER'),
    Question(p: 26, a: 'RAVEN'),
    Question(p: 27, a: 'RIVER OTTER'),
    Question(p: 28, a: 'SKINK'),
    Question(p: 29, a: 'SKUNK'),
    Question(p: 30, a: 'SPARROW'),
    Question(p: 31, a: 'SQUIRREL'),
    Question(p: 32, a: 'TURKEY VULTURE'),
    Question(p: 33, a: 'WOLF'),
    Question(p: 34, a: 'WOLF CUB'),
    Question(p: 35, a: 'WORKER ANT'),
  ];

  void generateList() {
    questionOrder = List<int>.generate(questionLength, (i) => i);
    questionOrder.shuffle();
    randomBeasts = List<int>.generate(beastLength, (i) => i);
  }

  void generateRandomness() {
    correctButton = Random().nextInt(4);
    correctChoice = questionOrder[questionNumber];
    randomBeasts.remove(correctChoice);
    randomBeasts.shuffle();
    randomBeasts.insert(correctButton, correctChoice);
  }

  void reset() {
    questionNumber = 0;
    generateList();
    generateRandomness();
  }
  
  void nextQuestion() {
    if (questionNumber < questionLength - 1) {
      randomBeasts.remove(correctChoice);
      questionNumber++;
      generateRandomness();
    }
  }

  String? getImagePath() {
    return beastList[correctChoice].imagePath;
  }

  int getCorrectButton() {
    return correctButton;
  }

  String? getBeastName() {
    return correctName;
  }
  
  int getBeastLength() {
    return beastList.length;
  }

  int getQuestionLength() {
    return questionLength;
  }

  int getQuestionNumber() {
    return questionNumber;
  }

  List<String?> getChoices() {
    List<String?> choices = List.filled(4, '');
    correctName = beastList[correctChoice].beastName;
    for (int i = 0; i < 4; i++) {
      if (i == correctButton) {
        choices[i] = correctName;
      } else {
        choices[i] = beastList[randomBeasts[i]].beastName;
      }
    }
    return choices;
  }

  bool isFinished() {
    if (questionNumber >= questionLength - 1) {
      return true;
    } else {
      return false;
    }
  }
}
