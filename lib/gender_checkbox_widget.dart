import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GenderCheckboxWidget extends StatelessWidget {
  var genderCheckboxController = Get.put(GenderCheckboxController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Gender",
          style: TextStyle(fontSize: 24),
        ),
        SizedBox(
          height: 12,
        ),
        Row(
          children: [

            //GetX State Management Using Obx
            Obx(
              ()=> Checkbox(
                value: genderCheckboxController.checkboxValue.value,
                onChanged: (v) {
                  genderCheckboxController.checkboxValue.value = v!;
                },
              ),
            ),

            SizedBox(height: 12,),

            Text("Male")
          ],
        ),

        Row(
          children: [
            //GetX State Management Using GetBuilder
            GetBuilder<GenderCheckboxController>(builder: (_){

              return Checkbox(
                value: genderCheckboxController.checkboxValueUsingGetBuilder,
                onChanged: (v) {
                  genderCheckboxController.tickGenderCheckBox(v!);

                },
              );
            }),
            SizedBox(height: 12,),

            Text("Male")
          ],
        )



      ],
    );
  }
}

class GenderCheckboxController extends GetxController {
  Rx<bool> checkboxValue = false.obs;
  bool checkboxValueUsingGetBuilder = false;


  void tickGenderCheckBox(bool value){
    checkboxValueUsingGetBuilder = value;
    update();
  }


}
