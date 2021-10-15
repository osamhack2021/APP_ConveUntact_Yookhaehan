import 'package:flutter/widgets.dart';
import 'package:myapp/components/line_chart_1.dart';
import 'package:myapp/components/notice_info.dart';
import 'package:myapp/controller/facility_controller.dart';
import 'package:myapp/controller/user_controller.dart';
import 'draggable_home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
              Text("공지사항    ",
                  style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 20)),
              Spacer(),
              Text("${notice.length}건의 내용 존재",
                  style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 10)),
              SizedBox(width: 6),
            ]),
        Divider(),
        listView(),
      ],
    );
  }

  Container headerWidget(BuildContext context) =>
      Container(child: LineChartSample1(), color: Colors.pink.shade100);

  ListView listView() {
    //to do : 공지사항 리스트 뿌리기
    UserController u = Get.put(UserController());
    final String? unitcode = u.principal.value.unitcode;
    FacilityController f = Get.put(FacilityController(unitcode));

    return ListView.builder(
      padding: EdgeInsets.only(top: 0),
      physics: NeverScrollableScrollPhysics(),
      itemCount: notice.length,
      //itemCount: f.facilitys.length,
      shrinkWrap: true,
      itemBuilder: (context, index) => Card(
        color: Colors.white,
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Color(0x00000000),
            child: notice[index].icon,
          ),
          title: Text(
            "${notice[index].name} / ${notice[index].date}",
            style: TextStyle(
              color: Colors.pink.shade100,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(notice[index].intro),
        ),
      ),
    );
  }
}
