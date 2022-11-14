import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spelling_matching_game/body/spell/body_controller.dart';
import 'package:spelling_matching_game/splashscreen.dart';
import 'package:spelling_matching_game/transportation/spell/trans_controller.dart';

import 'animal/spell/animal_controller.dart';
import 'fruit/spell/fruit_controller.dart';

// List<AnWord> sourceWords = [];

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<AnimalController>(
          create: (_) => AnimalController()),
      ChangeNotifierProvider<FruitController>(create: (_) => FruitController()),
      ChangeNotifierProvider<BodyController>(create: (_) => BodyController()),
      ChangeNotifierProvider<TransController>(create: (_) => TransController()),
    ],
    child: const MyApp(),
  ));
  // await Firebase.initializeApp();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

// Future<int> populateSourceWords() async {

//   final ref = FirebaseStorage.instance.ref();
//   final all = await ref.listAll();

//   for(var item in all.items){
//     sourceWords.add(AnWord(text: item.name.substring(0, item.name.indexOf('.')), url: await item.getDownloadURL(), displayText: false));
//   }

//   return 1;

// }
