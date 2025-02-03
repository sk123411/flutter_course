import 'package:flutter/material.dart';

class ScreenTwo extends StatelessWidget {

  Color? color;
  String? screenName;

  ScreenTwo(this.color,this.screenName);
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      body: Container(
        color: color,
        child: InkWell(
          onTap: () {

            Navigator.pushNamed(context, "third_screen");

          },
          child: Center(
            child: Text("$screenName"),
          ),
        ),
        
      ),
    );
  }
}
