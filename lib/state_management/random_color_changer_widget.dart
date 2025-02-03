import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RandomColorChangerWidget extends StatelessWidget {


  var randomColorChangerController = RandomColorChangerController();


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        randomColorChangerController.color.value
        = randomColorChangerController.getRandomColor();
      },
      child: Obx(
        ()=> Container(
          height: 200,
          width: 200,
          color: randomColorChangerController.color.value,
        ),
      ),
    );

  }




}

class RandomColorChangerController extends GetxController {

  Rx<Color> color = Colors.black.obs;

  var colorList = [Colors.black, Colors.red, Colors.blue,
    Colors.grey, Colors.green, Colors.orange];


  Color getRandomColor() {
    int random = Random().nextInt(colorList.length);
    return colorList[random];
  }


}
