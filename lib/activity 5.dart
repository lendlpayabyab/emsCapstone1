import 'dart:io';

class Player{
  int score;
  String name;

  Player({
    required this.name,
    required this.score,
  });

  @override
  String toString(){
    return 'Contestant $name has a score of $score';
  }
}

void printQuestion(Map s, int i){
  print(s.keys.elementAt(i));
}

bool isCorrect(Map m, String s, int i){
  if(m.values.elementAt(i) == s){
    return true;
  }
  else{
    return false;
  }
}

void main(){
  print('What is your name?');
  final player1 = Player(name: '', score: 0);
  String? input = stdin.readLineSync();
  if (input != null){
    player1.name = input;
  }
  print('Welcome ${player1.name} to Who Wants to be Hired by FFUF?');
  stdin.readLineSync();
  print('You need to answer all questions\ncorrectly to get hired by FFUF!');
  stdin.readLineSync();
  print('Are you ready to play?');
  stdin.readLineSync();
  player1.score = 0;
  Map<String, String> questions = {
    'Question 1: Features of Dart include the following:\nPrecision, Speed, Tough, Modifiable. T or F?' : 'T',
    'Question 2: The data type of an item or variable is an attribute that\ntells us what kind of data that variable can have. T or F?' : 'T',
    'Question 3: Dart\'s bool type can return \"T\" and \"F\" as its result. T or F?' : 'F',
    'Question 4: Using data types is not preferred when dealing with variables. T or F?' : 'F',
    'Question 5: Dart is a statically typed language. T or F?' : 'T',
    'Question 6: Dart has four core built-in collections. T or F?' : 'F',
    'Question 7: Loops give us the ability to repeat specified blocks of code\nas many times as we want. T or F?' : 'T',
    'Question 8: One of the advantages of using functions is having reduced coding time. T or F?' : 'T',
    'Question 9: Classes are like architectural blueprints that tell\nthe system how to make an object. T or F?' : 'T',
    'Question 10: Dart allows you to make variables private by adding a tilde\(\~\) in front of their name. T or F?' : 'F',
  };

  for(int i = 0; i < 10; i++){
    printQuestion(questions, i);
    String? answer = stdin.readLineSync()?.toUpperCase();
    if (isCorrect(questions, answer!, i)){
      player1.score++;
      if(player1.score < 10) {
        print('Correct! Next question!');
        stdin.readLineSync();
      }
    }
    else {
      print(player1);
      print('You failed to be an hired by FFUF. Better luck next time.');
      player1.score = 0;
      break;
    }
  }

  if(player1.score == 10){
    print('\n\n$player1');
    print('=========================================================================\nCongratulations! Unfortunately, it doesn\'t mean you will get hired \:\(.');
  }
}