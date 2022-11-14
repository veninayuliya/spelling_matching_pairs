import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:spelling_matching_game/body/match/bdword.dart';
import 'package:spelling_matching_game/body/match/body_screen.dart';
import 'package:spelling_matching_game/body/match/error_page.dart';
import 'package:spelling_matching_game/body/match/loading_page.dart';

List<BdWord> sourceWords = [];

class BodyMatch extends StatefulWidget {
  const BodyMatch({super.key});

  @override
  State<BodyMatch> createState() => _BodyMatchState();
}

class _BodyMatchState extends State<BodyMatch> {
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
          return const BdMatchScreen();
        } else {
          return const LoadingPage();
        }
      },
    );
  }

  Future<int> populateSourceWords() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();

    final ref = FirebaseStorage.instance.ref("/body/");
    final all = await ref.listAll();

    for (var item in all.items) {
      sourceWords.add(BdWord(
          text: item.name.substring(0, item.name.indexOf('.')),
          url: await item.getDownloadURL(),
          displayText: false));
    }

    return 1;
  }
}
