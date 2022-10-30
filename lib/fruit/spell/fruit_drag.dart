import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spelling_matching_game/fruit/spell/fruit_controller.dart';

class FruitDrag extends StatefulWidget {
  const FruitDrag({
    required this.letter,
    Key? key,
  }) : super(key: key);

  final String letter;

  @override
  State<FruitDrag> createState() => _DragState();
}

class _DragState extends State<FruitDrag> {
  bool _accepted = false;

  @override
  Widget build(BuildContext context) {
    // return if true return if false
    return Selector<FruitController, bool>(
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

                      Provider.of<FruitController>(context, listen: false)
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
