import 'package:flutter/material.dart';

class AnWordTile extends StatelessWidget {
  const AnWordTile({
    required this.index,
    Key? key,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 169, 209, 226),
      child: Text(index.toString()),
    );
  }
}
