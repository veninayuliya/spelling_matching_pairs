import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:spelling_matching_game/animal/animal_drag.dart';
import 'package:spelling_matching_game/animal/animal_drop.dart';
import 'package:spelling_matching_game/animal/animal_words.dart';

class AnimalSpell extends StatefulWidget {
  const AnimalSpell({super.key});

  @override
  State<AnimalSpell> createState() => _AnimalSpellState();
}

class _AnimalSpellState extends State<AnimalSpell> {
// private var
  List<String> _words = animalWords.toList();
  late String _word, _dropWord;

  @override
  void initState() {
    final r = Random().nextInt(_words.length);
    _word = _words[r];
    // print(_word);
    _dropWord = _words[r];
    final s = _word.characters.toList()..shuffle();
    _word = s.join();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon:
              const Icon(Icons.arrow_back_ios_rounded, color: Colors.blueGrey),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 0,
        backgroundColor: const Color.fromARGB(255, 209, 188, 225),
      ),
      body: SafeArea(
        child: Column(
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
                  children: const [
                    Expanded(
                      child: Center(
                        child: Text(
                          'What animal is this ?',
                          style:
                              TextStyle(fontFamily: 'FjallaOne', fontSize: 16),
                        ),
                      ),
                    ),
                    Expanded(child: Center())
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
                        children: _dropWord.characters
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
                        children: _word.characters
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
  }
}
