import 'package:quiz/model/quiz_models.dart';
import 'package:quiz/utils/quiz_card.dart';
import 'package:quiz/utils/quiz_images.dart';

List<NewQuizModel> getQuizData() {
  List<NewQuizModel> list = [];
  NewQuizModel model1 = NewQuizModel();
  model1.quizName = "RFID\nSoftware and Applications";
  model1.totalQuiz = "11 Lessons";
  model1.quizImage = quizicstudy1;

  NewQuizModel model2 = NewQuizModel();
  model2.quizName = "Protocols and Security";
  model2.totalQuiz = "2 Lessons";
  model2.quizImage = quizicstudy2;

  NewQuizModel model3 = NewQuizModel();
  model3.quizName = "Circuits and Devices";
  model3.totalQuiz = "5 Lessons";
  model3.quizImage = quiziccourse3;

  NewQuizModel model4 = NewQuizModel();
  model4.quizName = "Next-Gen RFID:\n Green Technologies?";
  model4.totalQuiz = "4 Lessons";
  model4.quizImage = quiziccourse1;

  NewQuizModel model5 = NewQuizModel();
  model5.quizName = "Channel Modeling\n and Measurements";
  model5.totalQuiz = "2 Lessons";
  model5.quizImage = quiziccommunication;

  NewQuizModel model6 = NewQuizModel();
  model6.quizName = "Antenna Theory\n and Design";
  model6.totalQuiz = "4 Lessons";
  model6.quizImage = quiziccourse2;

  list.add(model1);
  list.add(model2);
  list.add(model3);
  list.add(model4);
  list.add(model5);
  list.add(model6);

  return list;
}

List<QuizTestModel> quizGetData() {
  List<QuizTestModel> list = [];
  List<Quiz> listCards =[];

  //Carrega todas as perguntas
  listCards.add(Quiz("How many components does the RFID system consist of?","One","Two","Three","Four",70.0,2));
  listCards.add(Quiz("What are the different kinds of radio frequency identification (RFID) tags?","Active","Semi-passive","Passive","All of the above",70.0,4));
  listCards.add(Quiz("Which tag doesn't have its own power supply?","Active","Semi-passive","Passive","All of the above", 70.0,3));
  listCards.add(Quiz("In which RFID tag is the range less?","Active","Semi-passive","Passive","All of the above",70.0,3));
  listCards.add(Quiz("How many components does the RFID reader consist of?","One","Two","Three","Four",70.00,3));
  listCards.add(Quiz("In which frequency range does the RFID system operate?","High-frequency","Low-frequency","Ultra high-frequency","All of the above",70.0,4));
  listCards.add(Quiz("What is the range of RFID tags using low frequency?","Up to 10 cm","Up to 60 cm","Up to 80 cm","up to 1 meter",70.0,1));
  listCards.add(Quiz("What is the range of RFID tags using high frequency?","Up to 10 cm","Up to 1 meter","Up to 80 cm","up to 1 meter",70.0,2));
  listCards.add(Quiz("What is the range of RFID tags using ultra-high frequency?","Up to 10 cm","Up to 60 cm","10 to 15 meters","up to 1 meter",70.0,3));
  listCards.add(Quiz("For high-frequency and low-frequency RFID tags, the working principle is based on:","Inductive coupling","Electromagnetic coupling","Both A and B","None of above",70.0,3));
  listCards.add(Quiz("For ultra-high frequency RFID tags, the working principle is based on:","Inductive coupling","Electromagnetic coupling","Both A and B","None of above",70.0,3));

  //Dividir por modelo


  // QUIZ 1 - RFID SoFtware and Aplications
  QuizTestModel model1 = QuizTestModel();
  model1.heading = "RFID Applications";
  model1.image = quiza1;
  model1.type = "Quiz";
  model1.description = "RFID software, middleware, and networking solutions are critical for managing RFID deployments. From inventory control in retail to smart city applications, software plays a vital role.";
  model1.status = "true";
  model1.allQuiz.add(listCards[0]);
  model1.allQuiz.add(listCards[1]);
  model1.allQuiz.add(listCards[2]);
  model1.allQuiz.add(listCards[3]);
  model1.allQuiz.add(listCards[4]);
  model1.allQuiz.add(listCards[5]);
  model1.allQuiz.add(listCards[6]);
  model1.allQuiz.add(listCards[7]);
  model1.allQuiz.add(listCards[8]);
  model1.allQuiz.add(listCards[9]);
  model1.allQuiz.add(listCards[10]);

  list.add(model1);

  // QUIZ 2 - Protocols and Security
  QuizTestModel model2 = QuizTestModel();
  model2.heading = "Protocols and Security";
  model2.image = quiza2;
  model2.type = "Quiz";
  model2.description = "Ensuring the privacy and security of RFID systems is essential. Researchers explore cryptographic techniques, anti-counterfeiting methods, and privacy-enhancing protocols.";
  model2.status = "true";
  model2.allQuiz.add(listCards[2]);
  model2.allQuiz.add(listCards[3]);

  list.add(model2);

// QUIZ 3 - Circuits and Devices
  QuizTestModel model3 = QuizTestModel();
  model3.heading = "Circuits and Devices";
  model3.image = quiza3;
  model3.type = "Quiz";
  model3.description = "Circuit designs for RFID tags and readers are essential for efficient communication. Innovations in RFID devices and interrogation techniques drive system advancements.";
  model3.status = "true";
  model3.allQuiz.add(listCards[3]);
  model3.allQuiz.add(listCards[4]);
  model1.allQuiz.add(listCards[6]);
  model1.allQuiz.add(listCards[7]);
  model1.allQuiz.add(listCards[8]);

  list.add(model3);

// QUIZ 4 - Next-Gen RFID:\n Green Technologies?
  QuizTestModel model4 = QuizTestModel();
  model4.heading = "Next-Gen RFID:\n Green Technologies?";
  model4.image = quiza4;
  model4.type = "Quiz";
  model4.description = "Researchers work on environmentally friendly RFID solutions, including energy-efficient tags and sustainable practices.";
  model4.status = "true";
  model4.allQuiz.add(listCards[5]);
  model4.allQuiz.add(listCards[8]);
  model4.allQuiz.add(listCards[1]);
  model4.allQuiz.add(listCards[2]);

  list.add(model4);

// QUIZ 5 - Channel Modeling\n and Measurements
  QuizTestModel model5 = QuizTestModel();
  model5.heading = "Channel Modeling\n and Measurements";
  model5.image = quiza5;
  model5.type = "Quiz";
  model5.description = "Understanding how radio waves propagate in different environments is essential for optimizing RFID performance. Researchers study channel models and conduct measurements to improve system reliability.";
  model5.status = "true";
  model5.allQuiz.add(listCards[4]);
  model5.allQuiz.add(listCards[5]);

  list.add(model5);

// QUIZ 6 - Antenna Theory\n and Design
  QuizTestModel model6 = QuizTestModel();
  model6.heading = "Antenna Theory\n and Design";
  model6.image = quiza6;
  model6.type = "Quiz";
  model6.description = "This area focuses on designing efficient antennas for RFID systems. Antennas play a crucial role in signal transmission and reception.";
  model6.status = "true";
  model6.allQuiz.add(listCards[8]);
  model6.allQuiz.add(listCards[9]);
  model6.allQuiz.add(listCards[10]);
  model6.allQuiz.add(listCards[7]);

  list.add(model6);

  return list;
}

List<QuizBadgesModel> quizBadgesData() {
  List<QuizBadgesModel> list = [];
  QuizBadgesModel model1 = QuizBadgesModel();
  model1.title = "Achiever";
  model1.subtitle = "Complete an exercise";
  model1.img = quiziclist2;

  QuizBadgesModel model2 = QuizBadgesModel();
  model2.title = "Perectionistf";
  model2.subtitle = "Finish All lesson of chapter";
  model2.img = quiziclist5;

  QuizBadgesModel model3 = QuizBadgesModel();
  model3.title = "Scholar";
  model3.subtitle = "Study two Cources";
  model3.img = quiziclist3;

  QuizBadgesModel model4 = QuizBadgesModel();
  model4.title = "Champion";
  model4.subtitle = "Finish #1 in Scoreboard";
  model4.img = quiziclist4;

  QuizBadgesModel model5 = QuizBadgesModel();
  model5.title = "Focused";
  model5.subtitle = "Study every day for 30 days";
  model5.img = quiziclist5;

  list.add(model1);
  list.add(model2);
  list.add(model3);
  list.add(model4);
  list.add(model5);

  return list;
}

List<QuizScoresModel> quizScoresData() {
  List<QuizScoresModel> list = [];
  QuizScoresModel model1 = QuizScoresModel();
  model1.title = "RFID SoFtware and Aplications";
  model1.totalQuiz = "5 Lessons";
  model1.img = quiziccourse1;
  model1.scores = "2/5";

  QuizScoresModel model2 = QuizScoresModel();
  model2.title = "Channel Modeling\n and Measurements";
  model2.totalQuiz = "5 Lessons";
  model2.img = quiziccourse2;
  model2.scores = "1/5";

  QuizScoresModel model3 = QuizScoresModel();
  model3.title = "Next-Gen RFID:\n Green Technologies?";
  model3.totalQuiz = "10 Quiz";
  model3.img = quiziccourse3;
  model3.scores = "4/4";

  list.add(model1);
  list.add(model2);
  list.add(model3);

  return list;
}

List<QuizContactUsModel> quizContactUsData() {
  List<QuizContactUsModel> list = [];
  QuizContactUsModel model1 = QuizContactUsModel();
  model1.title = "Call Request";
  model1.subtitle = "+55 81 9XXXX XXXX";

  QuizContactUsModel model2 = QuizContactUsModel();
  model2.title = "Email";
  model2.subtitle = "Response within 24 business hours";

  list.add(model1);
  list.add(model2);

  return list;
}
