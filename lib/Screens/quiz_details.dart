import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:rfid_educational/Screens/quiz_card.dart';
import 'package:rfid_educational/model/quiz_models.dart';
import 'package:rfid_educational/utils/app_widget.dart';
import 'package:rfid_educational/utils/quiz_colors.dart';
import 'package:rfid_educational/utils/quiz_constant.dart';
import 'package:rfid_educational/utils/quiz_data_generator.dart';
import 'package:rfid_educational/utils/quiz_strings.dart';
import 'package:rfid_educational/utils/quiz_widget.dart';

class QuizDetails extends StatefulWidget {
  static String tag = '/QuizDetails';
  late NewQuizModel model;
  late int pos;
  
  QuizDetails(this.model, this.pos, {super.key});

  @override
  _QuizDetailsState createState() => _QuizDetailsState(model, pos);
}

class _QuizDetailsState extends State<QuizDetails> {
  late List<QuizTestModel> mList;
  late NewQuizModel model2;
  late int pos2;

  _QuizDetailsState(this.model2,this.pos2);

  @override
  void initState() {
    super.initState();
    mList = quizGetData(); //Inicia a lista
  }

  @override
  Widget build(BuildContext context) {
    
    changeStatusColor(quizappbackground);
    return Scaffold(
      backgroundColor: quizappbackground,
      body: Column(
        children: <Widget>[
          quizTopBar("return"),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                const SizedBox(
                    height: 20,
                  ),
                  text(this.model2.quizName,textColor: quiztextColorSecondary, isLongText: true, isCentered: true, fontSize: textSizeXLarge, isBold: true, isShadow: true),
                  text(this.model2.totalQuiz, textColor: quiztextColorSecondary),
                const  SizedBox(
                    height: 10,
                  ),
                  ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: 1,//mList.length,
                      shrinkWrap: true,
                      physics:const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return quizList(mList[pos2], pos2);
                      }),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

// ignore: must_be_immutable, camel_case_types
class quizList extends StatelessWidget {
  late var width;
  late QuizTestModel model;
  late int pos;
   quizList(this.model, this.pos, {super.key});

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    return Container(
      margin:const EdgeInsets.only(left: 16, bottom: 16, right: 16),
      decoration: boxDecoration(radius: 10, showShadow: true, bgColor: quizwhite),
      padding:const EdgeInsets.all(16),
      child: Column(
        children: <Widget>[
          Row(            
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                decoration:const BoxDecoration(shape: BoxShape.rectangle, color: quizcolorsetting),
                width: width / 1.249,
                height: width / 1.4,
                child: commonCacheImageWidget(
                  model.image, 
                  fit: BoxFit.cover,
                ),
              ),
             const SizedBox(
                width: 16,
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                //text(model.type, textColor: quiztextColorSecondary, fontSize: textSizeSMedium),
                text(
                    model.heading,
                    fontFamily: fontMedium,
                ),
              ],
          ),
          const SizedBox(
            height: 10,
          ),
          text(model.description, textColor: quiztextColorSecondary, fontSize: textSizeMedium, isLongText: true),
         const SizedBox(
            height: 10,
          ),
          quizButton(
              textContent: quizlblbegin,
              onPressed: () {
                QuizCards(this.pos).launch(context);
              })
        ],
      ),
    );
  }
}
