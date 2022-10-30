import 'package:flutter/material.dart';
import 'package:spelling_matching_game/animal/animal_wordtile.dart';

class AnimalMatch extends StatefulWidget {
  const AnimalMatch({super.key});

  @override
  State<AnimalMatch> createState() => _AnimalMatchState();
}

class _AnimalMatchState extends State<AnimalMatch> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final widthPadding = size.width * 0.10;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_rounded,
                color: Colors.blueGrey),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        body: Center(
          child: GridView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.only(left: widthPadding, right: widthPadding),
              itemCount: 8,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  mainAxisExtent: size.height * 0.20),
              itemBuilder: (context, index) => AnWordTile(
                    index: index,
                  )),
        ),
      ),
    );
  }
}
