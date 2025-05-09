import 'package:flutter/material.dart';
import 'package:flutter_course/form/form_validator.dart';

class SignUpCard extends StatelessWidget {

  /*

• GlobalKey<FormState>: Links the form to perform validation.

• validator:: A function that returns a string (error message) or null if valid.

• TextEditingController: Used to access the value entered in TextFormField.

  */


  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final phoneController = TextEditingController();


   SignUpCard({super.key});

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
            child: Column(
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
                  controller: emailController,
                  decoration: InputDecoration(labelText: 'Email'),
                  validator: FormValidator.validateEmail,
                ),
                TextFormField(
                  controller: phoneController,
                  decoration: InputDecoration(labelText: 'Phone'),
                  keyboardType: TextInputType.phone,
                  validator: FormValidator.validatePhone,

                ),
                TextFormField(
                  controller: passwordController,
                  decoration: InputDecoration(labelText: 'Password'),
                  obscureText: true,
                  validator: FormValidator.validatePassword,
                ),
                TextFormField(
                  controller: confirmPasswordController,
                  decoration: InputDecoration(labelText: 'Confirm Password'),
                  obscureText: true,

                  validator: (value) => FormValidator.validateConfirmPassword(
                    value,
                    passwordController.text,
                  ),
                ),

                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _submitForm,
                  child: Text('Submit'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Form is valid
      print('Name: ${nameController.text}');
      print('Email: ${emailController.text}');
      print('Phone: ${phoneController.text}');
    }
  }
}
