import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:satmaver_flutter/screens/root_wrapper.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Image.asset(
          "images/logo.png",
          width: 150,
        ),
      ),
      nextScreen: const RootWrapper(),
      duration: 3000,
      splashTransition: SplashTransition.scaleTransition,
    );
  }
}
