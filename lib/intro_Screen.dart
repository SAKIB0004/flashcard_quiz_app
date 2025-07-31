import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Welcome to the Flashcard Quiz!',
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            const SizedBox(height: 40),
            Image.asset(
                "images/intro_Screen.png",
                width: 300,
                height: 300,
                fit: BoxFit.cover,

            ),

            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/quiz');
              },
              child: AnimatedContainer(
                duration: Duration(milliseconds: 700),
                margin: const EdgeInsets.symmetric(vertical: 50, horizontal: 100),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.lightBlue.shade100,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Center(
                  child: Text(
                    'Start Quiz',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              )
            ),
          ],
        ),
      ),
    );
  }
}
