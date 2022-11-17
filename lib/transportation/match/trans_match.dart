import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:spelling_matching_game/transportation/match/error_page.dart';
import 'package:spelling_matching_game/transportation/match/loading_page.dart';
import 'package:spelling_matching_game/transportation/match/trans_screen.dart';
import 'package:spelling_matching_game/transportation/match/trword.dart';

List<TrWord> sourceWords = [];

class TRMatch extends StatefulWidget {
  const TRMatch({super.key});

  @override
  State<TRMatch> createState() => _TRMatchState();
}

class _TRMatchState extends State<TRMatch> {
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
          return const TrMatchScreen();
        } else {
          return const LoadingPage();
        }
      },
    );
  }

  Future<int> populateSourceWords() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();

    final ref = FirebaseStorage.instance.ref("/transportation/");
    final all = await ref.listAll();

    for (var item in all.items) {
      sourceWords.add(TrWord(
          text: item.name.substring(0, item.name.indexOf('.')),
          url: await item.getDownloadURL(),
          displayText: false));
    }

    return 1;
  }
}
