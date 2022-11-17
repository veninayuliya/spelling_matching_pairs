import 'package:flutter/material.dart';
import 'package:spelling_matching_game/animal/match/animal_match.dart';
import 'package:spelling_matching_game/animal/spell/animal_spell.dart';
import 'package:spelling_matching_game/home.dart';

class Animal extends StatelessWidget {
  const Animal({super.key});

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
        backgroundColor: const Color.fromARGB(255, 204, 235, 248),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/bgan.png'), fit: BoxFit.fill),
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
                      backgroundColor: const Color.fromARGB(255, 210, 184, 231),
                    ),
                    icon: const ImageIcon(
                      AssetImage("assets/images/spelling.png"),
                      color: Colors.black87,
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AnimalSpell()));
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
                      backgroundColor: const Color.fromARGB(255, 210, 184, 231),
                    ),
                    icon: const ImageIcon(
                      AssetImage("assets/images/memory.png"),
                      color: Colors.black87,
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AnimalMatch()));
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
