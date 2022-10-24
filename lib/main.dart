import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spelling_matching_game/body/body_controller.dart';
import 'package:spelling_matching_game/splashscreen.dart';
import 'package:spelling_matching_game/transportation/trans_controller.dart';

import 'animal/animal_controller.dart';
import 'fruit/fruit_controller.dart';

void main() {
  runApp(
      // ChangeNotifierProvider(
      //   create: (_) => AnimalController(),
      //   child: const MyApp(),
      // ),
      MultiProvider(
    providers: [
      ChangeNotifierProvider<AnimalController>(
          create: (_) => AnimalController()),
      ChangeNotifierProvider<FruitController>(create: (_) => FruitController()),
      ChangeNotifierProvider<BodyController>(create: (_) => BodyController()),
      ChangeNotifierProvider<TransController>(create: (_) => TransController()),
      // Provider<SomethingElse>(create: (_) => SomethingElse()),
      // Provider<AnotherThing>(create: (_) => AnotherThing()),
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
