import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:quiz/Screens/quiz_all_list.dart';
import 'package:quiz/Screens/quiz_home.dart';
import 'package:quiz/Screens/quiz_profile.dart';
import 'package:quiz/utils/app_widget.dart';
import 'package:quiz/utils/quiz_colors.dart';
import 'package:quiz/utils/quiz_images.dart';

class RFIDQuizDashboard extends StatefulWidget {
  static String tag = '/RFIDQuizDashboard';

  const RFIDQuizDashboard({super.key});

  @override
  _RFIDQuizDashboardState createState() => _RFIDQuizDashboardState();
}

class _RFIDQuizDashboardState extends State<RFIDQuizDashboard> {
  var selectedIndex = 0;

  var pages = [
   const QuizHome(),
   const QuizAllList(),
   const QuizProfile(),
  ];

  @override
  void initState() {
    super.initState();
    selectedIndex = 0;
  }

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
      if (selectedIndex == 0) {
      } else if (selectedIndex == 1) {
      } else if (selectedIndex == 2) {}
    });
  }

  Widget quizItem(var pos, var icon, var title) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _onItemTapped(pos);
        });
      },
      child: Container(
        height: 53,
        child: Column(
          children: <Widget>[
            Image.asset(icon,height:26),
            text(
              title,
              textColor: quizcolorPrimary,
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(quizappbackground);
    return Scaffold(
      backgroundColor: quizappbackground,
      body: SafeArea(
        child: pages[selectedIndex],
      ),
      bottomNavigationBar: Container(
        //padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: quizwhiteBottom, //Cor da parte de baixo
          border: Border.all(
            color: quizShadowColor,
          ),
          borderRadius: const BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),          boxShadow: const [
            BoxShadow(
              color: quizShadowColor,
              blurRadius: 10,
              spreadRadius: 2,
              offset: Offset(0, 3.0),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 0.0, right: 0, top: 6),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              quizItem(0, quizichomes, "Home"),
              quizItem(1, quizicquiz, "Quiz"),
              quizItem(2, quizicuser, "Profile"),
            ],
          ),
        ),
      ),
    );
  }
}
