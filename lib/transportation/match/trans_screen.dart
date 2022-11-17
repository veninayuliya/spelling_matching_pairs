import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:spelling_matching_game/transportation/match/managers/game_manager.dart';
import 'package:spelling_matching_game/transportation/match/trmatch_page.dart';

class TrMatchScreen extends StatelessWidget {
  const TrMatchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Memory Game',
      theme: ThemeData(
        textTheme: TextTheme(
          bodyText2: TextStyle(
              fontFamily: GoogleFonts.bubblegumSans().fontFamily,
              fontSize: 40,
              color: Colors.white),
        ),
        dialogTheme: DialogTheme(
          backgroundColor: Colors.teal,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          titleTextStyle: TextStyle(
              fontFamily: GoogleFonts.bubblegumSans().fontFamily,
              fontSize: 40,
              color: Colors.white),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            primary: const Color.fromARGB(255, 69, 218, 183),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            textStyle: TextStyle(
                    fontFamily: GoogleFonts.bubblegumSans().fontFamily,
                    fontSize: 40,
                    color: Colors.white)
                .copyWith(fontSize: 50),
          ),
        ),
      ),
      home: Material(
          child: ChangeNotifierProvider(
              create: (_) => GameManager(), child: const TrMatchPage())),
    );
  }
}
