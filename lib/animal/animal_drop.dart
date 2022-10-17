import 'package:flutter/material.dart';

class Drop extends StatelessWidget {
  const Drop({
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
          print('accepted');
          return true;
        } else {
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
            color: Colors.amber,
            width: 50,
            height: 50,
          );
        }
      },
    );
  }
}
