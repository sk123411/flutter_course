import 'package:flutter/material.dart';
import 'package:flutter_course/navigation_and_routes/screen_one.dart';

class ParentScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: ScreenOne(Colors.red, "Screen One"),
    );
  }
}
