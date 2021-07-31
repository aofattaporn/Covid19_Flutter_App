import 'package:covid19_app/constants.dart';
import 'package:covid19_app/screens/home/components/setContainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class s_Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    print("test :    ${size.height}");
    print("test :     ${size.width}");
    return Column(

      children: <Widget>[

        // header container
        Container(
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
                style: TextStyle(color: Colors.white,
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
                    child: Text("Hello Test!"),
                  )),
            ],
          ),
        ),

        // center content
        Column(
          children: [
            creatWidget(color: Colors.red.shade300, title: "To day Case"),
            creatWidget(color: Colors.black54, title: "To day Death",),
            creatWidget( color: Colors.green.shade200, title: " To dat Recovered ",),
          ],
        ),

        // bottom sheet
        Expanded(
          child: Center(
            child: Container(

              decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(40),
                    topLeft: Radius.circular(40),
                )
                
              ),
              height: size.height,
              width: size.width ,
              margin: EdgeInsets.only(top: 25),


              child: Center(
                child: Text("xsssss"),
              ),
            ),
          ),
        )
      ],




    );
  }
}

