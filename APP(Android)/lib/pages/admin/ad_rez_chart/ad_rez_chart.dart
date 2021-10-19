import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:draggable_home/draggable_home.dart';
import 'package:flutter/widgets.dart';

class ADFacilityAnalysisScreen extends StatefulWidget {
  @override
  _ADFacilityAnalysisScreenState createState() => _ADFacilityAnalysisScreenState();
}

class _ADFacilityAnalysisScreenState extends State<ADFacilityAnalysisScreen> {
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
      child: DraggableHome(
        title: Text("시설 예약 기록"),
        headerWidget: headerWidget(context),
        //headerBottomBar: headerBottomBarWidget(),
        backgroundColor: Colors.white,
        body: [
          CustomGraph(
            tooltipBehavior: _tooltipBehavior,
            chartData: _chartData,
          ),
          CustomGraph2(
            tooltipBehavior: _tooltipBehavior,
            chartData: _chartData,
          ),
        ],
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

  Container headerWidget(BuildContext context) => Container(
        color: Colors.indigo[200],
        child: Column(
          children: [
            //CustomAppbar(title: "시설 예약 기록"),
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // CircleAvatar(
                  //   radius: 70,
                  //   backgroundColor: Colors.white,
                  //   child: Icon(Icons.person),
                  //   foregroundColor: Colors.white,
                  // ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "월별 시설이용 통계",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          //letterSpacing: 0.5,
                          fontSize: 30,
                        )
                      ),
                      CircleAvatar(
                        radius: 100,
                        backgroundColor: Color(0x00000000),
                        child: Image.asset(
                          '/workspaces/APP_ConveUntact_Yookhaehan/myapp/lib/icons/chart.png',
                          width: 100,
                          height: 100,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}

class CustomGraph extends StatelessWidget {
  const CustomGraph({
    Key? key,
    required TooltipBehavior? tooltipBehavior,
    required List<SalesData>? chartData,
  })  : _tooltipBehavior = tooltipBehavior,
        _chartData = chartData,
        super(key: key);

  final TooltipBehavior? _tooltipBehavior;
  final List<SalesData>? _chartData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350,//getgraphWidth(context),
      child: SfCartesianChart(
        // SfCartesianChart 이 그래프를 그리는 도화지임.
        title: ChartTitle(text: "시설예약기록"),
        legend: Legend(
          isVisible: true,
          overflowMode: LegendItemOverflowMode.wrap,
          position: LegendPosition.bottom,
        ),
        tooltipBehavior: _tooltipBehavior,
        series: <ChartSeries>[
          LineSeries<SalesData, double>(
            name: '체력단력실',
            dataSource: _chartData!,
            xValueMapper: (SalesData sales, _) => sales.month,
            yValueMapper: (SalesData sales, _) => sales.n1,
            //dataLabelSettings: DataLabelSettings(isVisible: true),
            enableTooltip: true,
            //markerSettings: MarkerSettings(isVisible: true),
          ),
          LineSeries<SalesData, double>(
            name: '연등실',
            dataSource: _chartData!,
            xValueMapper: (SalesData sales, _) => sales.month,
            yValueMapper: (SalesData sales, _) => sales.n2,
            //dataLabelSettings: DataLabelSettings(isVisible: true),
            enableTooltip: true,
            //markerSettings: MarkerSettings(isVisible: true),
          ),
          LineSeries<SalesData, double>(
            name: '체육관',
            dataSource: _chartData!,
            xValueMapper: (SalesData sales, _) => sales.month,
            yValueMapper: (SalesData sales, _) => sales.n3,
            //dataLabelSettings: DataLabelSettings(isVisible: true),
            enableTooltip: true,
            //markerSettings: MarkerSettings(isVisible: true),
          ),
          LineSeries<SalesData, double>(
            name: '탁구장',
            xAxisName: 'xAxisName',
            yAxisName: 'yAxisName',
            dataSource: _chartData!,
            xValueMapper: (SalesData sales, _) => sales.month,
            yValueMapper: (SalesData sales, _) => sales.n4,
            //dataLabelSettings: DataLabelSettings(isVisible: true),
            enableTooltip: true,
            //markerSettings: MarkerSettings(isVisible: true),
          ),
        ],
        primaryXAxis: NumericAxis(
          edgeLabelPlacement: EdgeLabelPlacement.shift,
          labelFormat: '{value}월',
        ),
        primaryYAxis: NumericAxis(
          interval: 20,
          labelFormat: '{value}명',
        ),
      ),
    );
  }
}

class CustomGraph2 extends StatelessWidget {
  const CustomGraph2({
    Key? key,
    required TooltipBehavior? tooltipBehavior,
    required List<SalesData>? chartData,
  })  : _tooltipBehavior = tooltipBehavior,
        _chartData = chartData,
        super(key: key);

  final TooltipBehavior? _tooltipBehavior;
  final List<SalesData>? _chartData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350,//getgraphWidth(context),
      child: SfCartesianChart(
        // SfCartesianChart 이 그래프를 그리는 도화지임.
        title: ChartTitle(text: "시설예약기록"),
        legend: Legend(
          isVisible: true,
          overflowMode: LegendItemOverflowMode.wrap,
          position: LegendPosition.bottom,
        ),
        tooltipBehavior: _tooltipBehavior,
        series: <ChartSeries>[
          StackedColumnSeries<SalesData, double>(
            name: '체력단력실',
            dataSource: _chartData!,
            xValueMapper: (SalesData sales, _) => sales.month,
            yValueMapper: (SalesData sales, _) => sales.n1,
            //dataLabelSettings: DataLabelSettings(isVisible: true),
            enableTooltip: true,
            //markerSettings: MarkerSettings(isVisible: true),
          ),
          StackedColumnSeries<SalesData, double>(
            name: '연등실',
            dataSource: _chartData!,
            xValueMapper: (SalesData sales, _) => sales.month,
            yValueMapper: (SalesData sales, _) => sales.n2,
            //dataLabelSettings: DataLabelSettings(isVisible: true),
            enableTooltip: true,
            //markerSettings: MarkerSettings(isVisible: true),
          ),
          StackedColumnSeries<SalesData, double>(
            name: '체육관',
            dataSource: _chartData!,
            xValueMapper: (SalesData sales, _) => sales.month,
            yValueMapper: (SalesData sales, _) => sales.n3,
            //dataLabelSettings: DataLabelSettings(isVisible: true),
            enableTooltip: true,
            //markerSettings: MarkerSettings(isVisible: true),
          ),
          StackedColumnSeries<SalesData, double>(
            name: '탁구장',
            xAxisName: 'xAxisName',
            yAxisName: 'yAxisName',
            dataSource: _chartData!,
            xValueMapper: (SalesData sales, _) => sales.month,
            yValueMapper: (SalesData sales, _) => sales.n4,
            //dataLabelSettings: DataLabelSettings(isVisible: true),
            enableTooltip: true,
            //markerSettings: MarkerSettings(isVisible: true),
          ),
        ],
        primaryXAxis: NumericAxis(
          edgeLabelPlacement: EdgeLabelPlacement.shift,
          labelFormat: '{value}월',
        ),
        primaryYAxis: NumericAxis(
          interval: 50,
          labelFormat: '{value}명',
        ),
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