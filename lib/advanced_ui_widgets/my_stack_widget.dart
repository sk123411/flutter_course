import 'package:flutter/material.dart';

class MyStackWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: 400,
            color: Colors.red,
          ),
          Positioned(
            child: Container(
                width: 200,
                height: 200,
                child: Image.asset("assets/girl.jpg")),
          )
        ],
      ),
    );
  }
}
