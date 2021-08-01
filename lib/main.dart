import 'package:covid19_app/constants.dart';
import 'package:covid19_app/screens/home_sceens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return

      MaterialApp(

      debugShowCheckedModeBanner: false,

      title: "Covid-19 Demo",

      // set Theme
      theme: ThemeData(
        scaffoldBackgroundColor: kBackgroundColor,
        primaryColor: kPrimaryColor,
        textTheme: Theme.of(context).textTheme.apply(bodyColor: kTextColor),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        canvasColor: Colors.transparent,
      ),


      // theme: ThemeData.dark(),

      home: Home_screens(),


    );
  }


}