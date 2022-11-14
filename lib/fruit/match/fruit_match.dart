import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:spelling_matching_game/fruit/match/error_page.dart';
import 'package:spelling_matching_game/fruit/match/loading_page.dart';
import 'package:spelling_matching_game/fruit/match/fruit_screen.dart';
import 'package:spelling_matching_game/fruit/match/frword.dart';

List<FrWord> sourceWords = [];

class FruitMatch extends StatefulWidget {
  const FruitMatch({super.key});

  @override
  State<FruitMatch> createState() => _FruitMatchState();
}

class _FruitMatchState extends State<FruitMatch> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: populateSourceWords(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Material(
            child: ErrorPage(),
          );
        }
        if (snapshot.hasData) {
          return const FrMatchScreen();
        } else {
          return const LoadingPage();
        }
      },
    );
  }

  Future<int> populateSourceWords() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();

    final ref = FirebaseStorage.instance.ref("/fruit/");
    final all = await ref.listAll();

    for (var item in all.items) {
      sourceWords.add(FrWord(
          text: item.name.substring(0, item.name.indexOf('.')),
          url: await item.getDownloadURL(),
          displayText: false));
    }

    return 1;
  }
}
