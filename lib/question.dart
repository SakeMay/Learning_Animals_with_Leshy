class Question {
  String? imagePath;
  String? beastName;

  Question({int? p,String? a}) {
    imagePath = 'images/cards/card-$p.png';
    beastName = a;
  }
}