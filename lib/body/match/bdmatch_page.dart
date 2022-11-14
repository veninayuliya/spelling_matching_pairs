// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spelling_matching_game/body/match/animation/confetti.dart';
import 'package:spelling_matching_game/body/match/body_match.dart';
import 'package:spelling_matching_game/body/match/body_wordtile.dart';
import 'package:spelling_matching_game/body/match/error_page.dart';
import 'package:spelling_matching_game/body/match/loading_page.dart';
import 'package:spelling_matching_game/body/match/managers/game_manager.dart';
import 'package:spelling_matching_game/body/match/replay.dart';
import 'package:spelling_matching_game/body/body.dart';
import 'package:spelling_matching_game/body/match/bdword.dart';

class BdMatchPage extends StatefulWidget {
  const BdMatchPage({Key? key}) : super(key: key);

  @override
  State<BdMatchPage> createState() => _BdMatchPageState();
}

class _BdMatchPageState extends State<BdMatchPage> {
  late final _futureCachedImages;
  final List<BdWord> _gridWords = [];

  @override
  void initState() {
    _futureCachedImages = _cacheImages();
    _setUp();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final widthPadding = size.width * 0.10;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon:
              const Icon(Icons.arrow_back_ios_rounded, color: Colors.blueGrey),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const BodyPart()));
          },
        ),
        elevation: 0,
        backgroundColor: const Color.fromARGB(255, 249, 226, 145),
      ),
      body: FutureBuilder(
        future: _futureCachedImages,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const ErrorPage();
          }
          if (snapshot.hasData) {
            return Selector<GameManager, bool>(
              selector: (_, gameManager) => gameManager.roundCompleted,
              builder: (_, roundCompleted, __) {
                WidgetsBinding.instance.addPostFrameCallback(
                  (timeStamp) async {
                    if (roundCompleted) {
                      await showDialog(
                          barrierColor: Colors.transparent,
                          barrierDismissible: false,
                          context: context,
                          builder: (context) => const ReplayPopUp());
                    }
                  },
                );

                return Stack(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 249, 226, 145),
                      ),
                    ),
                    SafeArea(
                      child: Center(
                        child: GridView.builder(
                            shrinkWrap: true,
                            padding: EdgeInsets.only(
                                left: widthPadding, right: widthPadding),
                            itemCount: 6,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 13,
                                    mainAxisSpacing: 13,
                                    mainAxisExtent: size.height * 0.25),
                            itemBuilder: (context, index) => BdWordTile(
                                  index: index,
                                  bdword: _gridWords[index],
                                )),
                      ),
                    ),
                    ConfettiAnimation(animate: roundCompleted)
                  ],
                );
              },
            );
          } else {
            return const LoadingPage();
          }
        },
      ),
    );
  }

  _setUp() {
    sourceWords.shuffle();
    for (int i = 0; i < 3; i++) {
      _gridWords.add(sourceWords[i]);
      _gridWords.add(BdWord(
          text: sourceWords[i].text,
          url: sourceWords[i].url,
          displayText: true));
    }
    _gridWords.shuffle();
  }

  Future<int> _cacheImages() async {
    for (var w in _gridWords) {
      final image = Image.network(w.url);
      await precacheImage(image.image, context);
    }

    return 1;
  }
}
