import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:spelling_matching_game/body/body_message.dart';
import 'package:spelling_matching_game/body/body_words.dart';

class BodyController extends ChangeNotifier {
  int totalLetters = 0, lettersAnswered = 0, wordsAnswered = 0;
  bool generatedWord = true, sessionCompleted = false;
  double percentCompleted = 0;

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
      AudioCache().play('audios/correct3.mp3');
      // print('completed');
      wordsAnswered++;
      percentCompleted = wordsAnswered / bodyWords.length;
      if (wordsAnswered == bodyWords.length) {
        sessionCompleted = true;
      }
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (_) => BodyMessage(
                sessionCompleted: sessionCompleted,
              ));
    } else {
      AudioCache().play('audios/correct1.mp3');
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
    percentCompleted = 0;
  }
}
