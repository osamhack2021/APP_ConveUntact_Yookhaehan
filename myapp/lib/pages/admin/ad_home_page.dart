import 'package:flutter/widgets.dart';
import 'package:myapp/components/line_chart_1.dart';
import 'package:myapp/pages/home_page/draggable_home.dart';
import 'package:myapp/pages/admin/ad_notice_list.dart';
import 'package:myapp/pages/admin/ad_declaration_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ADHomePageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DraggableHome(
      title: Text(""),
      headerWidget: headerWidget(context),
      body: [
        listView(),
      ],
    );
  }

  Container headerWidget(BuildContext context) => Container(
        child: LineChartSample1(),
        color: Colors.indigo.shade200,
      );

  ListView listView() {
    return ListView(
      children: [
        Card(
          color: Colors.white,
          child: ListTile(
            leading: Image.asset(
                '/workspaces/APP_ConveUntact_Yookhaehan/myapp/lib/icons/confirm.png'),
            title: Text("승인 대기",
                style: TextStyle(
                    color: Colors.indigo.shade200,
                    fontWeight: FontWeight.bold)),
            trailing: Text("1 건 존재"),
            onTap: () {
              //Get.to(ADNoticeListScreen());
            },
          ),
        ),
        Card(
          color: Colors.white,
          child: ListTile(
            leading: Image.asset(
                '/workspaces/APP_ConveUntact_Yookhaehan/myapp/lib/icons/siren.png'),
            title: Text("신고/문의 접수",
                style: TextStyle(
                    color: Colors.indigo.shade200,
                    fontWeight: FontWeight.bold)),
            trailing: Text("1 건 존재"),
            onTap: () {
              Get.to(ADDeclarationListScreen());
            },
          ),
        ),
        Card(
          color: Colors.white,
          child: ListTile(
            leading: Image.asset(
                '/workspaces/APP_ConveUntact_Yookhaehan/myapp/lib/icons/loudspeaker.png'),
            title: Text("공지사항",
                style: TextStyle(
                    color: Colors.indigo.shade200,
                    fontWeight: FontWeight.bold)),
            trailing: Text("1 건 존재"),
            onTap: () {
              Get.to(ADNoticeListScreen());
            },
          ),
        ),
      ],
    );
  }
}
