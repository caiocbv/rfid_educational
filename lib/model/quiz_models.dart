import 'package:rfid_educational/utils/quiz_card.dart';

class NewQuizModel {
  var quizName = "";
  var totalQuiz = "";
  var quizImage = "";
}

class QuizTestModel {
  var heading = "";
  var image = "";
  var description = "";
  var type = "";
  var status = "";
  List<Quiz> allQuiz = [];
}

class QuizRecentSearchDataModel {
  var name = "";
}

class QuizBadgesModel {
  var title = "";
  var subtitle = "";
  var img = "";
}

class QuizScoresModel {
  var title = "";
  var totalQuiz = "";
  var img = "";
  var scores = "";
}

class QuizContactUsModel {
  var title = "";
  var subtitle = "";
}
