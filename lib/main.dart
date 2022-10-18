import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spelling_matching_game/splashscreen.dart';

import 'animal/animal_controller.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (_) => AnimalController(), child: const MyApp()));
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
