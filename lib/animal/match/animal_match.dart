import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:spelling_matching_game/animal/match/animal_screen.dart';
import 'package:spelling_matching_game/animal/match/anword.dart';
import 'package:spelling_matching_game/animal/match/error_page.dart';
import 'package:spelling_matching_game/animal/match/loading_page.dart';

List<AnWord> sourceWords = [];

class AnimalMatch extends StatefulWidget {
  const AnimalMatch({super.key});

  @override
  State<AnimalMatch> createState() => _AnimalMatchState();
}

class _AnimalMatchState extends State<AnimalMatch> {
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
          return const AnMatchScreen();
        } else {
          return const LoadingPage();
        }
      },
    );
  }

  Future<int> populateSourceWords() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();

    final ref = FirebaseStorage.instance.ref("/animal/");
    final all = await ref.listAll();

    for (var item in all.items) {
      sourceWords.add(AnWord(
          text: item.name.substring(0, item.name.indexOf('.')),
          url: await item.getDownloadURL(),
          displayText: false));
    }

    return 1;
  }
}
