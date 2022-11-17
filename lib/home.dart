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
              color: const Color.fromARGB(255, 204, 113, 218),
              elevation: 15,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Animal()));
                },
                splashColor: const Color.fromARGB(255, 111, 15, 159),
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
                          'Animals',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontFamily: 'FjallaOne',
                              fontWeight: FontWeight.w100),
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
              color: const Color.fromARGB(255, 164, 225, 89),
              elevation: 15,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Fruit()));
                },
                splashColor: const Color.fromARGB(255, 108, 201, 8),
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
                          'Fruits',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontFamily: 'FjallaOne',
                              fontWeight: FontWeight.w100),
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
              color: const Color.fromARGB(255, 254, 187, 85),
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
                splashColor: const Color.fromARGB(255, 238, 165, 6),
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
                              color: Colors.black,
                              fontFamily: 'FjallaOne',
                              fontWeight: FontWeight.w100),
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
              color: const Color.fromARGB(255, 101, 182, 249),
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
                          'Vehicles',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontFamily: 'FjallaOne',
                              fontWeight: FontWeight.w100),
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
