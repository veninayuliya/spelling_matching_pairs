import 'package:flutter/material.dart';

class Drag extends StatefulWidget {
  const Drag({
    required this.letter,
    Key? key,
  }) : super(key: key);

  final String letter;

  @override
  State<Drag> createState() => _DragState();
}

class _DragState extends State<Drag> {
  bool _accepted = false;

  @override
  Widget build(BuildContext context) {
    // return if true return if false
    return _accepted
        ? SizedBox()
        : Draggable(
            data: widget.letter,
            onDragEnd: (details) {
              if (details.wasAccepted) {
                _accepted = true;
                setState(() {});
              }
            },
            // when drag is underway
            childWhenDragging: SizedBox(),
            feedback: Text(
              widget.letter,
              style: const TextStyle(
                color: Colors.black,
                fontFamily: 'FjallaOne',
                fontSize: 40,
              ),
            ),
            child: Text(
              widget.letter,
              style: const TextStyle(
                  color: Colors.black, fontFamily: 'FjallaOne', fontSize: 40),
            ),
          );
  }
}
