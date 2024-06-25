import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:rfid_educational/Screens/quiz_splash_screen.dart';

void main() async {
  // await initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RFID Educational Quiz',
      home:const QuizSplashScreen(),
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
    );
  }
}
