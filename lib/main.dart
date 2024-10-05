import 'package:employee_login/Employeepage.dart';
import 'package:employee_login/hierarchical.dart';
import 'package:employee_login/homepage.dart';
import 'package:employee_login/loginpage.dart';
import 'package:employee_login/profilepage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(EmployeeLoginApp());
}

class EmployeeLoginApp extends StatelessWidget {
  const EmployeeLoginApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Employee Login',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => const LoginScreen(),
          '/home': (context) => const HomePage(),
          '/profile': (context) => ProfilePage(),
          '/hierarchical': (context) => const HierarchicalPage(),
          '/teamprofile': (context) => const EmployeeProfileAndProgressPage(),
        });
  }
}
