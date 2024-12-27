import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GenderCheckboxWidget extends StatefulWidget{
  @override
  State<GenderCheckboxWidget> createState() => _GenderCheckboxWidgetState();
}

class _GenderCheckboxWidgetState extends State<GenderCheckboxWidget> {
  bool checkboxValue = true;


  @override
  Widget build(BuildContext context) {

  return Column(children: [
    Text("Gender",style: TextStyle(fontSize: 24),),
    SizedBox(height: 12,),

    Row(
      children: [
        Checkbox(value: checkboxValue, onChanged: (v){

          setState(() {
            checkboxValue = v!;

          });


        },),

        Text("Male")
      ],
    )

  ],);
  }
}

class GenderCheckboxController extends GetxController{


}