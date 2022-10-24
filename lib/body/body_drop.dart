import 'package:flutter/material.dart';

class BodyDrop extends StatelessWidget {
  const BodyDrop({
    required this.letter,
    Key? key,
  }) : super(key: key);

  final String letter;

  @override
  Widget build(BuildContext context) {
    bool accepted = false;

    return DragTarget(
      onWillAccept: (data) {
        if (data == letter) {
          // ignore: avoid_print
          print('accepted');
          return true;
        } else {
          // ignore: avoid_print
          print('rejected');
          return false;
        }
      },
      onAccept: (data) {
        accepted = true;
      },
      builder: (context, candidateData, rejectedData) {
        if (accepted) {
          return Text(
            letter,
            style: const TextStyle(
                color: Colors.black, fontFamily: 'FjallaOne', fontSize: 40),
          );
        } else {
          return Container(
            color: const Color.fromARGB(255, 249, 209, 209),
            width: 50,
            height: 50,
          );
        }
      },
    );
  }
}
