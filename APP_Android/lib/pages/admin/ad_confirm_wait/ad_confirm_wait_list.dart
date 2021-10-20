import 'package:flutter/widgets.dart';
import 'package:myapp/components/custom_elevated_button.dart';
import 'package:myapp/pages/admin/ad_confirm_wait/ad_confirm_wait_list_menu.dart';
import 'package:myapp/pages/admin/ad_confirm_wait/ad_write_comment.dart';
import 'package:myapp/pages/home_page/draggable_home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cool_alert/cool_alert.dart';

class ADConfirmWaitListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DraggableHome(
      title: Text("승인 대기 내역"),
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
            Text("승인 대기 내역", style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 20)),
            Spacer(),
            Text("${rezList.length}건의 내용 존재", style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 10)),
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
    color: Colors.indigo.shade200,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "승인 대기",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                //letterSpacing: 0.5,
                fontSize: 30,
              ),
            ),
            CircleAvatar(
              radius: 100,
              backgroundColor: Color(0x00000000),
              child: Image.asset(
                '/workspaces/APP_ConveUntact_Yookhaehan/myapp/lib/icons/confirm.png',
                width: 100,
                height: 100,
              ),
            ),
          ],
        ),
        //Row(
          //mainAxisAlignment: MainAxisAlignment.center,
          //children: <Widget>[
            //Padding(
              //padding: const EdgeInsets.only(bottom: 12),
                //child: ScrollPhysicsMenuButton(
                  //theme: Theme.of(context),
                //),
            //),
          //],
        //),
      ],
    ),
  );

  ListView listView() {
    return ListView.builder(
      padding: EdgeInsets.only(top: 0),
      physics: NeverScrollableScrollPhysics(),
      itemCount: rezList.length,
      shrinkWrap: true,
      itemBuilder: (context, index) => Card(
        color: Colors.white,
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Color(0x00000000),
            child: rezList[index].icon,
          ),
          title: Text("${rezList[index].facility} (대표 예약자: ${rezList[index].user})", style: TextStyle(color: Colors.indigo.shade200, fontWeight: FontWeight.bold)),
          subtitle: Text(rezList[index].date),
          onTap:(){
            CoolAlert.show(
              context: context,
              type: CoolAlertType.info,
              title: "${rezList[index].facility}",
              text: "${rezList[index].detail}\n${rezList[index].date}",
              confirmBtnText: "승인/거절",
              confirmBtnColor: Colors.indigo.shade200,
              onConfirmBtnTap: () async {
                Get.to(ADWriteCommentScreen());
              },
            );
          },
        ),
      ),
    );
  }
}

class Rez{
  final Image icon;
  final String facility;
  final String date;
  final String detail;
  final String user;

  Rez(
    {required this.icon, required this.facility, required this.date, required this.detail, required this.user});
}

List<Rez> rezList = [
  Rez(
    icon: Image.asset('/workspaces/APP_ConveUntact_Yookhaehan/myapp/lib/icons/soccer.png'),
    facility: "풋살장",
    date: "2021년 10월 12일 (10시 00분 ~ 12시 00분)",
    detail: "병사 10명 풋살장에서 풋살경기 목적으로 예약합니다.",
    user: "1CO 일병 홍길동"
  ),
  Rez(
    icon: Image.asset('/workspaces/APP_ConveUntact_Yookhaehan/myapp/lib/icons/computer.png'),
    facility: "3CO 사이버 지식 정보방",
    date: "2021년 10월 12일 (10시 10분 ~ 12시 10분)",
    detail: "코딩공부",
    user: "3CO 상병 장발장"
  ),
  Rez(
    icon: Image.asset('/workspaces/APP_ConveUntact_Yookhaehan/myapp/lib/icons/football.png'),
    facility: "족구장",
    date: "2021년 10월 12일 (11시 40분 ~ 12시 40분)",
    detail: "간부 2명, 병사 6명 족구장에서 족구하겠습니다.",
    user: "2CO 병장 손흥민"
  ),
];