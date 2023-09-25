import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:chat_app/constant.dart';
import 'package:chat_app/pages/login_page.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:page_transition/page_transition.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splashIconSize: 500,
      backgroundColor: kPrimaryColor,
      splash: kLogoApp ,
      nextScreen:const LoginPage(),
      splashTransition: SplashTransition.rotationTransition,
      pageTransitionType: PageTransitionType.topToBottom,
     
    );
  }
}