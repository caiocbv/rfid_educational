import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:quiz/Screens/quiz_details.dart';
import 'package:quiz/Screens/quiz_new_list.dart';
import 'package:quiz/Screens/quiz_search.dart';
import 'package:quiz/model/quiz_models.dart';
import 'package:quiz/utils/app_widget.dart';
import 'package:quiz/utils/quiz_colors.dart';
import 'package:quiz/utils/quiz_constant.dart';
import 'package:quiz/utils/quiz_data_generator.dart';
import 'package:quiz/utils/quiz_strings.dart';
import 'package:quiz/utils/quiz_widget.dart';

class QuizHome extends StatefulWidget {
  static String tag = '/QuizHome';

  const QuizHome({super.key});

  @override
  _QuizHomeState createState() => _QuizHomeState();
}

class _QuizHomeState extends State<QuizHome> {
  late List<NewQuizModel> mListings;

  @override
  void initState() {
    super.initState();
    mListings = getQuizData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: quizappbackground,
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            SingleChildScrollView(
              padding:const EdgeInsets.only(bottom: 16),
              child: Column(
                children: <Widget>[
                 const SizedBox(height: 40),
                 //Texto superior
                  text(quizlblhiantonio, fontFamily: fontBold, fontSize: textSizeXLarge,textColor: quiztextColorSecondary,isBold:true, isShadow: true),
                  text(quizlblwhatwouldyouliketolearnntodaysearchbelow, textColor: quiztextColorSecondary, isLongText: true, isCentered: true, fontSize: textSizeMedium),
                 const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        //Texto - New Quiz
                        text(quizlblnewquiz, textAllCaps: false, fontFamily: fontBold, fontSize: textSizeMedium, textColor: quiztextColorSecondary, isBold: true),
                        //Texto - View All
                        text(
                          quizlblviewall,
                          textColor: quiztextColorSecondary,
                          isBold: true,
                          fontSize: textSizeMedium
                        ).onTap(() {
                          setState(() {
                           const QuizListing().launch(context);
                          });
                        }),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.8,
                    //height: 300,
                    //Criando um listview
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: mListings.length,
                      shrinkWrap: true,
                      physics:const ScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) => GestureDetector(
                        onTap: () {
                          QuizDetails(mListings[index], index).launch(context);
                        },
                        child: NewQuiz(mListings[index], index),
                      ),
                    ),
                  ).paddingOnly(bottom: 16),
                 const SizedBox(height: 30),
                 Container(
                    margin:const EdgeInsets.all(16.0),
                    decoration: boxDecoration(radius: 10, showShadow: true, bgColor: quizwhite),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Expanded(child: quizEditTextStyle(quizlblsearch, isPassword: false)),
                        Container(
                          margin:const EdgeInsets.only(right: 10),
                          decoration: boxDecoration(radius: 10, showShadow: false, bgColor: quizcolorPrimary),
                          padding:const EdgeInsets.all(10),
                          child:const Icon(Icons.search, color: quizwhite),
                        ).onTap(() {
                        const  QuizSearch().launch(context);
                          setState(() {});
                        })
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class NewQuiz extends StatelessWidget {
  late NewQuizModel model;

  NewQuiz(this.model, int pos, {super.key});

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;

    return Container(
      margin:const EdgeInsets.only(left: 16),
      width: MediaQuery.of(context).size.width * 0.75,
      decoration: boxDecoration(radius: 16, showShadow: true, bgColor: quizwhite),
      child:  Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Stack(
            alignment: Alignment.bottomCenter,
            children: <Widget>[
              ClipRRect( //Imagem Lupa
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16.0),
                    topRight: Radius.circular(16.0)
                ),
                child: CachedNetworkImage(
                    placeholder: placeholderWidgetFn() as Widget Function(BuildContext, String)?,
                    imageUrl: model.quizImage,
                    height: w * 0.35,
                    width: MediaQuery.of(context).size.width * 0.35,
                    fit: BoxFit.fill
                ).paddingTop(w * 0.08), //Padding acima da imagem de lupa         
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    text(model.quizName, fontSize: textSizeMedium, isLongText: true, fontFamily: fontMedium, isCentered: false),
                    text(model.totalQuiz, textColor: quiztextColorSecondary),
                  ],
                ),
                const Icon(Icons.arrow_forward, color: quiztextColorSecondary),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
