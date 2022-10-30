import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spelling_matching_game/transportation/spell/trans_controller.dart';
import 'package:spelling_matching_game/transportation/spell/trans_spell.dart';

class TransMessage extends StatelessWidget {
  const TransMessage({required this.sessionCompleted, super.key});

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
      backgroundColor: const Color.fromARGB(255, 49, 182, 166),
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
                Provider.of<TransController>(context, listen: false).reset();
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const TransSpell()));
              } else {
                Provider.of<TransController>(context, listen: false)
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
