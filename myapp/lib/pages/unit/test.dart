import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Test extends StatefulWidget {
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  List<SalesData>? _chartData;
  TooltipBehavior? _tooltipBehavior;

  @override
  void initState() {
    _chartData = getChartData();
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: NewWidget(tooltipBehavior: _tooltipBehavior, chartData: _chartData),
      ),
    );
  }

  List<SalesData> getChartData() {
    // 여기서 firebase의 가공된 data 받고
    final List<SalesData> charData = [
      SalesData(5, 55, 40, 45, 48),
      SalesData(6, 33, 45, 54, 28),
      SalesData(7, 43, 23, 20, 54),
      SalesData(8, 56, 18, 43, 55),
      SalesData(9, 23, 54, 23, 11),
    ];
    return charData;
  }
}

class NewWidget extends StatelessWidget {
  const NewWidget({
    Key? key,
    required TooltipBehavior? tooltipBehavior,
    required List<SalesData>? chartData,
  }) : _tooltipBehavior = tooltipBehavior, _chartData = chartData, super(key: key);

  final TooltipBehavior? _tooltipBehavior;
  final List<SalesData>? _chartData;

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      // SfCartesianChart 이 그래프를 그리는 도화지임.
      title: ChartTitle(text: "시설예약기록"),
      legend: Legend(isVisible: true),
      tooltipBehavior: _tooltipBehavior,
      series: <ChartSeries>[
        LineSeries<SalesData, double>(
          name: '체력단력실',
          dataSource: _chartData!,
          xValueMapper: (SalesData sales, _) => sales.month,
          yValueMapper: (SalesData sales, _) => sales.n1,
          //dataLabelSettings: DataLabelSettings(isVisible: true),
          enableTooltip: true,
          markerSettings: MarkerSettings(isVisible: true),
        ),
        LineSeries<SalesData, double>(
          name: '연등실',
          dataSource: _chartData!,
          xValueMapper: (SalesData sales, _) => sales.month,
          yValueMapper: (SalesData sales, _) => sales.n2,
          //dataLabelSettings: DataLabelSettings(isVisible: true),
          enableTooltip: true,
          markerSettings: MarkerSettings(isVisible: true),
        ),
        LineSeries<SalesData, double>(
          name: '체육관',
          dataSource: _chartData!,
          xValueMapper: (SalesData sales, _) => sales.month,
          yValueMapper: (SalesData sales, _) => sales.n3,
          //dataLabelSettings: DataLabelSettings(isVisible: true),
          enableTooltip: true,
          markerSettings: MarkerSettings(isVisible: true),
        ),
        LineSeries<SalesData, double>(
          name: '탁구장',
          dataSource: _chartData!,
          xValueMapper: (SalesData sales, _) => sales.month,
          yValueMapper: (SalesData sales, _) => sales.n4,
          //dataLabelSettings: DataLabelSettings(isVisible: true),
          enableTooltip: true,
          markerSettings: MarkerSettings(isVisible: true),
        ),
      ],
      primaryXAxis: NumericAxis(
        edgeLabelPlacement: EdgeLabelPlacement.shift,
        labelFormat: '{value}월',
      ),
      primaryYAxis: NumericAxis(
        interval: 5,
        labelFormat: '{value}명',
      ),
    );
  }
}

class SalesData {
  SalesData(this.month, this.n1, this.n2, this.n3, this.n4);
  final double month;
  final double n1;
  final double n2;
  final double n3;
  final double n4;
}
