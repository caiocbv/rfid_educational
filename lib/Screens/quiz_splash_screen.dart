import 'package:flutter/material.dart';
import 'package:rfid_educational/Screens/RFIDQuizSignIn.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:rfid_educational/utils/app_widget.dart';
import 'package:rfid_educational/utils/quiz_colors.dart';

import '../onBoardingScreens/view/onBoardingScreen.dart';

class QuizSplashScreen extends StatefulWidget {
  const QuizSplashScreen({super.key});

  @override
  _QuizSplashScreenState createState() => _QuizSplashScreenState();
}

class _QuizSplashScreenState extends State<QuizSplashScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    // Add logic to check if onboarding is complete
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool onboardingComplete = prefs.getBool('onboarding_complete') ?? false;

    if (onboardingComplete) {
      await 3.seconds.delay.then((value) => push(const RFIDQuizSignIn(), pageRouteAnimation: PageRouteAnimation.Slide, isNewTask: true));
    } else {
      await 3.seconds.delay.then((value) => push(const onBoardingScreenHome(), pageRouteAnimation: PageRouteAnimation.Slide, isNewTask: true));
    }
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: quizappbackground,
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("images/quiz/logo_RFID.png")
          ],
        ).withWidth(context.width()),
      ),
    );
  }
}
