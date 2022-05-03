import 'package:untitled/capstone1dependency.dart';

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

void main() {
  bool isOnPage = true;
  String? session;

  //to have sample users in list
  if (users.isEmpty){
    populateUser(users, 10);
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