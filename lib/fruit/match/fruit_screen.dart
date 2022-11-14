import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:spelling_matching_game/fruit/match/managers/game_manager.dart';
import 'package:spelling_matching_game/fruit/match/frmatch_page.dart';

class FrMatchScreen extends StatelessWidget {
  const FrMatchScreen({Key? key}) : super(key: key);

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
          backgroundColor: Colors.green,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          titleTextStyle: TextStyle(
              fontFamily: GoogleFonts.bubblegumSans().fontFamily,
              fontSize: 40,
              color: Colors.white),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            primary: Colors.lightGreen,
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
              create: (_) => GameManager(), child: const FrMatchPage())),
    );
  }
}
