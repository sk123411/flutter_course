import 'package:flutter/material.dart';
import 'package:flutter_course/custom_widgets/custom_button.dart';
import 'package:flutter_course/custom_widgets/custom_card.dart';
import 'package:flutter_course/custom_widgets/gradient_button.dart';
import 'package:flutter_course/custom_widgets/labelled_text_field.dart';
import 'package:flutter_course/custom_widgets/loading_widget.dart';
import 'package:flutter_course/custom_widgets/my_utility.dart';

class CustomScreen extends StatelessWidget {
  CustomScreen({super.key});

  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: ListView(
        children: [


          Text("Labelled Text UI",style: TextStyle(fontWeight: FontWeight.bold),),
          SizedBox(height: 8,),
          buildLabelledTextInputUI(),
          Text("Image Card UI",style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 8,),
          buildImageCardUI(),
          SizedBox(height: 8,),
          Text("Loading Widget",style: TextStyle(fontWeight: FontWeight.bold)),
          LoadingWidget(message: "Signing up...",),
          SizedBox(height: 8,),

          Text("Gradient Button Widget",style: TextStyle(fontWeight: FontWeight.bold)),
          GradientButton(label: "Login/Sign up", onPressed: (){


            Utilities.showCustomSnackbar(context, "Signing up",color: Colors.blue);

          })

        ],
      ),
    );
  }

  buildLabelledTextInputUI() {
    return Column(children: [
      LabeledTextField(label: "Name",
        hintText: "Enter Name", controller: nameController,

        validator: (value) {
          if (value != null && value.isNotEmpty) {
            return null;
          }
          return "Enter valid name";
        },

      ),


      SizedBox(height: 4,),


      LabeledTextField(
        label: "Password",
        hintText: "Enter Password",
        controller: passwordController,
        obscureText: true,

        validator: (value) {
          if (value != null && value.isNotEmpty) {
            return null;
          }
          return "Enter valid password";
        },

      ),

      SizedBox(height: 4,),

      CustomButton(label: "Sign up", onPressed: () {
        print("Sign up");
      }),

    ],);
  }

  buildImageCardUI() {
    return Column(children: List.generate(1, (index) {
      return CustomCard(title: "Bird $index",
          subtitle: "beautiful bird $index",
          imageUrl: "https://cdn.pixabay.com/photo/2025/04/23/01/35/bird-9551361_1280.jpg");
    }),);
  }
}
