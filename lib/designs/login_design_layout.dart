import 'package:flutter/material.dart';
import 'package:quiz/widgets/login_widgets.dart';

class LoginDesignLayout extends StatelessWidget {
  const LoginDesignLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFFC493DF),
            Color(0xFF9EDCDF),
          ],
        ),
      ),
      child: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.person_outline,
                  size: 62,
                  color: Color(0xFFEFF5FF),
                ),
                const SizedBox(height: 12),
                const Text(
                  "User Login",
                  style: TextStyle(
                    color: Color(0xFFF0F6FF),
                    fontSize: 46,
                    letterSpacing: 1.5,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                const SizedBox(height: 36),
                const LoginEmailField(),
                const SizedBox(height: 22),
                const LoginPasswordField(),
                const SizedBox(height: 24),
                SizedBox(
                  width: 340,
                  child: Row(
                    children: const [
                      Icon(
                        Icons.check_box,
                        size: 18,
                        color: Color(0xFF3A5A92),
                      ),
                      SizedBox(width: 8),
                      Text(
                        "Remember me",
                        style: TextStyle(
                          color: Color(0xFF4C6291),
                          fontSize: 14,
                        ),
                      ),
                      Spacer(),
                      Text(
                        "Forgot Password?",
                        style: TextStyle(
                          color: Color(0xFF4C6291),
                          fontSize: 14,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 28),
                SizedBox(
                  width: 310,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF2E5D95),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0),
                      ),
                    ),
                    onPressed: () {
                      print("Login");
                    },
                    child: const Text(
                      "LOGIN",
                      style: TextStyle(
                        letterSpacing: 1.5,
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                const GoToSignUpButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
