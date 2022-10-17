// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:spelling_matching_game/animal/animal.dart';
import 'package:spelling_matching_game/body/body.dart';
import 'package:spelling_matching_game/fruit/fruit.dart';
import 'package:spelling_matching_game/transportation/transportation.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: GridView.count(
          padding: const EdgeInsets.fromLTRB(25, 270, 20, 30),
          crossAxisCount: 2,
          mainAxisSpacing: 50,
          children: <Widget>[
            Card(
              color: const Color.fromARGB(255, 245, 198, 252),
              elevation: 15,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Animal()));
                },
                splashColor: const Color.fromARGB(255, 174, 78, 222),
                child: Center(
                  child: Column(
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset('assets/images/animal.jpg'),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(2.0),
                        child: Text(
                          'Animal',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              margin: const EdgeInsets.only(
                left: 20,
                right: 20,
                top: 5,
              ),
            ),
            Card(
              color: const Color.fromARGB(255, 206, 251, 150),
              elevation: 15,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Fruit()));
                },
                splashColor: const Color.fromARGB(255, 130, 234, 18),
                child: Center(
                  child: Column(
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset('assets/images/fruit.jpg'),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(2.0),
                        child: Text(
                          'Fruit',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              margin: const EdgeInsets.only(
                left: 20,
                right: 20,
                top: 5,
              ),
            ),
            Card(
              color: const Color.fromARGB(255, 251, 214, 158),
              elevation: 15,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const BodyPart()));
                },
                splashColor: const Color.fromARGB(255, 252, 180, 24),
                child: Center(
                  child: Column(
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset('assets/images/body.png'),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(2.0),
                        child: Text(
                          'Body Parts',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              margin: const EdgeInsets.only(
                left: 20,
                right: 20,
                top: 5,
              ),
            ),
            Card(
              color: const Color.fromARGB(255, 158, 210, 252),
              elevation: 15,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Transportation()));
                },
                splashColor: const Color.fromARGB(255, 13, 86, 189),
                child: Center(
                  child: Column(
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset('assets/images/transportation.jpg'),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(2.0),
                        child: Text(
                          'Transportation',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              margin: const EdgeInsets.only(
                left: 20,
                right: 20,
                top: 5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
