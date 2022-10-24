import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spelling_matching_game/body/body.dart';
import 'package:spelling_matching_game/body/body_animation.dart';
import 'package:spelling_matching_game/body/body_controller.dart';
import 'package:spelling_matching_game/body/body_drag.dart';
import 'package:spelling_matching_game/body/body_drop.dart';
import 'package:spelling_matching_game/body/body_progressbar.dart';
import 'package:spelling_matching_game/body/body_words.dart';

class BodySpell extends StatefulWidget {
  const BodySpell({super.key});

  @override
  State<BodySpell> createState() => _BodySpellState();
}

class _BodySpellState extends State<BodySpell> {
  final List<String> _bdwords = bodyWords.toList();
  late String _bdword, _bddropWord; ////

  _generatedWord() {
    final r = Random().nextInt(_bdwords.length);
    _bdword = _bdwords[r];
    // print(_word);
    _bddropWord = _bdwords[r];
    _bdwords.removeAt(r);
    final s = _bdword.characters.toList()..shuffle(); ////
    _bdword = s.join(); ////
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<BodyController>(context, listen: false)
          .setUp(total: _bdword.length); ////
      Provider.of<BodyController>(context, listen: false)
          .requestWord(request: false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Selector<BodyController, bool>(
      selector: (_, controller) => controller.generatedWord,
      builder: (_, generate, __) {
        if (generate) {
          if (_bdwords.isNotEmpty) {
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
                          builder: (context) => const BodyPart()));
                },
              ),
              elevation: 0,
              backgroundColor: const Color.fromARGB(255, 249, 226, 145),
            ),
            body: Column(
              children: [
                Expanded(
                  flex: 7,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 249, 226, 145),
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
                              'What part is this ?',
                              style: TextStyle(
                                  fontFamily: 'FjallaOne', fontSize: 16),
                            ),
                          ),
                        ),
                        Expanded(
                            child: Center(
                          child: BdAnimation(
                            animate: true,
                            child: Image.asset(
                              'assets/images/body/$_bddropWord.png',
                              width: 300,
                              height: 270,
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
                            children: _bddropWord.characters ////
                                .map((e) => BdAnimation(
                                      animate: true,
                                      child: BodyDrop(
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
                            children: _bdword.characters
                                .map(
                                  (e) => BdAnimation(
                                    animate: true,
                                    child: BodyDrag(
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
                Expanded(
                  flex: 1,
                  child: Container(
                    color: Colors.purple,
                    child: const BodyProgressBar(),
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
