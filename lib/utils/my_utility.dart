import 'package:flutter/material.dart';

class Utilities {

  static void showCustomSnackbar(BuildContext context, String message, {Color color = Colors.red}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: color,
      ),
    );
  }

}