import 'package:flutter/material.dart';
// import 'package:spelling_matching_game/animal/match/theme/an_theme.dart';
import 'package:google_fonts/google_fonts.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orange,
      child: Center(
        child: Text(
          'Error :( \n Check your internet connection',
          textDirection: TextDirection.ltr,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontFamily: GoogleFonts.bubblegumSans().fontFamily,
              fontSize: 40,
              color: Colors.white),
        ),
      ),
    );
  }
}
