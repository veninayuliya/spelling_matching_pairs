import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spelling_matching_game/transportation/match/animation/flip.dart';
import 'package:spelling_matching_game/transportation/match/animation/matched.dart';
import 'package:spelling_matching_game/transportation/match/animation/spin.dart';
import 'package:spelling_matching_game/transportation/match/managers/game_manager.dart';
import 'package:spelling_matching_game/transportation/match/trword.dart';

class TrWordTile extends StatelessWidget {
  const TrWordTile({
    required this.index,
    required this.trword,
    Key? key,
  }) : super(key: key);

  final int index;
  final TrWord trword;

  @override
  Widget build(BuildContext context) {
    return SpinAnimation(
      child: Consumer<GameManager>(
        builder: (_, notifier, __) {
          bool animate = checkAnimationRun(notifier);

          return GestureDetector(
            onTap: () {
              if (!notifier.ignoreTaps &&
                  !notifier.answeredWords.contains(index) &&
                  !notifier.tappedWords.containsKey(index)) {
                notifier.tileTapped(index: index, word: trword);
              }
            },
            child: FlipAnimation(
              delay: notifier.reverseFlip ? 1500 : 0,
              reverse: notifier.reverseFlip,
              animationCompleted: (isForward) {
                notifier.onAnimationCompleted(isForward: isForward);
              },
              animate: animate,
              word: MatchedAnimation(
                numberOfWordsAnswered: notifier.answeredWords.length,
                animate: notifier.answeredWords.contains(index),
                child: Container(
                    padding: const EdgeInsets.all(16),
                    child: trword.displayText
                        ? FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Transform(
                                alignment: Alignment.center,
                                transform: Matrix4.rotationY(pi),
                                child: Text(trword.text)))
                        : Image.network(trword.url)),
              ),
            ),
          );
        },
      ),
    );
  }

  bool checkAnimationRun(GameManager notifier) {
    bool animate = false;

    if (notifier.canFlip) {
      if (notifier.tappedWords.isNotEmpty &&
          notifier.tappedWords.keys.last == index) {
        animate = true;
      }
      if (notifier.reverseFlip && !notifier.answeredWords.contains(index)) {
        animate = true;
      }
    }
    return animate;
  }
}
