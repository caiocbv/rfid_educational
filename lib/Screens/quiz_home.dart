//import 'dart:js_util';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:rfid_educational/Screens/quiz_details.dart';
import 'package:rfid_educational/Screens/quiz_new_list.dart';
import 'package:rfid_educational/Screens/quiz_search.dart';
import 'package:rfid_educational/model/quiz_models.dart';
import 'package:rfid_educational/utils/app_widget.dart';
import 'package:rfid_educational/utils/quiz_colors.dart';
import 'package:rfid_educational/utils/quiz_constant.dart';
import 'package:rfid_educational/utils/quiz_data_generator.dart';
import 'package:rfid_educational/utils/quiz_strings.dart';
import 'package:rfid_educational/utils/quiz_widget.dart';

class QuizHome extends StatefulWidget {
  static String tag = '/QuizHome';

  const QuizHome({super.key});

  @override
  _QuizHomeState createState() => _QuizHomeState();
}

class _QuizHomeState extends State<QuizHome> {
  late List<NewQuizModel> mListings = List<NewQuizModel>.empty();
  final TextEditingController _text = TextEditingController(text: "Search");
  late List<String> suggestions;
  late List<String> _filteredSuggestions;

  @override
  void initState() {
    super.initState();
    mListings = getQuizData();
    suggestions = List<String>.empty(growable:true);
  }

  @override
  Widget build(BuildContext context) {
    for(NewQuizModel x in mListings){
      suggestions.add(x.quizName);
    }
    return Scaffold(
      backgroundColor: quizappbackground,
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            SingleChildScrollView(
              padding:const EdgeInsets.only(bottom: 16),
              child: Column(
                children: <Widget>[
                  Container(
                      alignment: Alignment.bottomCenter,
                      color: quizwhite,
                      //margin: EdgeInsets.all(MediaQuery.of(context).size.width * 0.1),
                      padding: const EdgeInsets.all(8.0),
                      child: CupertinoSearchTextField(
                          controller: _text,
                          onChanged: (value) {
                            setState(() {
                              _filteredSuggestions = suggestions.where((suggestion) => suggestion.toLowerCase().contains(value.toLowerCase())).toList();
                            });
                            
                          },                          
                          onSubmitted:(value){
                            setState(() {
                              if(_filteredSuggestions.length > 1){
                                NewQuizModel? first = mListings.where((element) => element.quizName.contains(_filteredSuggestions.elementAt(0))).firstOrNull;
                                if(first==null){
                                  setState(() {
                                    _text.text = "We don't found any results."; //TODO ainda não funciona
                                  });
                                }else{
                                  QuizDetails(first, mListings.indexOf(first)).launch(context);
                                }
                              }
                            });
                          },

                      ),
                  ),
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
                          quizlblviewall,//"View All"
                          textColor: quiztextColorSecondary,
                          isBold: true,
                          fontSize: textSizeMedium
                        ).onTap(() {
                          setState(() {
                           const QuizListing().launch(context);//Screen - View All
                          });
                        }),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.85,
                    //height: 300,
                    //Criando um listview
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: mListings.length,
                      shrinkWrap: true,
                      physics:const ScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) => GestureDetector(
                        onTap: () {
                          QuizDetails(mListings[index], index).launch(context);//Screen View a Quiz
                        },
                        child: NewQuiz(mListings[index], index),
                      ),
                    ),
                  ).paddingOnly(bottom: 16),
                 const SizedBox(height: 100),
                 
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
      height: MediaQuery.of(context).size.height *1.2,
      width: MediaQuery.of(context).size.width * 0.75,
      decoration: boxDecoration(radius: 16, showShadow: true, bgColor: quizwhite),
      child:  Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Stack(
            alignment: Alignment.bottomCenter,
            children: <Widget>[
              ClipOval( //Imagem Lupa
                child: CachedNetworkImage(
                    placeholder: placeholderWidgetFn() as Widget Function(BuildContext, String)?,
                    imageUrl: model.quizImage,
                    height: w * 0.45,
                    width: w * 0.45,
                    fit: BoxFit.cover
                ),         
              ),
            ],
          ).paddingTop(w*0.1),
          Padding(
            padding: const EdgeInsets.all(13.0),
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
