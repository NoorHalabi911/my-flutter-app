import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:quiz/widgets/signup_widgets.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final GoogleSignIn googleSignIn = GoogleSignIn.instance;

  bool boolen = true;

  @override
  void initState() {
    super.initState();

    googleSignIn.initialize(
      clientId:
          "963128156550-rs1ekl5r76m68rblkkhtrffdpp5m0gsm.apps.googleusercontent.com",
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Sign-Up"), centerTitle: true),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SignupEmailField(),

            const SizedBox(height: 20),

            SignupPasswordField(
              boolen: boolen,
              onToggleVisibility: () {
                setState(() {
                  boolen = !boolen;
                });
              },
            ),

            const SizedBox(height: 20),

            const SignupConfirmPasswordField(),

            const SizedBox(height: 20),

            const SignupLoginButton(),

            const SizedBox(height: 30),

            const SignupGoogleButton(),
          ],
        ),
      ),
    );
  }
}
