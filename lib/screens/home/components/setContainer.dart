import 'package:covid19_app/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class creatWidget extends StatelessWidget {
  const creatWidget({
    Key? key,
    required this.color,
    required this.title,
  }) : super(key: key);

  // final double margin_left;
  final Color color;
  final String title;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(children: <Widget>[
      // title
      Container(
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontFamily: "khanit",
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        height: size.height * 0.06,
        width: size.width * 0.46,
        decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.circular(20),
        ),
        margin: EdgeInsets.only(left: 10),
      ),

      // container
      Container(
        // Container set
        height: 100,
        width: size.width * 0.46,
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  blurRadius: 5,
                  spreadRadius: 2)
            ]),

        margin: EdgeInsets.only(top: 30, left: 12),

        // contend
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "17,334",
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
                fontFamily: "Khanit",
              ),
            ),
            // hard code
            Text(
              "จากยอด 23,344",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontFamily: "Khanit",
              ),
            )
          ],
        ),
      ),
    ]);
  }
}
