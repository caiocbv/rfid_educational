import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:rfid_educational/Screens/RFIDQuiz_dashboard.dart';
import 'package:rfid_educational/Screens/quiz_sign_up.dart';
import 'package:rfid_educational/utils/app_widget.dart';
import 'package:rfid_educational/utils/quiz_colors.dart';
import 'package:rfid_educational/utils/quiz_constant.dart';
import 'package:rfid_educational/utils/quiz_strings.dart';
import 'package:rfid_educational/utils/quiz_widget.dart';

class RFIDQuizSignIn extends StatefulWidget {
  static String tag = '/RFIDQuizSignIn';

  const RFIDQuizSignIn({super.key});

  @override
  _RFIDQuizSignInState createState() => _RFIDQuizSignInState();
}

class _RFIDQuizSignInState extends State<RFIDQuizSignIn> {
  @override
  Widget build(BuildContext context) {
    changeStatusColor(quizappbackground);

    return Scaffold(
      backgroundColor: quizappbackground,
      body: SafeArea(
        child: Align(
          alignment: Alignment.center,
          child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            alignment: Alignment.center,
            color: quizappbackground,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
               const SizedBox(height: 16),
                text(quiztitlelogin, textColor: quiztextColorPrimary,fontSize: textSizeXXLarge, isBold: true, isShadow: true),
                text(quizinfologin, textColor: quiztextColorSecondary, isLongText: true, isCentered: true).center(),
                Container(
                  margin:const EdgeInsets.all(24.0),
                  decoration: boxDecoration(bgColor: quizappbackground, color: quizappbackground, showShadow: true, radius: 10),
                  child: Column(
                    children: <Widget>[
                      quizEditTextStyle(quizhintyouremail, isPassword: false),
                      quizDivider(),
                      quizEditTextStyle(quizhintyourpassword),
                    ],
                  ),
                ),
                Container(
                    margin:const EdgeInsets.all(24.0),
                    child: quizButton(
                        textContent: quizlblcontinue,
                        onPressed: () {
                          setState(() {
                           const RFIDQuizDashboard().launch(context);
                          });
                        })),
               const SizedBox(height: 30),
                Column(
                  children: <Widget>[
                    text(quizlbldonthaveanaccount),
                    text(quizlblcreateaccount, textColor: quizcolorPrimary, fontFamily: fontSemibold),
                  ],
                ).onTap(() {
                  setState(() {
                   const QuizSignUp().launch(context);
                  });
                }),
               const SizedBox(
                  height: 10,
                ),
                
              ],
            ),
          ),
        ),
        ),
      ),
    );
  }
}
