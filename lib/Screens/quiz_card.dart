import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:rfid_educational/Screens/repo_screen.dart';
import 'package:rfid_educational/model/quiz_models.dart';
import 'package:rfid_educational/utils/app_widget.dart';
import 'package:rfid_educational/utils/quiz_card.dart';
import 'package:rfid_educational/utils/quiz_colors.dart';
import 'package:rfid_educational/utils/quiz_constant.dart';
import 'package:rfid_educational/utils/quiz_data_generator.dart';

//Tela da classe dos cards
class QuizCards extends StatefulWidget {
  static String tag = '/QuizCards';
  late int pos;

  QuizCards(this.pos,{super.key});

  @override
  _QuizCardsState createState() => _QuizCardsState(pos);
}

class _QuizCardsState extends State<QuizCards> {
  List<Widget> cardList = [];
  late int position;
  late double clicks = 0;
  late bool buttonPressed=false;
  Color _cardColorA = quizwhite;
  Color _cardColorB = quizwhite; 
  Color _cardColorC = quizwhite; 
  Color _cardColorD = quizwhite; 

  _QuizCardsState(this.position);

  void removeCards(index) {
    setState(() {
      cardList.removeAt(index);
    });
  }

  @override
  void initState() {
    super.initState();
    cardList = _generateCards(this.position);
    clicks = 0;
    buttonPressed=false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: quizappbackground,
        body: SafeArea(
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Stack(alignment: Alignment.center, children: cardList).onTap((){ //AO CLICAR NA LETRA A
                                    setState(() {
                                       String temp = cardList.elementAt(0).toString().replaceAll("_cardColorA", "green");
                                       //scarList[0] = Widget.build(temp);
                                    });
                                    }
              ),
              Container(
                alignment: Alignment.topCenter,
                child: Row(
                  children: <Widget>[
                    IconButton( //Botao X canto superior esquerdo
                      onPressed: () {
                        finish(context);
                      },
                      icon:const Icon(
                        Icons.close,
                        color: quizcolorPrimary,
                      ),
                    ),
                    Expanded(
                      child: 
                      LinearProgressIndicator( //IMAGEM PROGRESSAO VERDE EM CIMA
                        value: (clicks/cardList.length) > 1.0 ? 1.0 : clicks/cardList.length, //calculando a porcentacem de cards passados
                        backgroundColor: textSecondaryColor.withOpacity(0.3),
                        valueColor:const AlwaysStoppedAnimation<Color>(
                          quizgreen,
                        ),
                      ).paddingAll(10),
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }

  List<Widget> _generateCards(int position) {
    List<QuizTestModel> Allquiz = quizGetData();
    List<Quiz>planetCard = Allquiz[position].allQuiz;

    for (int x = 0; x < planetCard.length; x++) { //PECORRE CADA UM DOS CARDS DAQUELE QUIZ
      cardList.add(
        Positioned(
          top: planetCard[x].topMargin,
          child: 
            Draggable(
              onDragEnd: (drag) {
                if (x == 0) {
                  setState(() {
                   const RepoScreen().launch(context); //Quando finalizar os cards do QUIZ
                  });
                }
                removeCards(x);
              },
              childWhenDragging: Container(),
              feedback: Material(
                child: GestureDetector(
                  //onTap: isPressedColorChange,
                  child: Container(
                    decoration: boxDecoration(radius: 20, bgColor: quizwhiteBottom, showShadow: true),
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 200.0,
                          width: 320.0,
                          child: Container(
                            margin:const EdgeInsets.only(top: 50),
                            padding:const EdgeInsets.fromLTRB(20, 16, 20, 16),
                            child: text(planetCard[x].cardImage, fontSize: textSizeNormal, fontFamily: fontBold, isLongText: true, isBold: true),
                          ),
                        ),
                        Container(
                            padding:const EdgeInsets.only(top: 10.0, bottom: 10.0),
                            width: 320,
                            alignment: Alignment.center,
                            child: Column(
                              children: <Widget>[
                                Card(
                                    child: Container(
                                    //margin:const EdgeInsets.fromLTRB(16, 0, 16, 16),
                                    color: _cardColorA,
                                    //decoration: boxDecoration(showShadow: false, bgColor: cardButtonColor, radius: 10, color: quizwhiteBottom), //Botoes dos cards
                                    padding:const EdgeInsets.fromLTRB(16, 10, 16, 10),
                                    width: 320,
                                    child: ColoredBox(
                                        color: buttonPressed ? greenColor : cardButtonColor,
                                          child:
                                            Stack(
                                              children: <Widget>[
                                                Center(
                                                  child: text(planetCard[x].option1, textColor: quiztextColorSecondary)                                                    
                                                ),
                                                Align(
                                                  alignment: Alignment.topLeft,
                                                  child: text("A." + (buttonPressed ? "True":"False"), textColor: quiztextColorSecondary, isBold: true)                                                          
                                                )
                                              ],
                                            ),
                                        ),
                                    ),
                                ),Card(
                                    child: Container(
                                    //margin:const EdgeInsets.fromLTRB(16, 0, 16, 16),
                                    color: _cardColorB,
                                    //decoration: boxDecoration(showShadow: false, bgColor: cardButtonColor, radius: 10, color: quizwhiteBottom), //Botoes dos cards
                                    padding:const EdgeInsets.fromLTRB(16, 10, 16, 10),
                                    width: 320,
                                    child: Stack(
                                      alignment: Alignment.center,
                                      children: <Widget>[
                                        Center(
                                          child: text(planetCard[x].option2, textColor: quiztextColorSecondary)                                                 
                                        ),
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: text("B.", textColor: quiztextColorSecondary, isBold: true)                                                  
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Card(
                                    child: Container(
                                    //margin:const EdgeInsets.fromLTRB(16, 0, 16, 16),
                                    color: _cardColorC,
                                    //decoration: boxDecoration(showShadow: false, bgColor: cardButtonColor, radius: 10, color: quizwhiteBottom), //Botoes dos cards
                                    padding:const EdgeInsets.fromLTRB(16, 10, 16, 10),
                                    width: 320,
                                    child: Stack(
                                      alignment: Alignment.center,
                                      children: <Widget>[
                                        Center(
                                          child: text(planetCard[x].option3, textColor: quiztextColorSecondary)                                                  
                                        ),
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: text("C.", textColor: quiztextColorSecondary, isBold: true)                                                  
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Card(
                                    child: Container(
                                    //margin:const EdgeInsets.fromLTRB(16, 0, 16, 16),
                                    color: _cardColorD,
                                    //decoration: boxDecoration(showShadow: false, bgColor: cardButtonColor, radius: 10, color: quizwhiteBottom), //Botoes dos cards
                                    padding:const EdgeInsets.fromLTRB(16, 10, 16, 10),
                                    width: 320,
                                    child: Stack(
                                      alignment: Alignment.center,
                                      children: <Widget>[
                                        Center(
                                          child: text(planetCard[x].option4, textColor: quiztextColorSecondary)                                                  
                                        ),
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: text("D.", textColor: quiztextColorSecondary, isBold: true)                                                  
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            )
                          )
                      ],
                    ),
                  ),
                ),
              ),
              child: GestureDetector(
                //onTap: isPressedColorChange,
                //onTap: isPressedColorChange,
                child: Container(
                    decoration: boxDecoration(radius: 20, bgColor: quizwhiteBottom, showShadow: true),
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                            height: 200.0,
                            width: 320.0,
                            child: Container(
                              margin:const EdgeInsets.only(top: 50),
                              padding:const EdgeInsets.fromLTRB(20, 16, 20, 16),
                              child: text(planetCard[x].cardImage, fontSize: textSizeNormal, fontFamily: fontBold, isLongText: true),
                            )),
                        Container(
                            padding:const EdgeInsets.only(top: 10.0, bottom: 10.0),                            
                            child: Column(                              
                              children: <Widget>[
                                Card(
                                    child: Container(
                                    //margin:const EdgeInsets.fromLTRB(16, 0, 16, 16),
                                    color: _cardColorA,
                                    //decoration: boxDecoration(showShadow: false, bgColor: cardButtonColor, radius: 10, color: quizwhiteBottom), //Botoes dos cards
                                    padding:const EdgeInsets.fromLTRB(16, 10, 16, 10),
                                    width: 320,
                                    child: Stack(
                                      alignment: Alignment.center,
                                      children: <Widget>[
                                        Center(
                                          child: text(planetCard[x].option1, textColor: quiztextColorSecondary)                                                  
                                        ),
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: text("A.", textColor: quiztextColorSecondary, isBold: true)                                                  
                                        )
                                      ],
                                    ),
                                  ),
                                ).onTap((){ //AO CLICAR NA LETRA A
                                    setState(() {
                                      clicks++;
                                      _cardColorA = quizcolorgreen;
                                    });
                                  }),Card(
                                    child: Container(
                                    //margin:const EdgeInsets.fromLTRB(16, 0, 16, 16),
                                    color: _cardColorB,
                                    //decoration: boxDecoration(showShadow: false, bgColor: cardButtonColor, radius: 10, color: quizwhiteBottom), //Botoes dos cards
                                    padding:const EdgeInsets.fromLTRB(16, 10, 16, 10),
                                    width: 320,
                                    child: Stack(
                                      alignment: Alignment.center,
                                      children: <Widget>[
                                        Center(
                                          child: text(planetCard[x].option2, textColor: quiztextColorSecondary)                                                  
                                        ),
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: text("B.", textColor: quiztextColorSecondary, isBold: true)                                                  
                                        )
                                      ],
                                    ),
                                  ),
                                ).onTap((){ //AO CLICAR NA LETRA B
                                    setState(() {
                                      clicks--;
                                      _cardColorB = quizcolorgreen;
                                    });
                                  }),
                                Card(
                                    child: Container(
                                    //margin:const EdgeInsets.fromLTRB(16, 0, 16, 16),
                                    color: _cardColorC,
                                    //decoration: boxDecoration(showShadow: false, bgColor: cardButtonColor, radius: 10, color: quizwhiteBottom), //Botoes dos cards
                                    padding:const EdgeInsets.fromLTRB(16, 10, 16, 10),
                                    width: 320,
                                    child: Stack(
                                      alignment: Alignment.center,
                                      children: <Widget>[
                                        Center(
                                          child: text(planetCard[x].option3, textColor: quiztextColorSecondary)                                                 
                                        ),
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: text("C.", textColor: quiztextColorSecondary, isBold: true)
                                        )
                                      ],
                                    ),
                                  ),
                                ).onTap((){ //AO CLICAR NA LETRA C
                                    setState(() {
                                      clicks--;
                                      _cardColorC = quizcolorgreen;
                                    });
                                  }),
                                Card(
                                    child: Container(
                                    //margin:const EdgeInsets.fromLTRB(16, 0, 16, 16),
                                    color: _cardColorD,
                                    //decoration: boxDecoration(showShadow: false, bgColor: cardButtonColor, radius: 10, color: quizwhiteBottom), //Botoes dos cards
                                    padding:const EdgeInsets.fromLTRB(16, 10, 16, 10),
                                    width: 320,
                                    child: Stack(
                                      alignment: Alignment.center,
                                      children: <Widget>[
                                        Center(
                                          child: text(planetCard[x].option4, textColor: quiztextColorSecondary)                                                  
                                        ),
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: text("D.", textColor: quiztextColorSecondary, isBold: true)
                                        )
                                      ],
                                    ),
                                  ),
                                ).onTap((){ //AO CLICAR NA LETRA D
                                    setState(() {
                                      clicks--;
                                      _cardColorD = quizcolorgreen;
                                    });
                                  }),
                              ],
                            ),
                        )
                      ],
                    )
                  ),
              ),
            ),
        ),
      );
    }
    return cardList;
  }
}

Widget quizCardSelection(var option, var option1, onPressed) {
  return InkWell(
    onTap: () {
      onPressed();
    },
    child: Container(
      margin:const EdgeInsets.fromLTRB(16, 0, 16, 16),
      decoration: boxDecoration(showShadow: false, bgColor: cardButtonColor, radius: 10, color: quizwhiteBottom), //Botoes dos cards
      padding:const EdgeInsets.fromLTRB(16, 10, 16, 10),
      width: 320,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Center(
            child: text(option1, textColor: quiztextColorSecondary),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: text(option, textColor: quiztextColorSecondary),
          )
        ],
      ),
    ),
  );
}


