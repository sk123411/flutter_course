import 'package:flutter/material.dart';
import 'package:flutter_course/advanced_ui_widgets/gridview_ui.dart';
import 'package:flutter_course/advanced_ui_widgets/listview_ui.dart';
import 'package:flutter_course/advanced_ui_widgets/my_expanded_widget.dart';
import 'package:flutter_course/advanced_ui_widgets/my_flexible_widget.dart';
import 'package:flutter_course/advanced_ui_widgets/my_layout_builder.dart';
import 'package:flutter_course/advanced_ui_widgets/my_stack_widget.dart';
import 'package:flutter_course/advanced_ui_widgets/my_wrap_widget.dart';
import 'package:flutter_course/advanced_ui_widgets/preferred_sized_widget.dart';
import 'package:flutter_course/api_service/api_test_screen.dart';
import 'package:flutter_course/api_service/person_model.dart';
import 'package:flutter_course/custom_fonts/custom_font_screen.dart';
import 'package:flutter_course/custom_widgets/custom_screen.dart';
import 'package:flutter_course/custom_widgets/custom_widgets_demo_screen.dart';
import 'package:flutter_course/form/sign_up_card.dart';
import 'package:flutter_course/helper/helper_methods_screen.dart';
import 'package:flutter_course/navigation_and_routes/parent_screen.dart';
import 'package:flutter_course/navigation_and_routes/screen_five.dart';
import 'package:flutter_course/navigation_and_routes/screen_four.dart';
import 'package:flutter_course/navigation_and_routes/screen_one.dart';
import 'package:flutter_course/navigation_and_routes/screen_three.dart';
import 'package:flutter_course/navigation_and_routes/screen_two.dart';
import 'package:flutter_course/state_management/our_home_widget.dart';
import 'package:google_fonts/google_fonts.dart';

import 'responsive_ui/responsive_test_app.dart';
import 'sharing_data_between_screens/sign_up_card_name_and_age.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {


    var person = Person("Dhiraj", 16);
    var personWithNamedConst = Person.named(name: "Vinod", age: 41);

    print("Initials : ${person.createDefault(name: "Raju",age: 24)}");




    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        body: ResponsiveTestScreen()
      ),



      // initialRoute: "first_screen",
      //
      // // routes: {
      // //   "first_screen":(context) => ScreenOne(Colors.red, "Screen One"),
      // //   "second_screen":(context) => ScreenTwo(Colors.yellow, "Screen Two"),
      // //   "third_screen":(context) => ScreenThree(Colors.grey, "Screen Three"),
      // //   "four_screen":(context) => ScreenFour(Colors.blue, "Screen Four"),
      // //   "five_screen":(context) => ScreenFive(Colors.green, "Screen Five"),
      // // },
      // onGenerateRoute: (settings){
      //
      //   if(settings.name == "first_screen"){
      //
      //     return MaterialPageRoute(builder: (context) => ScreenOne(Colors.red, "Screen One"));
      //   }else if(settings.name == "second_screen"){
      //
      //     return MaterialPageRoute(builder: (context) => ScreenTwo(Colors.yellow, "Screen Two"));
      //
      //   }else if(settings.name == "third_screen"){
      //
      //     return MaterialPageRoute(builder: (context) => ScreenThree(Colors.grey, "Screen Three"));
      //
      //   }else if(settings.name == "four_screen"){
      //
      //     return MaterialPageRoute(builder: (context) =>  ScreenFour(Colors.blue, "Screen Four"));
      //
      //   }else if(settings.name == "five_screen"){
      //
      //     return MaterialPageRoute(builder: (context) => ScreenFive(Colors.green, "Screen Five"));
      //
      //   }
      //
      //
      // },

    );
  }
}
