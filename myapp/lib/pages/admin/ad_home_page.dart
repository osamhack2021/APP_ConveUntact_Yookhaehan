import 'package:flutter/widgets.dart';
import 'package:myapp/components/ad_homepage_item.dart';
import 'package:myapp/pages/admin/ad_post_notice.dart';
import 'package:myapp/components/line_chart_1.dart';
import 'package:myapp/components/notice_info.dart';
import 'package:get/get.dart';
import 'package:myapp/pages/home_page/draggable_home.dart';
import 'package:flutter/material.dart';

class ADHomePageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DraggableHome(
      title: Text(""),
      headerWidget: headerWidget(context),
      //headerBottomBar: headerBottomBarWidget(),
      body: [
        Obx(
          () => ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: 3,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  if (index == 1) {
                  Get.to(() => WriteNotice());
                  }
                },
                child: ADHomePageItem(
                  homePageCard: adHomePageCardList[index],
                ),
              );
            },
          )
        ),
      ]
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
        color: Colors.blueGrey.shade200,
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
            backgroundColor: Color(0x00000000),
            child: notice[index].icon,
          ),
          title: Text("${notice[index].name} / ${notice[index].date}", style: TextStyle(color: Colors.indigo.shade200, fontWeight: FontWeight.bold)),
          subtitle: Text(notice[index].intro),
        ),
      ),
    );
  }
}
List<HomePageCard> adHomePageCardList = [
  HomePageCard(
    name: "승인 대기",
    num: 1,
  ),
  HomePageCard(
    name: "신고/문의 접수",
    num: 0,
  ),
  HomePageCard(
    name: "공지 사항",
    num: 1,
  ),
];