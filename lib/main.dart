import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spelling_matching_game/body/spell/body_controller.dart';
import 'package:spelling_matching_game/splashscreen.dart';
import 'package:spelling_matching_game/transportation/spell/trans_controller.dart';

import 'animal/spell/animal_controller.dart';
import 'fruit/spell/fruit_controller.dart';

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
