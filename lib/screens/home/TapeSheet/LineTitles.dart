import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class LineTitles {
  List timeline;

  LineTitles(this.timeline);

  String getDate(int x) {
    return timeline[x]["Date"].toString().substring(0, 5);
  }

  getTitleData() => FlTitlesData(
      show: true,
      topTitles: SideTitles(
        showTitles: true,
        reservedSize: 20,
        getTitles: (value) {
          switch (value.toInt()) {
            case 1:
              return "";
          }
          return "";
        },
      ),
      rightTitles: SideTitles(
        showTitles: true,
        reservedSize: 10,
        getTitles: (value) {
          switch (value.toInt()) {
            case 1:
              return "";
          }
          return "";
        },
      ),

      // show horizontal
      bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 20,
          getTextStyles: (value) =>
              const TextStyle(color: Color(0xff000000), fontSize: 12),
          getTitles: (value) {
            switch (value.toInt()) {
              case 8:
                return getDate(0);
              case 6:
                return getDate(2);
              case 4:
                return getDate(4);
              case 2:
                return getDate(6);
            }
            return " ";
          }),

      // vertical
      leftTitles: SideTitles(
        showTitles: true,
        getTitles: (value) {
          switch (value.toInt()) {
            case 13000:
              return "13K";
            case 15000:
              return "15K";
            case 17000:
              return "17K";
            case 18000:
              return "18K";
            case 19000:
              return "19K";
          }
          return " ";
        },
        reservedSize: 25,
      ));
}
