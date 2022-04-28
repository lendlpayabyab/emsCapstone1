class Pokemon {
  late final String name;
  late final String type;
  late final String element;
  late final double height;
  late final double weight;
  late final String sound;
  late final String move;

  Pokemon({
    required this.name,
    required this.type,
    required this.element,
    required this.height,
    required this.weight,
    required this.sound,
  });

  void cry() {
    print('$sound!');
  }

  void attack() {
    print('$move!');
  }

  @override
  String toString() =>
      'Name: $name\nType: $type\nElement: $element\nHeight: $height m\nWeight: $weight kg\nSound: $sound\n';
}

class Book {
  late final String name;
  late final int iSBN;
  late final String author;
  late final String publisher;

  Book({
    required this.name,
    required this.iSBN,
    required this.author,
    required this.publisher,
  });

  String getBookInfo() {
    return '\nName: $name | ISBN: $iSBN | Author: $author | Publisher: $publisher\n';
  }
}

class SavingsAccount {
  static late double annualInterestRate;
  late double _savingsBalance;

  SavingsAccount({required double savingsBalance})
      : _savingsBalance = savingsBalance;

  void calculateMonthlyInterest() {
    double interest = _savingsBalance * annualInterestRate / 12;
    String interestString = interest.toStringAsFixed(2);
    _savingsBalance += double.parse(interestString);
  }

  static void modifyInterestRate({required double newInterestRate}){
    annualInterestRate = newInterestRate;
    print('Annual interest rate is set to ${annualInterestRate*100}\%');
  }

  @override
  String toString() => 'Savings account has \$$_savingsBalance in it.';
}

void bookTest(List<Book> b) {
  for (int i = 1; i <= 30; i++) {
    b.add(Book(
        name: 'Book $i',
        iSBN: 1000000000 + i,
        author: 'Author $i',
        publisher: 'Publisher $i'));
  }
}

void main() {
  final Pokemon blastoise = Pokemon(
      name: 'Blastoise',
      type: 'Shellfish',
      element: 'Water',
      height: 1.6,
      weight: 85.5,
      sound: 'Blaaaaaaagh');

  final Pokemon tangela = Pokemon(
      name: 'Tangela',
      type: 'Vine',
      element: 'Grass',
      height: 1.0,
      weight: 35.0,
      sound: 'Ukyaaaaaa');

  final Pokemon mew = Pokemon(
      name: 'Mew',
      type: 'New Species',
      element: 'Psychic',
      height: 0.4,
      weight: 4.0,
      sound: 'mewww');

  print(blastoise);
  print(tangela);
  print(mew);

  final List<Book> sample = [];
  bookTest(sample);
  for (var element in sample) {
    print(element.getBookInfo());
  }

  SavingsAccount saver1 = SavingsAccount(savingsBalance: 2000);
  SavingsAccount saver2 = SavingsAccount(savingsBalance: 3000);
  print('Saver1\'s $saver1');
  print('Saver2\'s $saver2');

  SavingsAccount.modifyInterestRate(newInterestRate: 0.04);

  saver1.calculateMonthlyInterest();
  saver2.calculateMonthlyInterest();
  print('Saver1\'s $saver1');
  print('Saver2\'s $saver2');
  SavingsAccount.modifyInterestRate(newInterestRate: 0.05);
  saver1.calculateMonthlyInterest();
  saver2.calculateMonthlyInterest();
  print('Saver1\'s $saver1');
  print('Saver2\'s $saver2');
}
