import 'dart:math';

class Pokemon {
  late int hitPoints;
  late String name;
  late String type1;
  String? type2;
  late double height;
  late double weight;
  late String sound;

  Pokemon({
    required this.name,
    required this.type1,
    this.type2,
    required this.height,
    required this.weight,
    required this.sound,
  });

  int attack(){
    print('Attack!');
    return(0);
  }

  void cry() => print('$name : Cry! :<');

  @override
  String toString() =>
      'Name: $name\nPrimary Type: $type1\nSecondary Type: ${(type2 == null)? 'None' : type2}\nHeight: $height meters\nWeight: $weight kg\nSound: $sound';
}

class NormalPokemon extends Pokemon {
  NormalPokemon({
    required String name,
    required double height,
    required double weight,
    required String sound,
    String? type2,
  }) : super(
          name: name,
          type1: 'Normal',
          height: height,
          weight: weight,
          sound: sound,
          type2: type2,
        );

  @override
  int attack() {
    print('Body Slam!');
    return 85;
  }

  @override
  void cry() {
    print('$sound!');
  }
}

class GhostPokemon extends Pokemon {
  GhostPokemon({
    required String name,
    required double height,
    required double weight,
    required String sound,
    String? type2,
  }) : super(
          name: name,
          type1: 'Ghost',
          height: height,
          weight: weight,
          sound: sound,
          type2: type2,
        );

  @override
  int attack() {
    print('Shadow Claw!');
    return 70;
  }
  @override
  void cry() {
    print('$sound!');
  }
}

class RockPokemon extends Pokemon {
  RockPokemon({
    required String name,
    required double height,
    required double weight,
    required String sound,
    String? type2,
  }) : super(
          name: name,
          type1: 'Rock',
          height: height,
          weight: weight,
          sound: sound,
          type2: type2,
        );

  @override
  int attack() {
    print('Rock Throw!');
    return 50;
  }
  @override
  void cry() {
    print('$sound!');
  }
}

class DarkPokemon extends Pokemon {
  DarkPokemon({
    required String name,
    required double height,
    required double weight,
    required String sound,
    String? type2,
  }) : super(
          name: name,
          type1: 'Dark',
          height: height,
          weight: weight,
          sound: sound,
          type2: type2,
        );

  @override
  int attack() {
    print('Bite!');
    return 60;
  }
  @override
  void cry() {
    print('$sound!');
  }
}

double dmgMult(Pokemon p1, Pokemon p2){
  double multiplier = 1;
  if(p1.type1 == 'Normal'){
    multiplier = (p2.type1 == 'Rock' || p2.type2 == 'Rock') ? multiplier*0.5
        : (p2.type1 == 'Ghost' || p2.type2 == 'Ghost') ? multiplier*0
        : multiplier*1;
  }
  else if (p1.type1 == 'Ghost'){
    multiplier = (p2.type1 == 'Ghost' || p2.type2 == 'Ghost') ? multiplier*2
        : (p2.type1 == 'Dark' || p2.type2 == 'Dark') ? multiplier*0.5
        : (p2.type1 == 'Normal' || p2.type2 == 'Normal') ? multiplier*0
        : multiplier*1;
  }
  else if (p1.type1 == 'Rock'){
    multiplier = multiplier*1;
  }
  else if (p1.type1 == 'Dark'){
    multiplier = (p2.type1 == 'Ghost' || p2.type2 == 'Ghost') ? multiplier*2
        : (p2.type1 == 'Dark' || p2.type2 == 'Dark') ? multiplier*0.5
        : multiplier*1;
  }
  return multiplier;
}

double stab(Pokemon p1, Pokemon p2){
  if (p1.type1 == p2.type1 || p1.type1 == p2.type2){
    return 1.5;
  }
  else {
    return 1;
  }
}

bool isCritical(){ // set as 6.25% chance to crit
  int random = Random().nextInt(10000);
  //print(random);
  if (random < 625){
    return true;
  }
  else {
    return false;
  }
}

void executeMove(Pokemon p1, Pokemon p2){
  print('\n${p1.name} attacks ${p2.name}!');
  int crit = 1;
  if (isCritical()) {
    crit = 2;
  }
  int damage = (p1.attack() * dmgMult(p1, p2) * stab(p1, p2)).toInt()*crit;
  if (damage == 0) damage = 1;
  if (crit == 2) print('\x1B[33mCritical Hit!\x1B[0m');
  print('${p1.name} dealt $damage damage!');
  p2.hitPoints -= damage;
  if (p2.hitPoints <= 0) {
    p2.hitPoints = 0;
    p2.cry();
  }

  print('${p2.name} is left with ${p2.hitPoints} hit points!');
}

void pokemonBattle(Pokemon p1, Pokemon p2){
  print('\n${p1.name} VS ${p2.name}');
  while (p1.hitPoints > 0 && p2.hitPoints > 0){
    print('\n\n${p1.name}: ${p1.hitPoints} HP');
    print('${p2.name}: ${p2.hitPoints} HP');
    executeMove(p1, p2);
    if (p2.hitPoints > 0) executeMove(p2, p1);
  }

  if (p2.hitPoints > p1.hitPoints) {
    print('\n${p2.name} wins with ${p2.hitPoints} HP left!');
  }
  else {
    print('\n${p1.name} wins with ${p1.hitPoints} HP left!');
  }

}

void main() {
  final NormalPokemon lickitung = NormalPokemon(
    name: 'Lickitung',
    height: 1.2,
    weight: 65.5,
    sound: 'Grulaaaaagh',
  );

  final RockPokemon sudowoodo = RockPokemon(
    name: 'Sudowoodo',
    height: 1.2,
    weight: 38.0,
    sound: 'Sudosudowooodo',
  );

  lickitung.hitPoints = 230;
  sudowoodo.hitPoints = 250;
  print('$lickitung\n');
  print('$sudowoodo\n');

  pokemonBattle(lickitung, sudowoodo);
}
