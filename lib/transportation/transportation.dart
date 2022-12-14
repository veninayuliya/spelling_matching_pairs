import 'package:flutter/material.dart';
import 'package:spelling_matching_game/home.dart';
import 'package:spelling_matching_game/transportation/match/trans_match.dart';
import 'package:spelling_matching_game/transportation/spell/trans_spell.dart';

class Transportation extends StatelessWidget {
  const Transportation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon:
              const Icon(Icons.arrow_back_ios_rounded, color: Colors.blueGrey),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const HomePage()));
          },
        ),
        elevation: 0,
        backgroundColor: const Color.fromARGB(255, 212, 255, 255),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/bgtr.png'), fit: BoxFit.fill),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Center(
                child: SizedBox(
                  height: 60,
                  width: 140,
                  child: ElevatedButton.icon(
                    style: TextButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 130, 185, 235),
                    ),
                    icon: const ImageIcon(
                      AssetImage("assets/images/spelling.png"),
                      color: Colors.black87,
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const TransSpell()));
                    },
                    label: const Text(
                      'Spell',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontFamily: 'FjallaOne'),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Center(
                child: SizedBox(
                  height: 60,
                  width: 140,
                  child: ElevatedButton.icon(
                    style: TextButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 130, 185, 235),
                    ),
                    icon: const ImageIcon(
                      AssetImage("assets/images/memory.png"),
                      color: Colors.black87,
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const TRMatch()));
                    },
                    label: const Text(
                      'Match',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontFamily: 'FjallaOne'),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
