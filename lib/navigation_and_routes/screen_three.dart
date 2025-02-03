import 'package:flutter/material.dart';

class ScreenThree extends StatelessWidget {

  Color? color;
  String? screenName;

  ScreenThree(this.color,this.screenName);
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      body: Container(
        color: color,
        child: InkWell(
          onTap: () {

            Navigator.pushNamed(context, "four_screen");

          },
          child: Center(
            child: Text("$screenName"),
          ),
        ),
        
      ),
    );
  }
}
