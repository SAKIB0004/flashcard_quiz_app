import 'package:flutter/material.dart';

import 'flashcards.dart';

class FlashcardDialog extends StatefulWidget {
  final Flashcard? flashcard;
  const FlashcardDialog({super.key, this.flashcard});

  @override
  State<FlashcardDialog> createState() => _FlashcardDialogState();
}

class _FlashcardDialogState extends State<FlashcardDialog> {
  late TextEditingController _questionController;
  late TextEditingController _answerController;

  @override
  void initState() {
    super.initState();
    _questionController = TextEditingController(text: widget.flashcard?.question ?? '');
    _answerController = TextEditingController(text: widget.flashcard?.answer ?? '');
  }

  @override
  void dispose() {
    _questionController.dispose();
    _answerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.flashcard == null ? 'Add Flashcard' : 'Edit Flashcard'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _questionController,
            decoration: InputDecoration(labelText: 'Question'),
          ),
          TextField(
            controller: _answerController,
            decoration: InputDecoration(labelText: 'Answer'),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            final newCard = Flashcard(
              question: _questionController.text.trim(),
              answer: _answerController.text.trim(),
            );
            Navigator.pop(context, newCard);
          },
          child: Text('Save'),
        ),
      ],
    );
  }
}
