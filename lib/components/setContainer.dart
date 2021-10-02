import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class setContainer extends StatelessWidget {
  const setContainer({
    Key? key,
    required this.size,
    required this.title,
    required this.color,
    required this.today,
    required this.total,
  }) : super(key: key);

  final String title;
  final Color color;
  final String today;
  final String total;

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
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
        Container(
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                today,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Khanit",
                ),
              ),
              // hard code
              Text(
                "total :  ${total}",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontFamily: "Khanit",
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
