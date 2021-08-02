import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class buid_waitLoading extends StatelessWidget {
  const buid_waitLoading({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: size.height * 0.499,
      color: Colors.white,
      child: Text("LOADING...",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontFamily: "Khanit", fontSize: 20)),
    );
  }
}
