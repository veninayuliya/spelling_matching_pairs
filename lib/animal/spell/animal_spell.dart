import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spelling_matching_game/animal/animal.dart';
import 'package:spelling_matching_game/animal/spell/animal_animation.dart';
import 'package:spelling_matching_game/animal/spell/animal_drag.dart';
import 'package:spelling_matching_game/animal/spell/animal_drop.dart';
import 'package:spelling_matching_game/animal/spell/animal_progressbar.dart';
import 'package:spelling_matching_game/animal/spell/animal_words.dart';
import 'animal_controller.dart';

class AnimalSpell extends StatefulWidget {
  const AnimalSpell({super.key});

  @override
  State<AnimalSpell> createState() => _AnimalSpellState();
}

class _AnimalSpellState extends State<AnimalSpell> {
// private var
  final List<String> _anwords = animalWords.toList();
  late String _anword, _andropWord; ////

  _generatedWord() {
    final r = Random().nextInt(_anwords.length);
    _anword = _anwords[r];
    _andropWord = _anwords[r];
    _anwords.removeAt(r);
    final s = _anword.characters.toList()..shuffle(); ////
    _anword = s.join(); ////
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<AnimalController>(context, listen: false)
          .setUp(total: _anword.length); ////
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
          if (_anwords.isNotEmpty) {
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
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Animal()));
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
                                  fontFamily: 'FjallaOne',
                                  fontSize: 16,
                                  color: Colors.black),
                            ),
                          ),
                        ),
                        Expanded(
                            child: Center(
                          child: AnAnimation(
                            animate: true,
                            child: Image.asset(
                              'assets/images/animals/$_andropWord.png',
                              width: 270,
                              height: 230,
                            ),
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
                            children: _andropWord.characters ////
                                .map((e) => AnAnimation(
                                      animate: true,
                                      child: AnimalDrop(
                                        letter: e,
                                      ),
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
                            children: _anword.characters
                                .map(
                                  (e) => AnAnimation(
                                    animate: true,
                                    child: AnimalDrag(
                                      letter: e,
                                    ),
                                  ),
                                )
                                .toList(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Expanded(
                  flex: 1,
                  child: AnProgressBar(),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
