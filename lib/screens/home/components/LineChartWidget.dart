import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'LineTitles.dart';

class LineChartWidget extends StatelessWidget {
  List timeline;

  LineChartWidget({required this.timeline});

  final List<Color> gradientColors = [
    const Color(0xff6274aa),
    const Color(0xff8c40e8)
  ];

  @override
  Widget build(BuildContext context) {

    return LineChart(LineChartData(
        // set min max graft
        minX: 0,
        maxX: 9,
        minY: 10000,
        maxY: 20000,
        titlesData: LineTitles(timeline).getTitleData(),
        gridData: FlGridData(
          show: true,

          getDrawingHorizontalLine: (value) {
            return FlLine(
              color: const Color(0xff37434d),
              strokeWidth: 0.2,
            );
          },
          drawVerticalLine: true,
          getDrawingVerticalLine: (value) {
            return FlLine(
              color: const Color(0xff37434d),
              strokeWidth: 0.2,
            );
          },
        ),
        borderData: FlBorderData(
            show: true,
            border: Border.all(color: const Color(0xff37434d), width: 1)),

        // plot graft
        lineBarsData: [
          LineChartBarData(
              spots: [
                FlSpot(9, (timeline[1]["NewConfirmed"].toDouble())),
                FlSpot(8, (timeline[2]["NewConfirmed"].toDouble())),
                FlSpot(7, (timeline[3]["NewConfirmed"].toDouble())),
                FlSpot(6, (timeline[4]["NewConfirmed"].toDouble())),
                FlSpot(5, (timeline[5]["NewConfirmed"].toDouble())),
                FlSpot(4, (timeline[6]["NewConfirmed"].toDouble())),
                FlSpot(3, (timeline[7]["NewConfirmed"].toDouble())),
                FlSpot(2, (timeline[8]["NewConfirmed"].toDouble())),
                FlSpot(1, (timeline[9]["NewConfirmed"].toDouble())),
                FlSpot(0, (timeline[9]["NewConfirmed"].toDouble())),
              ],
              isCurved: true,
              colors: gradientColors,
              barWidth: 5,
              belowBarData: BarAreaData(
                show: true,
                colors: gradientColors
                    .map((color) => color.withOpacity(0.8))
                    .toList(),
              ))
        ]));
    ;
  }
}
