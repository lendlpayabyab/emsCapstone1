import 'dart:math';

/*
class A {
  int? _private;
  int? a;
  int b = 1;

  final int c = 2;
  late int d;
  late final int e;
  static int f = 6;
  static late int g;
  static late int h = 32;
}

class B {
  final int xCoord;
  final int yCoord;

  //default constructor
  B.name({
    required this.xCoord,
    required this.yCoord,
  });

  B.zero()
      : xCoord = 0,
        yCoord = 0;

  B.fromJson({required Map<String, int> json})
    : xCoord = json['x']!,
      yCoord = json['y']!;
}

class Point{
  final int xCoord;
  final int yCoord;

  Point({
    required this.xCoord,
    required this.yCoord,
  });

  @override
  String toString() => ('x \= $xCoord, y \= $yCoord');

  factory Point.random({required bool isPositive}){
    int minNegative = -99;
    int maxNegative = -1;
    int minPositive = 0;
    int maxPositive = 99;

    return isPositive ? Point(xCoord: randomInt(minPositive, maxPositive), yCoord: randomInt(minPositive, maxPositive))
      : Point(xCoord: randomInt(minNegative, maxNegative), yCoord: randomInt(minNegative, minPositive));
  }

  static double distance(Point p1, Point p2){
    int dx = p1.xCoord - p2.xCoord;
    int dy = p1.yCoord - p2.yCoord;
    return (sqrt(pow(dx, 2) + pow(dy, 2)));
  }

  Point.midpoint(Point p1, Point p2) : this(xCoord: (p1.xCoord+p2.xCoord)~/2, yCoord: (p1.yCoord+p2.yCoord)~/2);
}

int randomInt (int min, int max){
  return (min + Random().nextInt(max - min));
}

int fibonacci(int n) {
  if (n == 0 || n == 1) return n;
  return fibonacci(n - 1) + fibonacci(n - 2);
}

void main() {
/*
  print('hello world');
  print(fibonacci(5));

  var test = A();
  print('test.a -> ${test.a}');
  print('test.b -> ${test.b}');
  print('test.c -> ${test.c}');
  test.d = 8;
  print('test.d -> ${test.d}');
  test.e = 69;
  //test.e = 2;
  print('test.e -> ${test.e}');
  print('A.f -> ${A.f}');
  A.g = 420;
  print('A.g -> ${A.g}');
  print('A.h -> ${A.h}');
  */

  final p1 = Point.random(isPositive: false);
  final p2 = Point.random(isPositive: true);
  final p3 = Point.midpoint(p1, p2);
  print('point 1 is: $p1');
  print('point 2 is: $p2');
  print('their distance is: ${Point.distance(p1, p2)}');
  print('the approximate midpoint of p1 and p2 is $p3');
}
*/

//inheritance
//encapsulation
//polymorphism
//abstraction

///inheritance
/*
class Animal{
  final String name;
  Animal({required this.name});

  void whatAmI() => print('I am an animal');
  void chase(Animal a){}
}

class Bird extends Animal {
  Bird({required String name}) : super(name: name);

  void fly() => print('can fly');
}

class Duck extends Bird{
  Duck({required String name}) : super(name: name);

  void swim() => print('can swim');

  ///polymorphism
  @override
  void whatAmI() {
    print('I am a duck');
  }
}

class Mouse extends Animal{
  Mouse({required String name}) : super(name: name);
}

class Cat extends Animal{
  Cat({required String name}) : super(name: name);
  @override
  void chase(covariant Mouse a) {}
}

void main(){
  Duck duck1 = Duck(name: 'Ducky');
  Bird bird1 = Bird(name: 'Birdy');
  print(duck1.name);
  duck1.whatAmI();
  duck1.fly();
}
*/

///abstraction
/*
abstract class UserRepositoryInterface{
  late final List<int> userList;

  //abstract method
  void create();
  List<int> read();
  void update();
  void delete();
}

class UserRepository implements UserRepositoryInterface{

  @override
  late List<int> userList;

  @override
  void create() {
    // TODO: implement create
  }

  @override
  void delete() {
    // TODO: implement delete
  }

  @override
  List<int> read() {
    // TODO: implement read
    throw UnimplementedError();
  }

  @override
  void update() {
    // TODO: implement update
  }

}

class A{
  void methodA(){

  }
}

class B{
  void methodB(){

  }
}

class C{
  void methodC(){

  }
}

class D implements A, B, C{
  @override
  void methodA() {
    // TODO: implement methodA
  }

  @override
  void methodB() {
    // TODO: implement methodB
  }

  @override
  void methodC() {
    // TODO: implement methodC
  }

}

abstract class Animal{
  late int age;
  late String name;

  void talk();
  void growl() => print('Grrrrr!');
}

class Cat implements Animal{
  @override
  late int age;

  @override
  late String name;

  Cat({
    required this.name,
    required this.age,
  });

  @override
  void growl() {
    // TODO: implement growl
  }

  @override
  void talk() {
    print('Meow!');
  }

}

class Dog implements Animal{
  @override
  late int age;

  @override
  late String name;

  Dog({
    required this.name,
    required this.age,
  });

  @override
  void growl() {
    // TODO: implement growl
  }

  @override
  void talk() {
    print('Woof!');
  }

}

void main(){
  final cat1 = Cat(name: 'Ming', age: 69);
  final dog1 = Dog(name: 'Bantay', age: 420);

  cat1.talk();
  cat1.growl();
  dog1.talk();
  dog1.growl();
}
 */

abstract class Animal {
  bool isAlive = true;
  void eat();
  void move();

  @override
  String toString() => 'i am a $runtimeType';
}

class Platypus extends Animal{
  @override
  void eat() {
    print('Munch Munch');
  }

  @override
  void move() {
    print('Glide Glide');
  }

  void layEggs(){
    print('Plop Plop');
  }

}

void main(){
  final platypus = Platypus();
  print(platypus.isAlive);
  platypus.eat();
  platypus.move();
  platypus.layEggs();
  print(platypus);
}