import 'package:flutter/material.dart';

class ScreenFour extends StatelessWidget {

  Color? color;
  String? screenName;

  ScreenFour(this.color,this.screenName);
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      body: Container(
        color: color,
        child: InkWell(
          onTap: () {

            Navigator.pushNamed(context, "five_screen");

          },
          child: Center(
            child: Text("$screenName"),
          ),
        ),
        
      ),
    );
  }
}
