import 'package:flutter/cupertino.dart';
import 'package:flutter_course/bird_stateless_widget.dart';
import 'package:flutter_course/gender_checkbox_widget.dart';
import 'package:flutter_course/girl_widget.dart';
import 'package:flutter_course/random_color_changer_widget.dart';

class OurHomeWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(child: RandomColorChangerWidget()));

  }


  Widget buildBird(){
    return Container(
      height: 250,
      child: ListView.builder(itemBuilder: (context,index){
        return BirdStatelessWidget();
      },itemCount: 10,),

    );
  }

}