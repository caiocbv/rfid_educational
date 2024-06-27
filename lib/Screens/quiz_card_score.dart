import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:rfid_educational/Screens/RFIDQuiz_dashboard.dart';
import 'package:rfid_educational/Screens/quiz_home.dart';
import 'package:rfid_educational/Screens/repo_screen.dart';
import 'package:rfid_educational/utils/app_widget.dart';
import 'package:rfid_educational/utils/quiz_colors.dart';
import 'package:rfid_educational/utils/quiz_constant.dart';
import 'package:rfid_educational/utils/quiz_images.dart';

class QuizCardsScore extends StatefulWidget {
  static String tag = '/QuizCardsScore';
  final int hits;
  final int total;

  const QuizCardsScore(this.hits,this.total,{super.key});

  @override
  _QuizCardsScoreState createState() => _QuizCardsScoreState(hits,total);

}
class _QuizCardsScoreState extends State<QuizCardsScore> {
  late int hitsCards;
  late int totalCards;

  _QuizCardsScoreState(this.hitsCards,this.totalCards);

 
  @override
  void initState() {
    super.initState();
    init();
  }
  
  void init() async {
    //
  }
  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: quizappbackground,
        body: SafeArea(
          child: GestureDetector(
            child: Stack(
              children: <Widget>[
                  Container(
                    /*height: MediaQuery.of(context).size.height*0.8,*/
                    width: MediaQuery.of(context).size.width*0.8,
                    child: 
                      Column(
                        children: <Widget>[
                          SizedBox(height: MediaQuery.of(context).size.height*0.18),
                          Row(
                              
                              children: <Widget>[
                                Expanded(
                                child: 
                                  Container(
                                    decoration: boxDecoration(radius: 20, bgColor: quizwhiteBottom, showShadow: true),
                                    child: 
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        SizedBox(
                                          height: 400.0,
                                          width: 320.0,
                                          child: 
                                            Container(
                                              margin:const EdgeInsets.only(top: 15),
                                              padding:const EdgeInsets.fromLTRB(20, 16, 20, 16),
                                              child:
                                                Column(
                                                  children: <Widget>[
                                                    ClipRRect(
                                                      borderRadius: const BorderRadius.all(Radius.circular(150.0)),
                                                      child: 
                                                      commonCacheImageWidget(
                                                          width: 250,
                                                          height: 150,
                                                          quizb2, 
                                                          fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  const SizedBox(height: 10),
                                                  text("That's Amazing\nQuiz Done!", fontSize: textSizeLarge, fontFamily: fontBold, isLongText: true, isCentered: true),
                                                  const SizedBox(height: 50),
                                                  text("SCORE: "+ this.hitsCards.toString()+"/"+this.totalCards.toString(), fontSize: textSizeXXLarge, fontFamily: fontBold, isLongText: true),
                                                  ]
                                                ),
                                            )
                                        )
                                      ])
                                  ).onTap((){
                                    setState(() {
                                      const RFIDQuizDashboard().launch(context); //Quando finalizar os cards do QUIZ
                                    });
                                  }),
                              )
                            ]
                          )
                        ]
                      )
                  )
              ]
            ).center()
          )
        )
    );
  }
}