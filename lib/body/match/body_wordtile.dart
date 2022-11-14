import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spelling_matching_game/body/match/animation/flip.dart';
import 'package:spelling_matching_game/body/match/animation/matched.dart';
import 'package:spelling_matching_game/body/match/animation/spin.dart';
import 'package:spelling_matching_game/body/match/managers/game_manager.dart';
import 'package:spelling_matching_game/body/match/bdword.dart';

class BdWordTile extends StatelessWidget {
  const BdWordTile({
    required this.index,
    required this.bdword,
    Key? key,
  }) : super(key: key);

  final int index;
  final BdWord bdword;

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
                notifier.tileTapped(index: index, word: bdword);
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
                    child: bdword.displayText
                        ? FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Transform(
                                alignment: Alignment.center,
                                transform: Matrix4.rotationY(pi),
                                child: Text(bdword.text)))
                        : Image.network(bdword.url)),
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
