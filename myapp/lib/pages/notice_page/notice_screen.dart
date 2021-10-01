import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:myapp/components/line_chart_1.dart';
import 'package:myapp/pages/notice_page/notice_card.dart';
import 'package:myapp/pages/notice_page/notice_info.dart';

class NoticeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text("공지사항"),
      ),
      body: Column(
        children: [
          SizedBox(height: 10),
          LineChartSample1(),
          Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:20, vertical: 10),
            child: Row(
              children: [
                Text("${notice.length}"),
              ],
            )
          ),
          Expanded(
            child: ListView(
              children: [
                NoticeCard(notice: notice[0]),
              ],
            )
          )
        ],
      ),
    );
  }
}