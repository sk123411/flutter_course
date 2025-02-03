import 'package:flutter/material.dart';

class MyLayoutBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, dimens) {
      bool isSmallScreen = dimens.maxWidth < 600;

      return !isSmallScreen
          ? Row(
              children: [
                Flexible(
                  flex: 2,
                  child: Container(
                    color: Colors.red,
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Container(
                    color: Colors.blue,
                  ),
                )
              ],
            )
          : Column(
              children: [
                Flexible(
                  flex: 2,
                  child: Container(
                    color: Colors.red,
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Container(
                    color: Colors.blue,
                  ),
                )
              ],
            );
    });
  }
}
