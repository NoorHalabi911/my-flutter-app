import 'package:flutter/material.dart';
import 'package:quiz/widgets/login_widgets.dart';

class LogeinScreen extends StatefulWidget {
  const LogeinScreen({super.key});

  @override
  State<LogeinScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LogeinScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("log-in"), centerTitle: true),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const LoginEmailField(),

            const SizedBox(height: 20),

            const LoginPasswordField(),

            const SizedBox(height: 20),

            const LoginButton(),

            const GoToSignUpButton(),
          ],
        ),
      ),
    );
  }
}