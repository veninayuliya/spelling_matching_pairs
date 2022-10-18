import 'dart:math';

import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:spelling_matching_game/animal/animal_drag.dart';
import 'package:spelling_matching_game/animal/animal_drop.dart';
import 'package:spelling_matching_game/animal/animal_words.dart';
import 'animal_controller.dart';

class AnimalSpell extends StatefulWidget {
  const AnimalSpell({super.key});

  @override
  State<AnimalSpell> createState() => _AnimalSpellState();
}

class _AnimalSpellState extends State<AnimalSpell> {
// private var
  final List<String> _words = animalWords.toList();
  late String _word, _dropWord; ////

  _generatedWord() {
    final r = Random().nextInt(_words.length);
    _word = _words[r];
    // print(_word);
    _dropWord = _words[r];
    _words.removeAt(r);
    final s = _word.characters.toList()..shuffle(); ////
    _word = s.join(); ////
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<AnimalController>(context, listen: false)
          .setUp(total: _word.length); ////
      Provider.of<AnimalController>(context, listen: false)
          .requestWord(request: false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Selector<AnimalController, bool>(
      selector: (_, controller) => controller.generatedWord,
      builder: (_, generate, __) {
        if (generate) {
          if (_words.isNotEmpty) {
            _generatedWord();
          }
        }
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              leading: IconButton(
                icon: const Icon(Icons.arrow_back_ios_rounded,
                    color: Colors.blueGrey),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              elevation: 0,
              backgroundColor: const Color.fromARGB(255, 209, 188, 225),
            ),
            body: Column(
              children: [
                Expanded(
                  flex: 7,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 209, 188, 225),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(80),
                          bottomRight: Radius.circular(80)),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        // ignore: prefer_const_constructors
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Center(
                            child: Text(
                              'What animal is this ?',
                              style: TextStyle(
                                  fontFamily: 'FjallaOne', fontSize: 16),
                            ),
                          ),
                        ),
                        Expanded(
                            child: Center(
                          child: Image.asset(
                            'assets/images/$_dropWord.png',
                            width: 350,
                            height: 300,
                          ),
                        ))
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Column(
                    children: [
                      Expanded(
                        child: Container(
                          color: Colors.white,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: _dropWord.characters ////
                                .map((e) => Drop(
                                      letter: e,
                                    ))
                                .toList(),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          color: Colors.white,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: _word.characters ////
                                .map((e) => Drag(
                                      letter: e,
                                    ))
                                .toList(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    color: Colors.purple,
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
