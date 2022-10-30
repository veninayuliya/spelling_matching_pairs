import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spelling_matching_game/body/spell/body_controller.dart';
import 'package:spelling_matching_game/body/spell/body_spell.dart';

class BodyMessage extends StatelessWidget {
  const BodyMessage({required this.sessionCompleted, super.key});

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
      backgroundColor: const Color.fromARGB(255, 255, 82, 82),
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
                Provider.of<BodyController>(context, listen: false).reset();
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => const BodySpell()));
              } else {
                Provider.of<BodyController>(context, listen: false)
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
