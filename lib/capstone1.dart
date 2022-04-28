import 'package:untitled/capstone1dependency.dart';

//made the 'database' global variables
List<User> users = [];
List<Leaves> leaves = [];
List<Salary> salaries = [];

// for testing purposes
void populateUser(List<User> user, int quantity) {
  for (int i = 1; i <= quantity; i++) {
    user.add(User(
      firstName: 'New',
      lastName: 'Employee_$i',
      email: 'email$i@sample.com',
      username: 'username$i',
      password: 'password$i',
    ));
  }
}

void adminOrUser(String session, List<User> user, List<Salary> salary, List<Leaves> leaves){
  if(session == 'Administrator'){
    loggedAsAdmin(session, user, salary, leaves);
  }
  else if (session == 'Goodbye'){
    print('Goodbye!\n\n');
  }
  else {
    loggedAsUser(session, user, leaves);
  }
}

void loggedAsAdmin(String session, List<User> user, List<Salary> salary, List<Leaves> leaves) {
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
        addSalary(salary, users);
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
        addLeave(leaves, session, users);
        break;
      }
      case '4' :{
        viewUsers(user, leaves);
        break;
      }
      case '6' :{
        manageLeaves(leaves);
        break;
      }
      default :{
        print('Please enter valid input.');
        break;
        }
    }
  }

}

void loggedAsUser(String session, List<User> user, List<Leaves> leaves) {
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
        editUser(user, index);
        break;
      }
      case '2' :{
        addLeave(leaves, session, users, user[index]);
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

void main() {
  bool isOnPage = true;
  String? session;

  //to have sample users in list
  if (users.isEmpty){
    populateUser(users, 20);
  }

  while (isOnPage) {
    //clearConsole();
    print('\n\nWelcome! Do you wish to Log in or Sign up?');
    print('1. Log in\n2. Sign up\n3. Contact us\n4. Quit');
    String? userInput = stdin.readLineSync();
    if (userInput == '2') {
      addUser(users);
    } else if (userInput == '1') {
      session = loginSequence(admin, users);
      if(session == 'Goodbye'){
        isOnPage = true;
      }
      else{
        isOnPage = false;
      }
      adminOrUser(session, users, salaries, leaves);
    }
    else if (userInput == '3'){
      print('\nFor inquiries or concerns you may contact our admin:\n');
      print('Name: ${admin[00].firstName} ${admin[00].lastName}\n'
          'Email: ${admin[00].email}\n');
      print('\nPress enter to continue..');
      stdin.readLineSync();
    }
    else if (userInput == '4'){
      isOnPage = false;
    }
    else {
      print('Enter valid input.');
    }
  }
}