import 'package:flutter/material.dart';
import 'package:quiz/designs/login_design_layout.dart';

class LogeinScreen extends StatefulWidget {
  const LogeinScreen({super.key});

  @override
  State<LogeinScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LogeinScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: LoginDesignLayout());
  }
}