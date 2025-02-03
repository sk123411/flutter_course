import 'package:flutter/material.dart';

class MyFlexibleWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: Container(
            color: Colors.red,
          ),
          flex: 1,
        ),

        Flexible(
          child: Container(
            color: Colors.yellow,
          ),
          flex: 1,
        ),


        Flexible(
          child: Container(
            color: Colors.blue,
          ),
          flex: 1,
        )
      ],
    );
  }
}
