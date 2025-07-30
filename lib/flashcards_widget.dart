import 'package:flutter/material.dart';
import 'flashcards.dart';

class FlashcardWidget extends StatefulWidget {
  final Flashcard flashcard;
  FlashcardWidget({required this.flashcard});

  @override
  _FlashcardWidgetState createState() => _FlashcardWidgetState();
}

class _FlashcardWidgetState extends State<FlashcardWidget> with SingleTickerProviderStateMixin {
  bool _showBack = false;
  late AnimationController _controller;
  late Animation<double> _flipAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: Duration(milliseconds: 400), vsync: this);
    _flipAnimation = Tween<double>(begin: 0, end: 1).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggleCard() {
    setState(() {
      _showBack = !_showBack;
      if (_showBack) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _flipAnimation,
      builder: (context, child) {
        final isFront = _flipAnimation.value < 0.5;
        return GestureDetector(
          onTap: _toggleCard,
          child: AnimatedBuilder(
            animation: _flipAnimation,
            builder: (context, child) {
              final isFront = _flipAnimation.value < 0.5;

              return Transform(
                alignment: Alignment.center,
                transform: Matrix4.rotationY(_flipAnimation.value * 3.1416),
                child: Container(
                  height: 200,
                  width: 300,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [BoxShadow(blurRadius: 10, color: Colors.black26)],
                  ),
                  child: Transform(
                    alignment: Alignment.center,
                    transform: isFront
                        ? Matrix4.identity()
                        : Matrix4.rotationY(3.1416), // Flip text back
                    child: Text(
                      isFront
                          ? widget.flashcard.question
                          : widget.flashcard.answer,
                      style: TextStyle(fontSize: 20),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              );
            },
          ),
        );

      },
    );
  }
}
