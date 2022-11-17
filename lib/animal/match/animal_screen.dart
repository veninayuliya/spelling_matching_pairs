import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:spelling_matching_game/animal/match/anmatch_page.dart';
import 'package:spelling_matching_game/animal/match/managers/game_manager.dart';
// import 'package:spelling_matching_game/animal/match/theme/an_theme.dart';

class AnMatchScreen extends StatelessWidget {
  const AnMatchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Matching Game',
      theme: ThemeData(
        textTheme: TextTheme(
          bodyText2: TextStyle(
              fontFamily: GoogleFonts.bubblegumSans().fontFamily,
              fontSize: 40,
              color: Colors.white),
        ),
        dialogTheme: DialogTheme(
          backgroundColor: Colors.blueAccent,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          titleTextStyle: TextStyle(
              fontFamily: GoogleFonts.bubblegumSans().fontFamily,
              fontSize: 40,
              color: Colors.white),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            primary: Colors.lightBlue,
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
              create: (_) => GameManager(), child: const AnMatchPage())),
    );
  }
}
