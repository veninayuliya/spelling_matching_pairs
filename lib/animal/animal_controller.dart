// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spelling_matching_game/animal/animal_message.dart';
import 'package:spelling_matching_game/animal/animal_words.dart';

class AnimalController extends ChangeNotifier {
  int totalLetters = 0, lettersAnswered = 0, wordsAnswered = 0;
  bool generatedWord = true, sessionCompleted = false;

  setUp({required int total}) {
    lettersAnswered = 0;
    totalLetters = total;
    // print('total letters $totalLetters');
    notifyListeners();
  }

  incrementLetters({required BuildContext context}) {
    lettersAnswered++;
    // print('letters answered $lettersAnswered');
    if (lettersAnswered == totalLetters) {
      // print('completed');
      wordsAnswered++;
      if (wordsAnswered == animalWords.length) {
        sessionCompleted = true;
      }
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (_) => AnimalMessage(
                sessionCompleted: sessionCompleted,
              ));
    }
    notifyListeners();
  }

  requestWord({required bool request}) {
    generatedWord = request;
    notifyListeners();
  }

  reset() {
    sessionCompleted = false;
    wordsAnswered = 0;
    generatedWord = true;
  }
}
