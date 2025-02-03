import 'package:flutter/material.dart';

class MyWrapWidget extends StatelessWidget {
  const MyWrapWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      child: Wrap(
        direction: Axis.horizontal,
        children: List.generate(20, (index) {
          return ElevatedButton(onPressed: () {}, child: Text("Button $index"));
        }),
      ),
    );
  }
}
