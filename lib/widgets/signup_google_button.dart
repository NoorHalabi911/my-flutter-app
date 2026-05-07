import 'package:flutter/material.dart';
import 'package:google_sign_in_platform_interface/google_sign_in_platform_interface.dart';
import 'package:google_sign_in_web/google_sign_in_web.dart';

class SignupGoogleButton extends StatelessWidget {
  const SignupGoogleButton({super.key});

  @override
  Widget build(BuildContext context) {
    final googlePlugin = GoogleSignInPlatform.instance as GoogleSignInPlugin;
    return SizedBox(width: 250, child: googlePlugin.renderButton());
  }
}
