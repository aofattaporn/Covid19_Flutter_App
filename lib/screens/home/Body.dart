import 'package:covid19_app/constants.dart';
import 'package:covid19_app/model/model.dart';
import 'package:covid19_app/screens/home/components/setContainer.dart';
import 'package:covid19_app/service/service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

import 'components/LineChartWidget.dart';
import 'components/LineTitles.dart';

class stful_Body extends StatefulWidget {
  @override
  _stful_BodyState createState() => _stful_BodyState();
}

class _stful_BodyState extends State<stful_Body> {

  // constant variable
  Model model = new Model();
  bool isLoading = false;
  List timeline = [];

  // initState
  @override
  void initState() {
    callService();
    update();
  }

  //  callSerivc
  Future<void> update() async {
    var response = await Service().showTimeLine();
    setState(() {
      timeline = response["Data"].reversed.toList().sublist(0, 10);
    });
    LineTitles(timeline);
  }

  Future<void> callService() async {
    var response = await Service().showCovid();

    var f = NumberFormat('###,###');
    // print("response: $response");
    setState(() {
      isLoading = true;

      model.todayCase = f.format(response["todayCases"]).toString();

      model.totalCases = f.format(response["cases"]).toString();

      model.todayDeaths = f.format(response["deaths"]).toString();
      model.totalDeaths = f.format(response["todayDeaths"]).toString();

      model.todayRecovered = f.format(response["todayRecovered"]).toString();
      model.totalRecovered = f.format(response["recovered"]).toString();
    });
  }

  // body state ment
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    DateTime now = new DateTime.now();
    String formatter = DateFormat('dd / MM / yyyy').format(now);

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
        ),

        // center content
        Column(
          children: [
            isLoading
                // ShowContent
                ? Column(
                    children: [
                      setContainer(
                          size: size,
                          title: "Covid Case",
                          color: Colors.red.shade300,
                          today: model.todayCase,
                          total: model.totalCases),
                      setContainer(
                          size: size,
                          title: "Death Case",
                          color: Colors.black54,
                          today: model.todayDeaths,
                          total: model.totalDeaths),
                      setContainer(
                          size: size,
                          title: "Recovered",
                          color: Colors.green.shade300,
                          today: model.todayRecovered,
                          total: model.totalRecovered),
                    ],
                  )

                // Loading
                : Column(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        height: size.height * 0.499,
                        color: Colors.white,
                        child: Text("LOADING...",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: "Khanit",
                                fontSize: 20)),
                      )
                    ],
                    mainAxisAlignment: MainAxisAlignment.end,
                  )
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
                  )),
              height: size.height,
              width: size.width,
              margin: EdgeInsets.only(top: 25),
              child: Center(
                child: TextButton(
                  onPressed: () => showModalBottomSheet(
                    context: context,
                    builder: (context) => creatingSheet(),
                  ),
                  child: Column(
                    children: [
                      Container(
                        width: 10,
                        height: 10,
                        child: Icon(
                          Icons.arrow_upward,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Tap to watch graft",
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Khanit",
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  // set creatingSheet
  Widget creatingSheet() => Container(
        decoration: BoxDecoration(
            color: kPrimaryColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(36),
              topRight: Radius.circular(36),
            )),
        padding: EdgeInsets.only(
          top: 40,
        ),
        child: Column(
          children: [
            Text(" NewConfirmed graph ",
                style: TextStyle(
                    letterSpacing: 2,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    fontFamily: "Khanit")),

            Container(
              margin: EdgeInsets.symmetric(vertical: 28, horizontal: 10),
              height: 300,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  // color: Colors.white24
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        blurRadius: 5,
                        spreadRadius: 2)
                  ]),
              child: LineChartWidget(timeline: timeline),
            )
          ],
        ),
      );

}
