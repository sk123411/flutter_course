import 'package:flutter/material.dart';


class ResponsiveTestApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Responsive UI Test',
      home: ResponsiveTestScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ResponsiveTestScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double width = constraints.maxWidth;
        double height = constraints.maxHeight;

        return Scaffold(
          appBar: AppBar(
            title: Text('Responsive Screen Test'),
            backgroundColor: Colors.black87,
          ),
          body: Column(
            children: [
              Container(
                height: height * 0.2,
                width: width,
                color: Colors.red,
                child: Center(
                  child: Text(
                    'Top (20%)',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ),
              Container(
                height: height * 0.3,
                width: width,
                color: Colors.green,
                child: Center(
                  child: Text(
                    'Middle (30%)',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  width: width,
                  color: Colors.blue,
                  child: Center(
                    child: Text(
                      'Bottom (Remaining)',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}