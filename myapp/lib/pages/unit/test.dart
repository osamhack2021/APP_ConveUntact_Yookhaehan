import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class Test extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var reversedList;
    return LineChart(
        LineChartData(
            lineBarsData: [
          LineChartBarData(
              spots: [
            for (int i = reversedList.length - 1; i >= 0; i--)
              FlSpot(i.toDouble(), reversedList[i].weight),
          ])
        ]));
  }
}