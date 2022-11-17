import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spelling_matching_game/transportation/spell/trans_animation.dart';
import 'package:spelling_matching_game/transportation/spell/trans_controller.dart';
import 'package:spelling_matching_game/transportation/spell/trans_drag.dart';
import 'package:spelling_matching_game/transportation/spell/trans_drop.dart';
import 'package:spelling_matching_game/transportation/spell/trans_progressbar.dart';
import 'package:spelling_matching_game/transportation/spell/trans_words.dart';
import 'package:spelling_matching_game/transportation/transportation.dart';

class TransSpell extends StatefulWidget {
  const TransSpell({super.key});

  @override
  State<TransSpell> createState() => _TransSpellState();
}

class _TransSpellState extends State<TransSpell> {
  final List<String> _trwords = transWords.toList();
  late String _trword, _trdropWord; ////

  _generatedWord() {
    final r = Random().nextInt(_trwords.length);
    _trword = _trwords[r];
    // print(_word);
    _trdropWord = _trwords[r];
    _trwords.removeAt(r);
    final s = _trword.characters.toList()..shuffle(); ////
    _trword = s.join(); ////
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<TransController>(context, listen: false)
          .setUp(total: _trword.length); ////
      Provider.of<TransController>(context, listen: false)
          .requestWord(request: false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Selector<TransController, bool>(
      selector: (_, controller) => controller.generatedWord,
      builder: (_, generate, __) {
        if (generate) {
          if (_trwords.isNotEmpty) {
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
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Transportation()));
                },
              ),
              elevation: 0,
              backgroundColor: const Color.fromARGB(255, 150, 192, 232),
            ),
            body: Column(
              children: [
                Expanded(
                  flex: 7,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 150, 192, 232),
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
                              'What is this ?',
                              style: TextStyle(
                                  fontFamily: 'FjallaOne',
                                  fontSize: 16,
                                  color: Colors.black),
                            ),
                          ),
                        ),
                        Expanded(
                            child: Center(
                          child: TrAnimation(
                            animate: true,
                            child: Image.asset(
                              'assets/images/transportation/$_trdropWord.png',
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
                            children: _trdropWord.characters ////
                                .map((e) => TrAnimation(
                                      animate: true,
                                      child: TransDrop(
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
                            children: _trword.characters
                                .map(
                                  (e) => TrAnimation(
                                    animate: true,
                                    child: TransDrag(
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
                  child: TransProgressBar(),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
