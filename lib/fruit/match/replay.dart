import 'dart:math';

import 'package:flutter/material.dart';
import 'package:spelling_matching_game/fruit/match/animation/spin.dart';
import 'package:spelling_matching_game/fruit/match/fruit_match.dart';

const messages = ['Awesome!', 'Fantastic!', 'Nice!', 'Great!'];

class ReplayPopUp extends StatelessWidget {
  const ReplayPopUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final r = Random().nextInt(messages.length);
    String message = messages[r];

    return SpinAnimation(
      child: AlertDialog(
        title: Text(
          message,
          textAlign: TextAlign.center,
        ),
        actionsAlignment: MainAxisAlignment.center,
        actions: [
          Container(
              padding: const EdgeInsets.all(12),
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        PageRouteBuilder(
                            pageBuilder: (_, __, ___) => const FruitMatch()),
                        (route) => false);
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Replay!'),
                  )))
        ],
      ),
    );
  }
}
