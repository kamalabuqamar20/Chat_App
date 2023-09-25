import 'package:chat_app/firebase_options.dart';
import 'package:chat_app/pages/chat_page.dart';

import 'package:chat_app/pages/register_page.dart';
import 'package:chat_app/pages/splash_page.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     debugShowCheckedModeBanner: false,
     routes: {
      RegisterPage.id : (context)=>const RegisterPage(),
      ChatPage.id:(context) =>const ChatPage(),
     },
      home:const SplashPage(),
    );
  }
}
