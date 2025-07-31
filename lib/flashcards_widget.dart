import 'flashcards.dart';
import 'package:flutter/material.dart';

class FlashcardWidget extends StatefulWidget {
  final Flashcard flashcards;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const FlashcardWidget({
    super.key,
    required this.flashcards,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  State<FlashcardWidget> createState() => _FlashcardWidgetState();
}

class _FlashcardWidgetState extends State<FlashcardWidget> {
  bool _showBack = false;
  void _toggleCard() {
    setState(() {
      _showBack = !_showBack;
    });
  }



  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
            children: [
              Container(
                width: 300,
                height: 200,
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: _showBack ? Colors.lightBlue.shade100 : Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    _showBack ? widget.flashcards.answer : widget.flashcards
                        .question,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.brown.shade800,
                    ),
                  ),
                ),
              ),

              Positioned(
                top: 20,
                right: 10,
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.edit),
                      tooltip: 'Edit this flashcard',
                      onPressed: widget.onEdit,
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete),
                      tooltip: 'Delete this flashcard',
                      onPressed: widget.onDelete,
                    ),
                  ],
                ),
              )
            ]
        ),

        ElevatedButton(
          onPressed: _toggleCard,
          child: Text(_showBack ? 'Show Question' : 'Show Answer'),
        ),
      ],
    );
  }
}

