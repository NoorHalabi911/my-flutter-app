import 'package:flutter/material.dart';
// import 'Loginpage.dart';
import 'package:quiz/Loginpage.dart' as login;
import 'sign-up.dart';


void main() {
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
return const MaterialApp(
  home: login.LogeinScreen(),
);
  }
}