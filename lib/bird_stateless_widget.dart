import 'package:flutter/material.dart';

class BirdStatelessWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        height: 100,
        child: Image.asset("assets/seagull.jpg"),

      ),

      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

        Text("Bird Title",style: TextStyle(
          fontSize: 18,fontWeight: FontWeight.bold
        ),),

        Text("Bird Description...", )
      ],),

    );
  }

}