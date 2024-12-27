import 'package:flutter/material.dart';

class Girl extends StatefulWidget {

  @override
  State<Girl> createState() => _GirlState();
}

class _GirlState extends State<Girl> {
  Color frameColor = Colors.black;

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,

      children: [

        Container(height: 300, width: 300,
          decoration: BoxDecoration(
            border: Border.all(
              color: frameColor,
              width: 10

            )
          ),
          child: Image.asset("assets/girl.jpg"),
        ),

        SizedBox(height: 12,),

        ElevatedButton(onPressed: () {

        setState(() {
          frameColor = Colors.red;

        });

        }, child: Text(""
            "Change Frame Color"))
      ],
    );
  }
}