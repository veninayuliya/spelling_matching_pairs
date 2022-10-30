import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spelling_matching_game/fruit/spell/fruit_animation.dart';
import 'package:spelling_matching_game/fruit/spell/fruit_controller.dart';
import 'package:spelling_matching_game/fruit/spell/fruit_drag.dart';
import 'package:spelling_matching_game/fruit/spell/fruit_drop.dart';
import 'package:spelling_matching_game/fruit/spell/fruit_progressbar.dart';
import 'package:spelling_matching_game/fruit/spell/fruit_words.dart';

class FruitSpell extends StatefulWidget {
  const FruitSpell({super.key});

  @override
  State<FruitSpell> createState() => _FruitSpellState();
}

class _FruitSpellState extends State<FruitSpell> {
  final List<String> _frwords = fruitWords.toList();
  late String _frword, _frdropWord; ////

  _generatedWord() {
    final r = Random().nextInt(_frwords.length);
    _frword = _frwords[r];
    // print(_word);
    _frdropWord = _frwords[r];
    _frwords.removeAt(r);
    final s = _frword.characters.toList()..shuffle(); ////
    _frword = s.join(); ////
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<FruitController>(context, listen: false)
          .setUp(total: _frword.length); ////
      Provider.of<FruitController>(context, listen: false)
          .requestWord(request: false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Selector<FruitController, bool>(
      selector: (_, controller) => controller.generatedWord,
      builder: (_, generate, __) {
        if (generate) {
          if (_frwords.isNotEmpty) {
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
              backgroundColor: const Color.fromARGB(255, 198, 237, 185),
            ),
            body: Column(
              children: [
                Expanded(
                  flex: 7,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 198, 237, 185),
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
                              'What fruit is this ?',
                              style: TextStyle(
                                  fontFamily: 'FjallaOne', fontSize: 16),
                            ),
                          ),
                        ),
                        Expanded(
                            child: Center(
                          child: FrAnimation(
                            animate: true,
                            child: Image.asset(
                              'assets/images/fruits/$_frdropWord.png',
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
                            children: _frdropWord.characters ////
                                .map((e) => FrAnimation(
                                      animate: true,
                                      child: FruitDrop(
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
                            children: _frword.characters
                                .map(
                                  (e) => FrAnimation(
                                    animate: true,
                                    child: FruitDrag(
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
                  child: FrProgressBar(),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
