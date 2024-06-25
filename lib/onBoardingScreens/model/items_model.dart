

class Chat {
  final String title;
  final String subtitle;

  Chat({
    required this.title,
    required this.subtitle,
  });
}

class Items {
  final String img;
  final String title;
  final String subTitle;
  final Chat chat;

  Items({
    required this.img,
    required this.title,
    required this.subTitle,
    required this.chat,
  });
}
/*
  How many components does the RFID system consist of?
A) One
B) Two
C) Three
D) Four (Answer: B) Two1
What are the different kinds of radio frequency identification (RFID) tags?
A) Active
B) Semi-passive
C) Passive
D) All of the above (Answer: D) All of the above1
Which tag doesn’t have its own power supply?
A) Active
B) Semi-passive
C) Passive (Answer: C) Passive1
In which RFID tag is the range less?
A) Active
B) Semi-passive
C) Passive (Answer: C) Passive1
How many components does the RFID reader consist of?
A) One
B) Two
C) Three
D) Four (Answer: C) Three1
In which frequency range does the RFID system operate?
A) High-frequency
B) Low-frequency
C) Ultra high-frequency
D) All of the above (Answer: D) All of the above1
What is the range of RFID tags using low frequency?
A) Up to 10 cm
B) Up to 60 cm
C) Up to 80 cm (Answer: A) Up to 10 cm1
What is the range of RFID tags using high frequency?
A) Up to 10 cm
B) Up to 1 meter
C) Up to 80 cm (Answer: B) Up to 1 meter1
What is the range of RFID tags using ultra-high frequency?
A) Up to 10 cm
B) Up to 60 cm
C) 10 to 15 meters (Answer: C) 10 to 15 meters1
For high-frequency and low-frequency RFID tags, the working principle is based on:
A) Inductive coupling
B) Electromagnetic coupling
C) Both A and B (Answer: C) Both A and B1
For ultra-high frequency RFID tags, the working principle is based on:
A) Inductive coupling
B) Electromagnetic coupling
C) Both A and B (Answer: B) Electromagnetic coupling
*/
//  onBoardingScreens Intro Contents for Quiz App
List<Items> listOfItems = [
  Items(
    img: "images/quiz/rfid_question.png",
    title: "Challenge your friends",
    subTitle:
    "Engage in quiz challenges with your friends\nand family using our app.",
    chat: Chat(
      title: "Quiz Challenges",
      subtitle: "Challenge your best friends to quiz battles.",
    ),
  ),
  Items(
    img: "images/quiz/rfid_question.png",
    title: "Join exciting quiz groups",
    subTitle:
    "Find and join groups that share your quiz\ninterests and participate together.",
    chat: Chat(
      title: "Quiz Groups",
      subtitle: "Join groups with quiz enthusiasts.",
    ),
  ),
  Items(
    img: "images/quiz/rfid_question.png",
    title: "Discover quiz enthusiasts",
    subTitle:
    "Connect with new people who share your\npassion for quizzes around the world.",
    chat: Chat(
      title: "Quiz Connections",
      subtitle: "Discover and chat with fellow quiz enthusiasts.",
    ),
  ),
];

