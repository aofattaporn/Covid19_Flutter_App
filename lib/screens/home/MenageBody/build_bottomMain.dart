import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../constants.dart';

class build_bottomMain extends StatelessWidget {
  const build_bottomMain({
    Key? key,
    required this.size,
    required this.formatter,
  }) : super(key: key);

  final Size size;
  final String formatter;

  @override
  Widget build(BuildContext context) {
    return Container(
      // set Container
      height: size.height * 0.22,
      decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(36),
            bottomRight: Radius.circular(36),
          )),

      // Stack show date
      child: Stack(
        children: [
          // set Covid-19
          Center(
            heightFactor: 1.2,
            child: Text("COVID-19",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 50,
                    fontFamily: "Khanit",
                    fontWeight: FontWeight.bold)),
          ),

          // set Container center for show date
          Positioned(
              bottom: 20,
              left: 0,
              right: 0,
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: KDefaultPadding),
                padding: EdgeInsets.symmetric(horizontal: KDefaultPadding),
                height: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(36),
                    color: Colors.white),

                // set state showing date
                child: Text("Update : $formatter",
                    style: TextStyle(
                        fontFamily: "Khanit",
                        fontWeight: FontWeight.bold,
                        fontSize: 18)),
              )),
        ],
      ),
    );
  }
}
