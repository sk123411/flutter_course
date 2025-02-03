import 'package:flutter/material.dart';

var assetList = [

  "assets/seagull.jpg",
  "assets/girl.jpg",

  "assets/seagull.jpg",
  "assets/girl.jpg",


  "assets/seagull.jpg",
  "assets/girl.jpg",

  "assets/seagull.jpg",
  "assets/girl.jpg"
];

class ListViewUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,

      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.only(bottom: 12,right: 12),
          child: Image.asset(assetList[index],
          height: 100,width: 200,
          ),
        );
      },
      itemCount: assetList.length,
    );
  }
}
