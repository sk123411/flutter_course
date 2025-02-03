import 'package:flutter/material.dart';

class MyExpandedWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          color: Colors.red,
          width: 100,
        ),

        Container(
          color: Colors.blue,
          width: 40,
        ),
        Expanded(
          child: Container(
            color: Colors.yellow,
          ),
        ),
      ],
    );
  }
}
