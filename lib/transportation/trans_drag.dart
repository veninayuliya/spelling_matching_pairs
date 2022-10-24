import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spelling_matching_game/transportation/trans_controller.dart';

class TransDrag extends StatefulWidget {
  const TransDrag({
    required this.letter,
    Key? key,
  }) : super(key: key);

  final String letter;

  @override
  State<TransDrag> createState() => _TransDragState();
}

class _TransDragState extends State<TransDrag> {
  bool _accepted = false;

  @override
  Widget build(BuildContext context) {
    // return if true return if false
    return Selector<TransController, bool>(
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

                      Provider.of<TransController>(context, listen: false)
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
