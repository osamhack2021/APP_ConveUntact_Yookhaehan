import 'package:flutter/widgets.dart';
import 'package:myapp/components/line_chart_1.dart';
import 'package:myapp/pages/home_page/draggable_home.dart';
import 'package:myapp/pages/admin/ad_notice_list.dart';
import 'package:myapp/pages/admin/ad_declaration_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/components/notice_info.dart';

class ADHomePageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DraggableHome(
      title: Text(""),
      //actions: [
        //IconButton(onPressed: () {}, icon: Icon(Icons.person, color: Colors.white,)),
      //],
      headerWidget: headerWidget(context),
      //headerBottomBar: headerBottomBarWidget(),
      body: [
        //Row(
          //crossAxisAlignment: CrossAxisAlignment.baseline,
          //textBaseline: TextBaseline.alphabetic,
          //children: [
            //Padding(padding: EdgeInsets.all(10)),
            //Text("공지사항    ", style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 20)),
            //Spacer(),
            //Text("${adHomePageCard.length}건의 내용 존재", style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 10)),
            //SizedBox(width: 6),
          //]
        //),
        //Divider(),
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
    color: Colors.indigo.shade200,
  );

  ListView listView() {
    return ListView.builder(
      padding: EdgeInsets.only(top: 0),
      physics: NeverScrollableScrollPhysics(),
      itemCount: adHomePageCard.length,
      shrinkWrap: true,
      itemBuilder: (context, index) => Card(
        color: Colors.white,
        child: ListTile(
          leading: adHomePageCard[index].icon,
          title: Text("${adHomePageCard[index].name}", style: TextStyle(color: Colors.indigo.shade200, fontWeight: FontWeight.bold)),
          //subtitle: Text(adHomePageCard[index].num),
          trailing: Text("${adHomePageCard[index].num} 건 존재"),
          onTap:(){
            if (index == 0) {

            } else if (index == 1) {
              Get.to(ADDeclarationListScreen());
            } else if (index == 2) {
              Get.to(ADNoticeListScreen());
            }
          },
        ),
      ),
    );
  }
}

class HomePageCard{
  final Image icon;
  final String name;
  final int num;

  HomePageCard(
    {required this.icon, required this.name, required this.num});
}

List<HomePageCard> adHomePageCard = [
  HomePageCard(
    icon: Image.asset('/workspaces/APP_ConveUntact_Yookhaehan/myapp/lib/icons/confirm.png'),
    name: "승인 대기",
    num: 1,
  ),
  HomePageCard(
    icon: Image.asset('/workspaces/APP_ConveUntact_Yookhaehan/myapp/lib/icons/siren.png'),
    name: "신고/문의 접수",
    num: declarationList.length,
  ),
  HomePageCard(
    icon: Image.asset('/workspaces/APP_ConveUntact_Yookhaehan/myapp/lib/icons/loudspeaker.png'),
    name: "공지 사항",
    num: notice.length,
  ),
];