import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:myapp/components/facility_info.dart';
import 'package:draggable_home/draggable_home.dart';
import 'package:flutter/material.dart';
import 'package:myapp/pages/reservation/facility/basketball/facility_basketball_menu.dart';
import 'package:myapp/pages/reservation/facility/computer/facility_computer_menu.dart';
import 'package:myapp/pages/reservation/facility/football/facility_football_menu.dart';
import 'package:myapp/pages/reservation/facility/karaoke/facility_karaoke_menu.dart';
import 'package:myapp/pages/reservation/facility/library/facility_library_menu.dart';
import 'package:myapp/pages/reservation/facility/playground/facility_playground_menu.dart';
import 'package:myapp/pages/reservation/facility/soccer/facility_soccer_menu.dart';

import '../../components/line_chart_1.dart';

class ReservationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DraggableHome(
      title: Text("시설 예약 페이지"),
      //actions: [
        //IconButton(onPressed: () {}, icon: Icon(Icons.person, color: Colors.white,)),
      //],
      headerWidget: headerWidget(context),
      //headerBottomBar: headerBottomBarWidget(),
      body: [
        Row(
          children: [
            Padding(padding: EdgeInsets.all(10)),
            Text("개인 이용시설", style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 20)),
          ]
        ),
        Divider(),
        teamListView(),
        Row(
          children: [
            Padding(padding: EdgeInsets.all(10)),
            Text("단체 이용시설", style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 20)),
          ]
        ),
        Divider(),
        personalListView(),
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
    color: Colors.pink.shade100,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "예약 페이지",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
          ],
        ),
        CircleAvatar(
          radius: 50,
          backgroundColor: Color(0x00000000),
          child: Image.asset(
            '/workspaces/APP_ConveUntact_Yookhaehan/myapp/lib/icons/reserved.png',
            width: 100,
            height: 100
          ),
        ),
      ],
    ),
  );

  ListView teamListView() {
    return ListView.builder(
      padding: EdgeInsets.only(top: 0),
      physics: NeverScrollableScrollPhysics(),
      itemCount: teamFacility.length,
      shrinkWrap: true,
      itemBuilder: (context, index) => Card(
        color: Colors.white,
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Color(0x00000000),
            child: teamFacility[index].icon,
          ),
          title: Text("${teamFacility[index].name}", style: TextStyle(color: Colors.pink.shade100, fontWeight: FontWeight.bold)),
          subtitle: Text(teamFacility[index].intro),
          onTap: (){
            if(teamFacility[index].name == '풋살장'){
              Get.to(ReservSoccer());
            } else if(teamFacility[index].name == '농구장'){
              Get.to(ReservBasketball());
            } else if(teamFacility[index].name == '족구장'){
              Get.to(ReservFootball());
            } else if(teamFacility[index].name == '독서실'){
              Get.to(ReservLibrary());
            } else if(teamFacility[index].name == '연병장'){
              Get.to(ReservPlayground());
            } 
          },
        ),
      ),
    );
  }
  ListView personalListView() {
    return ListView.builder(
      padding: EdgeInsets.only(top: 0),
      physics: NeverScrollableScrollPhysics(),
      itemCount: personalFacility.length,
      shrinkWrap: true,
      itemBuilder: (context, index) => Card(
        color: Colors.white,
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Color(0x00000000),
            child: personalFacility[index].icon,
          ),
          title: Text("${personalFacility[index].name}", style: TextStyle(color: Colors.pink.shade100, fontWeight: FontWeight.bold)),
          subtitle: Text(personalFacility[index].intro),
          onTap: (){
            if(personalFacility[index].name == '노래방'){
              Get.to(ReservKaraoke());
            } else if(personalFacility[index].name == '사이버 지식 정보방'){
              Get.to(ReservComputer());
            }
          },
        ),
      ),
    );
  }
}