import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:satmaver_flutter/screens/login_page.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Image.asset(
        "images/logo.png",
        width: 100,
      ),
      nextScreen: const LoginPage(),
      duration: 3000,
      splashTransition: SplashTransition.scaleTransition,
    );
  }
}
