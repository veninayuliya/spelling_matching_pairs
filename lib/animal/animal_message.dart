import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:spelling_matching_game/animal/animal_controller.dart';
import 'package:spelling_matching_game/animal/animal_spell.dart';

class AnimalMessage extends StatelessWidget {
  const AnimalMessage({required this.sessionCompleted, super.key});

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
      backgroundColor: Colors.amber,
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
                Provider.of<AnimalController>(context, listen: false).reset();
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const AnimalSpell()));
              } else {
                Provider.of<AnimalController>(context, listen: false)
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
