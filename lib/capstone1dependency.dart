export 'dart:io';
import 'dart:io';
import 'package:untitled/capstone1.dart';

class Person {
  late String firstName;
  late String lastName;
  late String email;
  late final String _username;
  late String _password;
  late String accountType;

  Person({
    required this.firstName,
    required this.lastName,
    required this.email,
    required String username,
    required String password,
    required this.accountType,
  })  : _password = password,
        _username = username;

  @override
  String toString() =>
      '$firstName $lastName $email $_username $_password $accountType';
}

class Leaves {
  late final String email;
  late final DateTime start;
  late final DateTime end;
  late final String description;
  late String status;

  Leaves({
    required this.email,
    required this.start,
    required this.end,
    required this.description,
    this.status = 'Pending',
  });

  @override
  String toString() =>
      'Email: $email | Description: $description | Period: ${start.toString().substring(0, 10)} to ${end.toString().substring(0, 10)} | Status: $status';
}

class Salary {
  late final String email;
  late final int month;
  late final int year;
  late final double amount;

  Salary({
    required this.email,
    required this.month,
    required this.year,
    required this.amount,
  });

  @override
  String toString() =>
      'Email: $email | Month: $month | Year: $year | Amount: $amount';
}

class Admin extends Person {
  Admin({
    required String firstName,
    required String lastName,
    required String email,
    required String username,
    required String password,
  })  : assert(username.isNotEmpty),
        assert(password.length > 3),
        super(
          firstName: firstName,
          lastName: lastName,
          email: email,
          username: username,
          password: password,
          accountType: 'Administrator',
        );
}

class User extends Person {
  String? gender;
  String? birthday;
  String? address;
  String? department;
  int? contactNumber;

  User({
    required String firstName,
    required String lastName,
    required String email,
    required String username,
    required String password,
    this.department,
    this.birthday,
    this.address,
    this.contactNumber,
    this.gender,
  })  : assert(username.isNotEmpty),
        assert(password.length > 3),
        super(
          firstName: firstName,
          lastName: lastName,
          email: email,
          username: username,
          password: password,
          accountType: 'User',
        );

  void showDetails() {
    print('Username: $_username');
    print('Email: $email');
    print('\nName: $firstName $lastName');
    print((gender != null) ? 'Gender: $gender' : 'Gender: -');
    print((birthday != null) ? 'Birthday: $birthday' : 'Birthday: -');
    print((address != null) ? 'Address: $address' : 'Address: -');
    print((contactNumber != null)
        ? 'Contact number: $contactNumber'
        : 'Contact number: -');
    print((department != null) ? 'Department: $department' : 'Department: -');
  }

  String get getUserName {
    return _username;
  }

  @override
  String toString() => 'Name: $firstName $lastName | Email: $email';
}

List<Admin> admin = [
  Admin(
    firstName: 'Lendl',
    lastName: 'Payabyab',
    email: 'lendl.payabyab@gmail.com',
    username: 'lendl',
    password: '1234',
  )
];

List<User> users = [];
List<Leaves> leaves = [];
List<Salary> salaries = [];

bool _passwordCheck(Person person, String username, String password) {
  if (person._password == password && person._username == username) {
    return true;
  }
  return false;
}

String loginSequence(List<Admin> admin, List<User> users) {
  bool proceedLogin = false;
  String? username;
  String? password;

  while (!proceedLogin) {
    String? userInput = '';
    print('\nEnter username:');
    username = stdin.readLineSync();
    print('Enter password:');
    password = stdin.readLineSync();

    for (var element in admin) {
      proceedLogin = _passwordCheck(element, username!, password!);
      if (proceedLogin) {
        return 'Administrator';
      }
    }
    for (var element in users) {
      proceedLogin = _passwordCheck(element, username!, password!);
      if (proceedLogin) {
        return username;
      }
    }
    if (!proceedLogin) {
      print('Username and Password combination does not exist!');
      while (
          userInput!.toUpperCase() != 'Y' && userInput.toUpperCase() != 'N') {
        print('Try logging in again? Y or N?');
        userInput = stdin.readLineSync();
        //clearConsole();
        if (userInput!.toUpperCase() == 'Y') {
          proceedLogin = false;
        } else if (userInput.toUpperCase() != 'N') {
          print('Invalid input!');
        } else {
          proceedLogin = true;
        }
      }
    }
  }
  return 'Goodbye';
}

void addUser(List<User> user) {
  bool userAlreadyExists = false;
  print('Adding new User');
  print('Enter first name:');
  String? firstName = stdin.readLineSync();
  print('Enter last name:');
  String? lastName = stdin.readLineSync();
  print('Enter Email address:');
  String? email = stdin.readLineSync();
  print('Enter username:');
  String? username = stdin.readLineSync();
  while (username == null || username.contains(' ')) {
    print('Invalid input. Enter valid username(cannot contain spaces):');
    username = stdin.readLineSync();
  }
  print('Enter password:');
  String? password = stdin.readLineSync();
  while (password == null || password.length < 4) {
    print(
        'Invalid input. Password must be at least 4 characters long. Enter valid password:');
    password = stdin.readLineSync();
  }

  for (var element in user) {
    if (username == element._username || email == element.email) {
      userAlreadyExists = true;
      break;
    }
  }

  if (userAlreadyExists) {
    print('Failed Operation: Username and/or Email already taken.');
  } else {
    user.add(User(
        firstName: firstName!,
        lastName: lastName!,
        email: email!,
        username: username,
        password: password));
    print('\nSuccessfully added ${user.last}\n');
    print('Press enter to continue..');
    stdin.readLineSync();
  }
}

void _removeUser(List<User> user, int index, List<Leaves> leaves) {
  print('\nSuccessfully removed ${user[index]}\n');
  leaves.removeWhere((element) => element.email == user[index].email);
  user.remove(user[index]);
  print('Press enter to continue..');
  stdin.readLineSync();
}

void _addSalary(List<Salary> salary, List<User> user) {
  bool accountExists = false;
  int? year;
  double? amount;
  String? userInput;
  print('\nAdding new salary entry');
  print('Enter email:');
  String? email = stdin.readLineSync();
  print('Enter month:');
  int? month = inputInteger(2, 1, 31);
  print('Enter year:');
  year = inputInteger(4, 2022);
  if (userInput != null) {
    year = int.parse(userInput);
  }
  print('Enter amount:');
  userInput = stdin.readLineSync();
  if (userInput != null) {
    amount = double.parse(userInput);
  }

  for (var element in user) {
    if (email == element.email) {
      accountExists = true;
    }
  }
  if (accountExists) {
    salary.add(
        Salary(email: email!, month: month!, year: year!, amount: amount!));
    print('Successfully added entry: [${salary.last}]');
  } else {
    print('User does not exist. Please try again.');
  }

  print('Press enter to continue..');
  stdin.readLineSync();
}

void _addLeave(List<Leaves> leaves, String session, List<User> users, [User? user]) {
  bool accountExists = false;
  List<String> statusChoices = ['Pending', 'Approved', 'Rejected'];
  int? status, day, month, year;
  String? email;
  //clearConsole();
  String? userInput;
  DateTime start = DateTime(2, 2, 2);
  DateTime end = DateTime(1, 1, 1);
  print('\nAdding new Leave entry.\n');
  if (session == 'Administrator') {
    print('Enter email:');
    email = stdin.readLineSync();
  } else {
    email = user?.email;
  }

  for (var element in users) {
    if (email == element.email) {
      accountExists = true;
    }
  }

  if (accountExists) {
    print('Enter description:');
    String? description = stdin.readLineSync();

    while (start.compareTo(DateTime.now()) < 1) {
      print('Enter start date (day: DD):');
      day = inputInteger(2, 1, 31);
      print('Enter start date (month: MM):');
      month = inputInteger(2, 1, 12);
      print('Enter start date (year: YYYY):');
      year = inputInteger(4);
      start = DateTime(year!, month!, day!);

      if (start.compareTo(DateTime.now()) < 1) {
        print(
            'Invalid start date. Can only start one day after day of request. Try again.');
      }
    }

    while (end.compareTo(start) < 0) {
      print('Enter end date (day: DD):');
      day = inputInteger(2, 1, 31);
      print('Enter end date (month: MM):');
      month = inputInteger(2, 1, 12);
      print('Enter end date (year: YYYY):');
      year = inputInteger(4);
      end = DateTime(year!, month!, day!);

      if (end.compareTo(start) < 0) {
        print(
            'Invalid end date. Cannot enter date before start date. Try again.');
      }
    }

    leaves.add(Leaves(
        email: email!, start: start, end: end, description: description!));

    if (session == 'Administrator') {
      print('Status?\n1. Pending\n2. Approved\n3. Rejected');
      userInput = stdin.readLineSync();
      if (userInput != null) {
        status = int.parse(userInput);
      }
      leaves.last.status = statusChoices[status! - 1];
    } else {
      leaves.last.status = 'Pending';
    }

    print('Successfully added an entry in Leaves: [${leaves.last}]');
  } else {
    print('User does not exist. Please try again');
  }

  print('Press enter to continue..');
  stdin.readLineSync();
}

void _viewUsers(List<User> user, List<Leaves> leaves) {
  bool isOnPage = true;
  String? userInput;
  String? userInput2;
  int? index;
  while (isOnPage) {
    //clearConsole();
    int i = 1;
    print('\nUsers in database:\n');
    if (user.isNotEmpty) {
      for (var element in user) {
        print('${i++}.) Username: ${element._username} | $element');
      }
      print('\nWhat would you like to do?\n'
          '1. Edit entry\n'
          '2. Delete entry\n'
          '3. Go back');
      userInput = stdin.readLineSync();

      if (userInput == '3') {
        isOnPage = false;
      } else if (userInput == '2') {
        print('Please select User number to delete.');
        userInput2 = stdin.readLineSync();
        if (userInput2 != null) {
          index = int.parse(userInput2) - 1;
        }
        if (index! + 1 >= i) {
          print('Please enter valid input');
        } else {
          _removeUser(user, index, leaves);
        }
      } else if (userInput == '1') {
        print('Please select User number to edit.');
        userInput2 = stdin.readLineSync();
        if (userInput2 != null) {
          index = int.parse(userInput2) - 1;
        }
        if (index! + 1 >= i) {
          print('Please enter valid input');
        } else {
          _editUser(user, index);
        }
      } else {
        print('Please enter valid input.');
      }
    } else {
      print('\nNothing to show here. Going back...');
      isOnPage = false;
    }
  }
}

void _editUser(List<User> user, int index) {
  bool isOnPage = true;
  String? userInput;
  while (isOnPage) {
    //clearConsole();
    print('\nEdit current User: ${user[index]._username}\n');
    user[index].showDetails();
    print('\nWhich entry would you like to edit?\n'
        '1. Name\n'
        '2. Gender\n'
        '3. Birthday\n'
        '4. Address\n'
        '5. Contact number\n'
        '6. Department\n'
        '7. Go back..');
    userInput = stdin.readLineSync();
    switch (userInput) {
      case '7':
        {
          isOnPage = false;
          break;
        }
      case '1':
        {
          print('Enter new First name:');
          userInput = stdin.readLineSync();
          user[index].firstName = userInput!;
          print('Enter new Last name:');
          userInput = stdin.readLineSync();
          user[index].lastName = userInput!;
          break;
        }
      case '2':
        {
          print('Enter new Gender:');
          userInput = stdin.readLineSync();
          user[index].gender = userInput!;
          break;
        }
      case '3':
        {
          print('Enter new Birthday:');
          userInput = stdin.readLineSync();
          user[index].birthday = userInput!;
          break;
        }
      case '4':
        {
          print('Enter new Address:');
          userInput = stdin.readLineSync();
          user[index].address = userInput!;
          break;
        }
      case '5':
        {
          print('Enter new Contact number:');
          userInput = stdin.readLineSync();
          user[index].contactNumber = int.parse(userInput!);
          break;
        }
      case '6':
        {
          print('Enter new Department:');
          userInput = stdin.readLineSync();
          user[index].department = userInput!;
          break;
        }
      default:
        {
          print('Please enter valid input.');
          break;
        }
    }
  }
}

void _manageLeaves(List<Leaves> leaves) {
  List<String> statusChoices = ['Pending', 'Approved', 'Rejected'];
  bool isOnPage = true;
  String? userInput;
  int? index1;
  int? index2;
  while (isOnPage) {
    //clearConsole();
    int i = 1;
    if (leaves.isNotEmpty) {
      print('\nLeaves:\n');
      for (var element in leaves) {
        print('${i++}.) $element');
      }
      print('$i.) Go back..');
      print('\nWhich entry would you like to change status?\n');
      userInput = stdin.readLineSync();
      index1 = int.parse(userInput!);
      if (index1 == i) {
        isOnPage = false;
      } else if (index1 < i) {
        print(
            'Change status or delete entry?\n1. Pending\n2. Approved\n3. Rejected\n4. Delete');
        userInput = stdin.readLineSync();
        index2 = int.parse(userInput!);
        if (index2 == 4) {
          leaves.removeAt(index1 - 1);
        } else {
          leaves[index1 - 1].status = statusChoices[index2 - 1];
        }
      } else {
        print('Please enter valid input.');
      }
    } else {
      print('\nNothing to show here.');
      print('Press enter to continue..');
      stdin.readLineSync();
      isOnPage = false;
    }
  }
}

int? inputInteger(int digits, [int? min, int? max]) {
  String? userInput;
  int? value;
  min ??= -99999999999999;
  max ??= 99999999999999;
  userInput = stdin.readLineSync();
  value = int.parse(userInput!);
  while (value.toString().length > digits || value! < min || value > max) {
    print('Invalid input. Please try again');
    userInput = stdin.readLineSync();
    value = int.parse(userInput!);
  }
  return value;
}

//to make spaces in the console for a cleaner output
void clearConsole() {
  for (int i = 0; i < 50; i++) {
    stdout.writeln();
  }
}

void adminOrUser(String session, List<User> user, List<Salary> salary, List<Leaves> leaves){
  if(session == 'Administrator'){
    _loggedAsAdmin(session, user, salary, leaves);
  }
  else if (session == 'Goodbye'){
    print('Goodbye!\n\n');
  }
  else {
    _loggedAsUser(session, user, leaves);
  }
}

void _loggedAsAdmin(String session, List<User> user, List<Salary> salary, List<Leaves> leaves) {
  bool isLoggedIn = true;
  String? userInput;
  while(isLoggedIn){
    //clearConsole();
    print('\nWelcome, $session!');

    print('\n1. Add Users\n'
        '2. Add Salaries\n'
        '3. Add Leaves\n'
        '4. View Users\n'
        '5. Salary Report\n'
        '6. Manage Leaves\n'
        '7. Logout');
    userInput = stdin.readLineSync();
    //clearConsole();
    switch (userInput){
      case '7' :{
        isLoggedIn = false;
        main();
        break;
      }
      case '2' :{
        _addSalary(salary, users);
        break;
      }
      case '1' :{
        addUser(user);
        break;
      }
      case '5' :{
        if (salary.isEmpty){
          print('\nNothing to show here.\n');
        }
        print('');
        for(var element in salary){
          print(element);
        }
        print('');
        print('Press enter to continue..');
        stdin.readLineSync();
        break;
      }
      case '3' :{
        _addLeave(leaves, session, users);
        break;
      }
      case '4' :{
        _viewUsers(user, leaves);
        break;
      }
      case '6' :{
        _manageLeaves(leaves);
        break;
      }
      default :{
        print('Please enter valid input.');
        break;
      }
    }
  }

}

void _loggedAsUser(String session, List<User> user, List<Leaves> leaves) {
  bool isLoggedIn = true;
  String? userInput;
  int index = 0;
  for (var element in user){
    if (session == element.getUserName){
      break;
    }
    else {
      index++;
    }
  }
  while (isLoggedIn){
    //clearConsole();
    print('\nWelcome, ${user[index].firstName} ${user[index].lastName}!');
    print('\n1. View profile\n'
        '2. Request a Leave\n'
        '3. View Leaves\n'
        '4. Logout');
    userInput = stdin.readLineSync();
    switch (userInput){
      case '1' :{
        _editUser(user, index);
        break;
      }
      case '2' :{
        _addLeave(leaves, session, users, user[index]);
        break;
      }
      case '3' :{
        print('\nYour current active Leave requests:\n');
        for(var element in leaves){
          if(element.email == user[index].email){
            print(element);
          }
        }
        print('\n\nPress enter to continue...');
        stdin.readLineSync();
        break;
      }
      case '4' :{
        isLoggedIn = false;
        main();
        break;
      }
    }
  }
}