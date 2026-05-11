import 'package:flutter/material.dart';
import 'package:quiz/theme/app_colors.dart';

/// Wraps auth forms in the shared purple–teal gradient + scroll + safe area.
class AuthBrandedGradientScrollShell extends StatelessWidget {
  const AuthBrandedGradientScrollShell({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [AppColors.gradientTop, AppColors.gradientBottom],
        ),
      ),
      child: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
            child: child,
          ),
        ),
      ),
    );
  }
}
