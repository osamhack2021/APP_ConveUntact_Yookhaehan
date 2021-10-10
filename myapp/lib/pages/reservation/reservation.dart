import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:myapp/components/facility_info.dart';
import 'package:draggable_home/draggable_home.dart';
import 'package:flutter/material.dart';
import 'package:myapp/pages/reservation/facility/basketball/basketball_rez_page.dart';
import 'package:myapp/pages/reservation/facility/computer/facility_1co_computer_menu.dart';
import 'package:myapp/pages/reservation/facility/football/football_rez_page.dart';
import 'package:myapp/pages/reservation/facility/karaoke/facility_1co_karaoke_menu.dart';
import 'package:myapp/pages/reservation/facility/playground/playground_rez_page.dart';
import 'package:myapp/components/controller/football_controller.dart';
import 'package:myapp/components/controller/soccer_controller.dart';
import 'package:myapp/components/controller/basketball_controller.dart';
import 'package:myapp/components/controller/playground_controller.dart';
import 'package:myapp/components/controller/utilityHall_controller.dart';
import 'package:myapp/pages/reservation/facility/soccer/soccer_rez_page.dart';
import 'package:myapp/pages/reservation/facility/utilityhall/utilityHall_rez_page.dart';

class ReservationScreen extends StatelessWidget {
  SoccerController _soccercontroller = Get.put(SoccerController());
  BasketballController _basketballcontroller = Get.put(BasketballController());
  FootballController _footballcontroller = Get.put(FootballController());
  PlaygroundController _playgroundcontroller = Get.put(PlaygroundController());
  UtilityHallController _utilityHallcontroller = Get.put(UtilityHallController());

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
        personalListView(),
        Row(
          children: [
            Padding(padding: EdgeInsets.all(10)),
            Text("단체 이용시설", style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 20)),
          ]
        ),
        Divider(),
        teamListView(),
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
              _soccercontroller.soccerField.value =
                _soccercontroller.soccerFieldList[index];
                _soccercontroller.stAbsTime.value = null;
                _soccercontroller.endAbsTime.value = null;
              Get.to(SoccerRezPage(DateTime.now()));
            } else if(teamFacility[index].name == '농구장'){
              _basketballcontroller.basketballField.value =
                _basketballcontroller.basketballFieldList[index];
                _basketballcontroller.stAbsTime.value = null;
                _basketballcontroller.endAbsTime.value = null;
              Get.to(BasketballRezPage(DateTime.now()));
            } else if(teamFacility[index].name == '족구장'){
              _footballcontroller.footballField.value =
                _footballcontroller.footballFieldList[index];
                _footballcontroller.stAbsTime.value = null;
                _footballcontroller.endAbsTime.value = null;
              Get.to(FootballRezPage(DateTime.now()));
            } else if(teamFacility[index].name == '다목적실'){
              _utilityHallcontroller.utilityHall.value =
                _utilityHallcontroller.utilityHallList[index];
                _utilityHallcontroller.stAbsTime.value = null;
                _utilityHallcontroller.endAbsTime.value = null;
              Get.to(UtilityHallRezPage(DateTime.now()));
            } else if(teamFacility[index].name == '연병장'){
              _playgroundcontroller.playground.value =
                _playgroundcontroller.playgroundList[index];
                _playgroundcontroller.stAbsTime.value = null;
                _playgroundcontroller.endAbsTime.value = null;
              Get.to(PlaygroundRezPage(DateTime.now()));
            } 
          },
        ),
      ),
    );
  }
  ListView personalListView() {
    bool selected = true;
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
            if(personalFacility[index].name == '1CO 노래방'){
              //Get.to(Reserv1Karaoke());
            } else if(personalFacility[index].name == '2CO 노래방'){
              Get.to(Reserv1Karaoke());
            } else if(personalFacility[index].name == '3CO 노래방'){
              Get.to(Reserv1Karaoke());
            } else if(personalFacility[index].name == '1CO 사이버지식정보방'){
              Get.to(Reserv1Computer());
            } else if(personalFacility[index].name == '2CO 사이버지식정보방'){
              Get.to(Reserv1Computer());
            } else if(personalFacility[index].name == '3CO 사이버지식정보방'){
              Get.to(Reserv1Computer());
            }
          },
        ),
      ),
    );
  }
}