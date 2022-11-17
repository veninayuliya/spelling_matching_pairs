import 'package:flutter/material.dart';
import 'package:spelling_matching_game/fruit/match/fruit_match.dart';
import 'package:spelling_matching_game/fruit/spell/fruit_spell.dart';
import 'package:spelling_matching_game/home.dart';

class Fruit extends StatelessWidget {
  const Fruit({super.key});

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
        backgroundColor: const Color.fromARGB(255, 221, 255, 239),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/bgfr.png'), fit: BoxFit.fill),
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
                      backgroundColor: const Color.fromARGB(255, 200, 237, 122),
                    ),
                    icon: const ImageIcon(
                      AssetImage("assets/images/spelling.png"),
                      color: Colors.black87,
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const FruitSpell()));
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
                      backgroundColor: const Color.fromARGB(255, 200, 237, 122),
                    ),
                    icon: const ImageIcon(
                      AssetImage("assets/images/memory.png"),
                      color: Colors.black87,
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const FruitMatch()));
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
