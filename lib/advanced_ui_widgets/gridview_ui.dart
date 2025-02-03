import 'package:flutter/material.dart';

class GridviewUi extends StatelessWidget {
  var assetList = [
    "assets/seagull.jpg",
    "assets/girl.jpg",
    "assets/seagull.jpg",
    "assets/girl.jpg",
    "assets/seagull.jpg",
    "assets/girl.jpg",
    "assets/seagull.jpg",
    "assets/girl.jpg",
    "assets/seagull.jpg",
    "assets/girl.jpg"
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2
                ),
        itemBuilder: (c, index) {
          return Image.asset(assetList[index]);
        }, itemCount: assetList.length,);
  }

  buildGridWIthCount() {
    return GridView.count(
      crossAxisCount: 3,
      crossAxisSpacing: 8,
      mainAxisSpacing: 8,
      children: List.generate(assetList.length, (index) {
        return Image.asset(assetList[index]);
      }),
    );
  }
}
