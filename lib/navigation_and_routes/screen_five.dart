import 'package:flutter/material.dart';

class ScreenFive extends StatelessWidget {

  Color? color;
  String? screenName;

  ScreenFive(this.color,this.screenName);
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      body: Container(
        color: color,
        child: InkWell(
          onTap: () {

            Navigator.pushNamed(context, "first_screen");

          },
          child: Center(
            child: Text("$screenName"),
          ),
        ),
        
      ),
    );
  }
}
