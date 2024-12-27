import 'dart:math';

import 'package:flutter/material.dart';

class RandomColorChangerWidget extends StatefulWidget {

  @override
  State<RandomColorChangerWidget> createState() => _RandomColorChangerWidgetState();
}

class _RandomColorChangerWidgetState extends State<RandomColorChangerWidget> {
  Color color = Colors.black;

  var colorList = [Colors.black, Colors.red, Colors.blue,
    Colors.grey, Colors.green, Colors.orange];

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          color = getRandomColor();

        });
      },
      child: Container(
        height: 200,
        width: 200,
        color: color,
      ),
    );

  }

  Color getRandomColor() {
    int random = Random().nextInt(colorList.length);
    return colorList[random];
  }
}