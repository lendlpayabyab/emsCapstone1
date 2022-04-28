import 'dart:io';
int testCount = 0;

class Person {
  late final String firstName;
  late final String lastName;
  late final String address;
  late final int zipCode;
  late final int phoneNum;

  Person();

/*
  set setFirstName(String s){
    firstName = s;
  }

  set setLastName(String s){
    lastName = s;
  }

  set setAddress(String s){
    address = s;
  }

  set setZipCode(int n){
    zipCode = n;
  }

  set setPhoneNum(int n){
    phoneNum = n;
  }
*/
  void fillData() {
    int temp = 0;
    String? userInput;
    print('Input first name:');
    userInput = stdin.readLineSync();
    firstName = userInput!;
    print('Input last name:');
    userInput = stdin.readLineSync();
    lastName = userInput!;
    print('Input Address:');
    userInput = stdin.readLineSync();
    address = userInput!;
    print('Input Zip Code:');
    userInput = stdin.readLineSync();
    if (userInput != null) {
      temp = int.parse(userInput);
    }
    zipCode = temp;
    print('Input Phone Number:');
    userInput = stdin.readLineSync();
    if (userInput != null) {
      temp = int.parse(userInput);
    }
    phoneNum = temp;
  }

  void fillRandom(){
    firstName = 'a$testCount';
    lastName = 'b$testCount';
    address = 'c$testCount';
    zipCode = 100+testCount;
    phoneNum = 9981258400+testCount;
    testCount++;
  }

  @override
  String toString() =>
      '[Name: $lastName, $firstName | Address: $address $zipCode | Phone number: $phoneNum]';
}

class CollegeEmployee extends Person {
  late final int sSNum;
  late final int salary;
  late final String department;

  @override
  void fillData() {
    int temp = 0;
    String? userInput;
    super.fillData();
    print('Input Department:');
    userInput = stdin.readLineSync();
    department = userInput!;
    print('Input SSS Number:');
    userInput = stdin.readLineSync();
    if (userInput != null) {
      temp = int.parse(userInput);
    }
    sSNum = temp;
    print('Input Salary:');
    userInput = stdin.readLineSync();
    if (userInput != null) {
      temp = int.parse(userInput);
    }
    salary = temp;
  }

  @override
  void fillRandom() {
    sSNum = 5498500+testCount;
    salary = 20000+testCount;
    department = 'a$testCount';
    super.fillRandom();
  }

  @override
  String toString() =>
      '[Name: $lastName, $firstName | Address: $address $zipCode | Phone number: $phoneNum] | Department: $department | SSS No.: $sSNum | Salary: $salary]';
}

class Faculty extends CollegeEmployee{
  late final bool tenured;
  Faculty();

  @override
  void fillData() {
    super.fillData();
    print('Tenured? Y or N?');
    String? userInput = stdin.readLineSync();
    if(userInput!.toUpperCase() == 'Y'){
      tenured = true;
    }
    else {
      tenured = false;
    }
  }

  @override
  void fillRandom() {
    super.fillRandom();
    tenured = true;
  }

  @override
  String toString() =>
      '[Name: $lastName, $firstName | Address: $address $zipCode | Phone number: $phoneNum] | Department: $department | SSS No.: $sSNum | Salary: $salary | Tenured? : ${(tenured)? 'Yes' : 'No'}]';
}

class Student extends Person{
  late final String majorFOS;
  late final double gradeAverage;

  @override
  void fillData() {
    double temp = 0;
    String? userInput;
    super.fillData();
    print('Input Major field of study:');
    userInput = stdin.readLineSync();
    majorFOS = userInput!;
    print('Input Average Grade:');
    userInput = stdin.readLineSync();
    if (userInput != null) {
      temp = double.parse(userInput);
    }
    gradeAverage = temp;
  }

  @override
  void fillRandom() {
    majorFOS = 'a$testCount';
    gradeAverage = 80+testCount.toDouble();
    super.fillRandom();
  }

  @override
  String toString() =>
      '[Name: $lastName, $firstName | Address: $address $zipCode | Phone number: $phoneNum | Major Field of Study: $majorFOS | Average Grade: $gradeAverage]';
}

List<CollegeEmployee> collegeEmployees = [];
List<Faculty> faculties = [];
List<Student> students = [];

void addData(String tag){
  if (tag == 'C'){
    collegeEmployees.add(CollegeEmployee());
    //collegeEmployees[collegeEmployees.length-1].fillRandom(); //to automatically enter values for testing
    collegeEmployees[collegeEmployees.length-1].fillData();
  }
  else if (tag == 'F'){
    faculties.add(Faculty());
    //faculties[faculties.length-1].fillRandom(); //to automatically enter values for testing
    faculties[faculties.length-1].fillData();
  }
  else if (tag == 'S'){
    students.add(Student());
    //students[students.length-1].fillRandom(); //to automatically enter values for testing
    students[students.length-1].fillData();
  }
}

void main() {

  String tag = 'G';

  while (tag != 'Q'){
    print('Which Person Type would you like to enter data? (C/F/S) or quit? (Q)');
    String? userInput = stdin.readLineSync();
    tag = userInput!.toUpperCase();

    if (tag == 'C' && collegeEmployees.length == 4){
      print('College employees already have reached maximum count');
    }
    else if (tag == 'F' && faculties.length == 3){
      print('Faculties already have reached maximum count');
    }
    else if (tag == 'S' && students.length == 7){
      print('Students already have reached maximum count');
    }
    else if (tag != 'C' && tag != 'F' && tag != 'S' && tag != 'Q'){
      print('Please enter proper input.');
    }
    else{
      addData(tag);
    }
  }

  // print regular college employees list
  if (collegeEmployees.isEmpty){
    print('\nRegular College Employees list has no entries\n');
  }
  else {
    print('\nRegular college employees list:\n');
    collegeEmployees.map(print).toList();
  }

  // print faculty list
  if (faculties.isEmpty){
    print('\nFaculty list has no entries\n');
  }
  else {
    print('\nFaculty list:\n');
    faculties.map(print).toList();
  }

  // print student list
  if (students.isEmpty){
    print('\nStudent list has no entries\n');
  }
  else {
    print('\nStudent list:\n');
    students.map(print).toList();
  }
}
