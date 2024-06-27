import 'dart:ffi';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:rfid_educational/Screens/quiz_card_score.dart';
import 'package:rfid_educational/Screens/repo_screen.dart';
import 'package:rfid_educational/model/quiz_models.dart';
import 'package:rfid_educational/utils/app_widget.dart';
import 'package:rfid_educational/utils/quiz_card.dart';
import 'package:rfid_educational/utils/quiz_colors.dart';
import 'package:rfid_educational/utils/quiz_constant.dart';
import 'package:rfid_educational/utils/quiz_data_generator.dart';
import 'package:rfid_educational/utils/quiz_images.dart';

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
  late int currentlyCard = 0;
  late int totalCards = 0;
  late int hitCards = 0;
  late int lastCard = 0;
  late int position;
  late double progressionLine = 0;
  late bool buttonPressed=false;
   late bool resposta=false;
  late Color _cardColorA = quizwhite;
  late Color _cardColorB = quizwhite; 
  late Color _cardColorC = quizwhite; 
  late Color _cardColorD = quizwhite; 

  _QuizCardsState(this.position);

  void removeCards(index) {
    setState(() {
      cardList.removeAt(index);
    });
    //refresh();
  }

  void addCards() {
    setState(() {
      cardList = _generateCards(this.position);
    });
  }

  void removeAllCards() {
    setState(() {
      cardList.clear();
    });
  }

  void refresh(){
    removeAllCards();
    addCards();
  }

  void colorReset(){
    setState(() {
    _cardColorA = quizwhite;
    _cardColorB = quizwhite;
    _cardColorC = quizwhite;
    _cardColorD = quizwhite;
    });
  }

  void currentlyCardUpdate(){
    setState(() {
      this.currentlyCard++;
    });
  }

  @override
  void initState() {
    super.initState();
    cardList = _generateCards(this.position);
    lastCard = cardList.length;
    currentlyCard = 0;
    progressionLine = 0;
    buttonPressed=false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: quizappbackground,
        body: SafeArea(
          child: GestureDetector(
            child: Stack(              
              alignment: Alignment.bottomCenter,
              children: <Widget>[
                Container(
                  alignment: Alignment.topCenter,
                  child: 
                    Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            IconButton( //Botao X canto superior esquerdo
                              onPressed: () {
                                finish(context);
                              },
                              icon:const Icon(
                                Icons.close,
                                color: Colors.black45,                                
                                //size: 40,
                              ),
                            ),
                            Expanded(
                              child:
                                LinearProgressIndicator( //IMAGEM PROGRESSAO VERDE EM CIMA
                                  value: (progressionLine/lastCard) > 1.0 ? 1.0 : progressionLine/lastCard, //calculando a porcentacem de cards passados
                                  backgroundColor: grey.withOpacity(0.6),//textSecondaryColor.withOpacity(0.3),
                                  valueColor:const AlwaysStoppedAnimation<Color>(
                                    quizgreen,
                                  ),
                                  minHeight: 10,
                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                                )
                                .paddingTop(MediaQuery.of(context).size.width*0.07)
                                .paddingRight(MediaQuery.of(context).size.width*0.1)
                                .paddingBottom(MediaQuery.of(context).size.width*0.07),
                            )
                          ],
                        ),
                      ],
                    ),
                ),
                // const SizedBox(height: 100, ), // POR QUE ISSO NAO FUNCIONA?
                Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child:
                    Stack(
                      alignment: Alignment.center,
                      children: cardList
                    )
                )
              ],
            ),
          ),
        ));
  }

  List<Widget> _generateCards(int position) {
    List<QuizTestModel> Allquiz = quizGetData();
    List<Quiz>planetCard = [];
    planetCard.addAll(Allquiz.elementAt(position).allQuiz);

    if(currentlyCard > 0){
      List<Quiz> tempCards = [];
      tempCards.addAll(planetCard.sublist(0,totalCards-currentlyCard));
      planetCard.clear();
      planetCard.addAll(tempCards);
    }else{
      totalCards = planetCard.length;
    }

    for (int x = 0; x < planetCard.length; x++) { //PECORRE CADA UM DOS CARDS DAQUELE QUIZ
      cardList.add(
        Positioned(
          top: planetCard[x].topMargin,
          child: 
            Draggable(
              onDragEnd: (drag) {
                if(resposta){
                  resposta=false;
                  hitCards++;
                }   
                if (x == 0) {
                  setState(() {
                     QuizCardsScore(hitCards,totalCards).launch(context); //Quando finalizar os cards do QUIZ
                  });
                }                 
                progressionLine++;
                currentlyCardUpdate();
                colorReset();
                refresh();
              },
              childWhenDragging: null,
//FEEDBACK              
              feedback: Material( //<<<<<<<<<<<<<<<<<<<<<<<<<<< MOSTRADO AO ARRASTAR COM O DEDO
                child: 
                  GestureDetector(
                  //onTap: isPressedColorChange,
                  child: Container(
                    decoration: boxDecoration(radius: 20, bgColor: quizwhiteBottom, showShadow: true),
                    child: 
                      Column(
                      children: <Widget>[
                        SizedBox(
                          height: 300.0,
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
                                    text(planetCard[x].cardImage, fontSize: textSizeNormal, fontFamily: fontBold, isLongText: true),
                                  ]
                              ),
                            ),
                        ),
                        Container(
                            padding:const EdgeInsets.only(top: 10.0, bottom: 10.0),
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
                                    child:
                                      Stack(
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
//Original Card
              child: GestureDetector(
                child: Container(
                    decoration: boxDecoration(radius: 20, bgColor: quizwhiteBottom, showShadow: true),
                    child: 
                    Column(
                      children: <Widget>[
                        SizedBox(
                          height: 300.0,
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
                                    text(planetCard[x].cardImage, fontSize: textSizeNormal, fontFamily: fontBold, isLongText: true),
                                  ]
                              ),
                            ),
                        ),
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
                                      resposta=planetCard[x].correctedOption==1;//A=1, B=2, C=3, D=4 
                                      _cardColorA = resposta?quizcolorgreen:quizcolorred.withOpacity(0.3);
                                    });
                                    refresh();
                                  }),
                                Card(
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
                                      resposta=planetCard[x].correctedOption==2;//A=1, B=2, C=3, D=4   
                                      _cardColorB = resposta?quizcolorgreen:quizcolorred.withOpacity(0.3);
                                    });
                                    refresh();
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
                                      resposta=planetCard[x].correctedOption==3;//A=1, B=2, C=3, D=4     
                                      _cardColorC = resposta?quizcolorgreen:quizcolorred.withOpacity(0.3);
                                    });
                                    refresh();
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
                                      resposta=planetCard[x].correctedOption==4;//A=1, B=2, C=3, D=4  
                                      _cardColorD = resposta?quizcolorgreen:quizcolorred.withOpacity(0.3);
                                    });
                                    refresh();
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




