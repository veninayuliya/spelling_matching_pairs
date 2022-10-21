import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spelling_matching_game/fruit/fruit_controller.dart';
import 'package:spelling_matching_game/fruit/fruit_spell.dart';

class FruitMessage extends StatelessWidget {
  const FruitMessage({required this.sessionCompleted, super.key});

  final bool sessionCompleted;

  @override
  Widget build(BuildContext context) {
    String title = "Well Done!";
    String buttonText = "New Word";
    if (sessionCompleted) {
      title = "All Words Completed";
      buttonText = "Replay";
    }

    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      backgroundColor: Color.fromARGB(255, 216, 113, 235),
      title: Center(
        child: Text(
          title,
          style: const TextStyle(
              fontFamily: 'PartyConfetti', fontSize: 50, color: Colors.white),
        ),
      ),
      actionsAlignment: MainAxisAlignment.center,
      actions: [
        ElevatedButton(
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            )),
            onPressed: () {
              if (sessionCompleted) {
                Provider.of<FruitController>(context, listen: false).reset();
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const FruitSpell()));
              } else {
                Provider.of<FruitController>(context, listen: false)
                    .requestWord(request: true);
                Navigator.of(context).pop();
              }
            },
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: Text(
                buttonText,
                style: const TextStyle(
                    fontFamily: 'PartyConfetti',
                    fontSize: 30,
                    color: Colors.white),
              ),
            ))
      ],
    );
  }
}
