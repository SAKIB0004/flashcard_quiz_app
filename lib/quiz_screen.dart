import 'package:flutter/material.dart';

import 'flashcards.dart';
import 'flashcards_widget.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  final List<Flashcard> flashcards = [
    Flashcard(question: 'What is Flutter?', answer: 'A UI toolkit for building apps.'),
    Flashcard(question: 'Who created Dart?', answer: 'Google.'),
    Flashcard(question: 'What is StatefulWidget?', answer: 'A widget that can change state.'),
    Flashcard(question: 'What is StatelessWidget?', answer: 'A widget that does not change state.'),
    Flashcard(question: 'What is Widget in Flutter?', answer: 'Everything in Flutter is a widget.'),
    Flashcard(question: 'What is hot reload?', answer: 'A feature that allows quick UI updates without restarting the app.'),
    Flashcard(question: 'What is pubspec.yaml?', answer: 'A configuration file for Flutter projects.'),
    Flashcard(question: 'What is Scaffold?', answer: 'A widget that provides a framework for basic material design layout.'),
    Flashcard(question: 'What is Navigator?', answer: 'A widget that manages a stack of routes.'),
    Flashcard(question: 'What is BuildContext?', answer: 'It provides context about the location of a widget in the widget tree.')
  ];


  int currentIndex = 0;

  void _nextCard() {
    setState(() {
      if (currentIndex < flashcards.length - 1) currentIndex++;
    });
  }
  void _previousCard() {
    setState(() {
      if (currentIndex > 0) currentIndex--;
    });
  }



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.menu,
                      color: Colors.brown.shade800,
                      size: 32,
                    ),
                    onPressed: () {
                      //drawer: showDrawer();
                    },
                  ),

                  Text("Quiz Test",
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.brown.shade600,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  CircleAvatar(
                    radius: 30, // You can adjust the size
                    backgroundImage: AssetImage("images/intro_Screen.png"),
                  ),
                ],
              ),
            ),
            SizedBox(height: 160),

            FlashcardWidget(flashcard: flashcards[currentIndex]),

            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(onPressed: _previousCard, child: Text("Previous")),
                ElevatedButton(onPressed: _nextCard, child: Text("Next")),
              ],
            )

          ],
        ),





        /* bottomNavigationBar: NavigationBar(
            backgroundColor: Colors.transparent,
            selectedIndex: 0,
            onDestinationSelected: (int index){
              /// Handle navigation here
            },
            indicatorColor: Colors.lightBlueAccent.shade400,
            height: 60,
            destinations: [
              NavigationDestination(icon: Icon(Icons.home), label: "Home"),
              NavigationDestination(icon: Icon(Icons.favorite), label: "favorite"),
              NavigationDestination(icon: Icon(Icons.shopping_cart), label: "Cart"),
            ]
        ),*/
      ),
    );
  }
}
