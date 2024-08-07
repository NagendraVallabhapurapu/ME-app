import 'package:employee_login/loginpage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(EmployeeLoginApp());
}

class EmployeeLoginApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Employee Login',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginScreen(),
    );
  }
}
