import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:myapp/components/controller/tableTennis_controller.dart';
import 'package:myapp/components/info/facility_info.dart';
import 'package:draggable_home/draggable_home.dart';
import 'package:flutter/material.dart';
import 'package:myapp/pages/reservation/facility/basketball_rez_page.dart';
import 'package:myapp/pages/reservation/facility/computer/facility_computer_menu.dart';
import 'package:myapp/pages/reservation/facility/football_rez_page.dart';
import 'package:myapp/pages/reservation/facility/karaoke/facility_karaoke_menu.dart';
import 'package:myapp/pages/reservation/facility/library_rez_page.dart';
import 'package:myapp/pages/reservation/facility/playground_rez_page.dart';
import 'package:myapp/components/controller/football_controller.dart';
import 'package:myapp/components/controller/soccer_controller.dart';
import 'package:myapp/components/controller/basketball_controller.dart';
import 'package:myapp/components/controller/library_controller.dart';
import 'package:myapp/components/controller/playground_controller.dart';
import 'package:myapp/components/controller/utilityHall_controller.dart';
import 'package:myapp/pages/reservation/facility/soccer_rez_page.dart';
import 'package:myapp/pages/reservation/facility/utilityHall_rez_page.dart';

class ReservationScreen extends StatelessWidget {
  SoccerController _soccercontroller = Get.put(SoccerController());
  BasketballController _basketballcontroller = Get.put(BasketballController());
  LibraryController _librarycontroller = Get.put(LibraryController());
  FootballController _footballcontroller = Get.put(FootballController());
  PlaygroundController _playgroundcontroller = Get.put(PlaygroundController());
  UtilityHallController _utilityHallcontroller = Get.put(UtilityHallController());
  TableTennisController _tableTenniscontroller = Get.put(TableTennisController());
  @override
  Widget build(BuildContext context) {
    return DraggableHome(
      title: Text("시설 예약 페이지"),
      headerWidget: headerWidget(context),
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
    );
  }
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
            '/workspaces/APP_ConveUntact_Yookhaehan/APP_Android/lib/icons/reserved.png',
            width: 100,
            height: 100
          ),
        ),
      ],
    ),
  );
  ListView teamListView() {

    // UnitController unit = Get.put(UnitController());
    // FacilityController f = Get.put(FacilityController());
    // f.findByUnitCode(unit.principal.value.unitcode!);

    return ListView.builder(
      padding: EdgeInsets.only(top: 0),
      physics: NeverScrollableScrollPhysics(),
      itemCount: teamFacility.length,
      //itemCount: f.facilitys.length,
      shrinkWrap: true,
      itemBuilder: (context, index) => Card(
        color: Colors.white,
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Color(0x00000000),
            child: teamFacility[index].icon,
            //child: Image.asset('${f.facilitys[index].picture!}'),
          ),
          title: Text("${teamFacility[index].name}", style: TextStyle(color: Colors.pink.shade100, fontWeight: FontWeight.bold)),
          subtitle: Text(teamFacility[index].intro),
          //title: Text("${f.facilitys[index].name}", style: TextStyle(color: Colors.pink.shade100, fontWeight: FontWeight.bold)),
          //subtitle: Text("${f.facilitys[index].detail}"),
          onTap: (){
            if(teamFacility[index].name == '풋살장'){
              _soccercontroller.soccerField.value =
                _soccercontroller.soccerFieldList[index];
                _soccercontroller.stAbsTime.value = null;
                _soccercontroller.endAbsTime.value = null;
              Get.to(SoccerRezPage(DateTime.now()), arguments: index);
            } else if(teamFacility[index].name == '농구장'){
              _basketballcontroller.basketballField.value =
                _basketballcontroller.basketballFieldList[index];
                _basketballcontroller.stAbsTime.value = null;
                _basketballcontroller.endAbsTime.value = null;
              Get.to(BasketballRezPage(DateTime.now()));
            } else if(teamFacility[index].name == '독서실'){
              _librarycontroller.library.value =
                _librarycontroller.libraryList[index];
                _librarycontroller.stAbsTime.value = null;
                _librarycontroller.endAbsTime.value = null;
              Get.to(LibraryRezPage(DateTime.now()));
            } else if(teamFacility[index].name == '연병장'){
              _playgroundcontroller.playground.value =
                _playgroundcontroller.playgroundList[index];
                _playgroundcontroller.stAbsTime.value = null;
                _playgroundcontroller.endAbsTime.value = null;
              Get.to(PlaygroundRezPage(DateTime.now()));
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
            } else if(teamFacility[index].name == '탁구장'){
              _tableTenniscontroller.tableTennisField.value =
                _tableTenniscontroller.tableTennisFieldList[index];
                _tableTenniscontroller.stAbsTime.value = null;
                _tableTenniscontroller.endAbsTime.value = null;
              Get.to(UtilityHallRezPage(DateTime.now()));
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
          subtitle: Text("${personalFacility[index].intro}"),
          onTap: (){
            if(personalFacility[index].name == '노래방'){
              Get.to(RezKaraokeListPage());
            } else if(personalFacility[index].name == '사이버 지식 정보방'){
              Get.to(Reserv1Computer());
            }
          },
        ),
      ),
    );
  }
}