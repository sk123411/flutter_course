import 'package:flutter/material.dart';
import 'package:flutter_course/navigation_and_routes/screen_two.dart';

class ScreenOne extends StatelessWidget {
  Color? color;
  String? screenName;

  ScreenOne(this.color, this.screenName);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: color,
        child: InkWell(
          onTap: () {

            Navigator.pushNamed(context, "second_screen");

          },
          child: Center(
            child: Text(
              "$screenName",
              style: TextStyle(color: Colors.white),
            ),

          ),
        ),
      ),
    );
  }
  
  

}
