import 'package:flutter/material.dart';

class MyPreferredSizedWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(


      appBar: AppBar(
        backgroundColor: Colors.red,
        centerTitle: true,
        title: Text(
          "Title One",
          style: TextStyle(color: Colors.white),
        ),
        bottom: PreferredSize(
            preferredSize: Size.fromHeight(200),
            child: Text("Title second", style: TextStyle(color: Colors.white))),
      ),
    );
  }
}
