import 'package:flutter/widgets.dart';
import 'package:myapp/components/notice_info.dart';
import 'package:draggable_home/draggable_home.dart';
import 'package:flutter/material.dart';

import '../../components/line_chart_1.dart';

class HomePageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DraggableHome(
      title: Text("공지사항"),
      //actions: [
        //IconButton(onPressed: () {}, icon: Icon(Icons.person, color: Colors.white,)),
      //],
      headerWidget: headerWidget(context),
      //headerBottomBar: headerBottomBarWidget(),
      body: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Padding(padding: EdgeInsets.all(10)),
            Text("공지사항", style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 20)),
            Text("${notice.length}건의 내용 존재", textAlign: TextAlign.right, style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 10)),
            SizedBox(width: 6),
            
          ]
          
        ),
        Divider(),
        listView(),
      ],
      //fullyStretchable: true,
      //expandedBody: Text("Expanded"),
    );
  }

  //Container headerBottomBarWidget() {
    //return Container(
      //child: Row(
        //mainAxisSize: MainAxisSize.min,
        //mainAxisAlignment: MainAxisAlignment.end,
        //crossAxisAlignment: CrossAxisAlignment.center,
        //children: [//설정 아이콘
          //IconButton(onPressed: () {}, icon: Icon(Icons.person, color: Colors.white),),
        //],
      //),
    //);
  //}

  Container headerWidget(BuildContext context) => Container(
        child: LineChartSample1(),
        color: Colors.pink.shade100
      );

  ListView listView() {
    return ListView.builder(
      padding: EdgeInsets.only(top: 0),
      physics: NeverScrollableScrollPhysics(),
      itemCount: notice.length,
      shrinkWrap: true,
      itemBuilder: (context, index) => Card(
        color: Colors.white,
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.pink.shade100,
            child: notice[index].icon, foregroundColor: Colors.white,
          ),
          title: Text("${notice[index].name} / ${notice[index].date}", style: TextStyle(color: Colors.pink.shade100, fontWeight: FontWeight.bold)),
          subtitle: Text(notice[index].intro),
        ),
      ),
    );
  }
}