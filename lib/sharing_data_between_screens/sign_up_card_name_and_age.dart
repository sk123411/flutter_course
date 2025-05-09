import 'package:flutter/material.dart';
import 'package:flutter_course/api_service/person_model.dart';
import 'package:flutter_course/form/form_validator.dart';
import 'package:flutter_course/sharing_data_between_screens/my_prefs.dart';
import 'package:flutter_course/sharing_data_between_screens/sharing_screen.dart';

class SignUpCardNameAndAge extends StatelessWidget {

  /*

• GlobalKey<FormState>: Links the form to perform validation.

  */


  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final ageController = TextEditingController();



  SignUpCardNameAndAge({super.key});

  @override
  Widget build(BuildContext context) {

    return Center(
      child: Card(
        elevation: 6,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        margin: EdgeInsets.all(20),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: buildNameAndAgeUI(context),
          ),
        ),
      ),
    );
  }

  buildNameAndAgeUI(BuildContext context){

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [

        Text("Register",style: TextStyle(
            fontSize: 24
        ),),

        SizedBox(height: 12,),
        TextFormField(
          controller: nameController,
          decoration: InputDecoration(labelText: 'Name'),
          validator: FormValidator.validateName,
        ),
        TextFormField(
          controller: ageController,
          decoration: InputDecoration(labelText: 'Age'),
        ),

        ElevatedButton(
          onPressed: ()=> _submitForm(context),
          child: Text('Submit'),
        )
      ],
    );
  }


  void _submitForm(BuildContext context) async{
    if (_formKey.currentState!.validate()) {
      await MyPrefs.saveUser(Person(name: nameController.text, age: ageController.text));
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SharingScreen()),
      );

    }
  }


}
