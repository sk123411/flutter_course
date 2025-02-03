import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Girl extends StatelessWidget {
  var girlStateController = GirlStateController();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Obx(
              () => Container(
            height: 300,
            width: 300,
            decoration: BoxDecoration(
                border: Border.all(
                    color: girlStateController.frameColor.value, width: 10)),
            child: Image.asset("assets/girl.jpg"),
          ),
        ),
        SizedBox(
          height: 12,
        ),
        ElevatedButton(
            onPressed: () {

              girlStateController.frameColor.value = Colors.red;

            },
            child: Text(""
                "Change Frame Color"))
      ],
    );
  }
}

class GirlStateController extends GetxController {
  //Manage the states of Girl Class

  Rx<Color> frameColor = Colors.black.obs;
}
