import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spelling_matching_game/animal/animal_controller.dart';

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
    return Selector<AnimalController, bool>(
      selector: (_, controller) => controller.generatedWord,
      builder: (_, generate, __) {
        if (generate) {
          _accepted = false;
        }
        return Center(
          child: _accepted
              ? const SizedBox()
              : Draggable(
                  data: widget.letter,
                  onDragEnd: (details) {
                    if (details.wasAccepted) {
                      _accepted = true;
                      setState(() {});

                      Provider.of<AnimalController>(context, listen: false)
                          .incrementLetters(context: context);
                    }
                  },
                  // when drag is underway
                  childWhenDragging: const SizedBox(),
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
                        color: Colors.black,
                        fontFamily: 'FjallaOne',
                        fontSize: 40),
                  ),
                ),
        );
      },
    );
  }
}
