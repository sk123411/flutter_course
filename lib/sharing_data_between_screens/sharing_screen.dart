import 'package:flutter/material.dart';
import 'package:flutter_course/api_service/person_model.dart';
import 'package:flutter_course/sharing_data_between_screens/my_prefs.dart';
import 'package:flutter_course/sharing_data_between_screens/person_details.dart';

class SharingScreen extends StatefulWidget {


  SharingScreen();

  @override
  State<SharingScreen> createState() => _SharingScreenState();
}

class _SharingScreenState extends State<SharingScreen> {


  Person? person;

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body: Center(child: Column(children: [

        Text("Name: ${person?.name}",style: TextStyle(fontSize: 24),),
        SizedBox(height: 12,),
        Text("Age: ${person?.age}")

      ],mainAxisAlignment: MainAxisAlignment.center,),),
    );
  }

  @override
  void initState() {
    getPersonDetails();

    super.initState();
  }

  void getPersonDetails() async{
    person = await MyPrefs.getUser();

    setState(() {
    });
  }
}
