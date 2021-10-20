import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:draggable_home/draggable_home.dart';
import 'package:get/get.dart';
import 'package:myapp/components/info/company_info.dart';
import 'package:myapp/components/controller/karaoke_1co_controller.dart';
import 'package:myapp/components/controller/karaoke_2co_controller.dart';
import 'package:myapp/components/controller/karaoke_3co_controller.dart';
import 'package:myapp/pages/reservation/facility/karaoke/karaoke_1co_rez_page.dart';
import 'package:myapp/pages/reservation/facility/karaoke/karaoke_2co_rez_page.dart';
import 'package:myapp/pages/reservation/facility/karaoke/karaoke_3co_rez_page.dart';

class RezKaraokeListScreen extends StatelessWidget {
  Karaoke1COController _karaoke1COController = Get.put(Karaoke1COController());
  Karaoke2COController _karaoke2COController = Get.put(Karaoke2COController());
  Karaoke3COController _karaoke3COController = Get.put(Karaoke3COController());
  @override
  Widget build(BuildContext context) {
    return DraggableHome(
      title: Text("사이버 지식 정보방"),
      headerWidget: headerWidget(context),
      //headerBottomBar: headerBottomBarWidget(),
      body: [
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
    color: Colors.pink.shade100,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "노래방",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                //letterSpacing: 0.5,
                fontSize: 30,
              )
            ),
            CircleAvatar(
              radius: 100,
              backgroundColor: Color(0x00000000),
              child: Image.asset(
                '/workspaces/APP_ConveUntact_Yookhaehan/APP_Android/lib/icons/karaoke.png',
                width: 100,
                height: 100,
              ),
            ),
          ],
        ),
      ],
    ),
  );

  ListView listView() {
    return ListView.builder(
      padding: EdgeInsets.only(top: 0),
      physics: NeverScrollableScrollPhysics(),
      itemCount: companys.length,
      shrinkWrap: true,
      itemBuilder: (context, index) => Card(
        color: Colors.white,
        child: ListTile(
          //leading: CircleAvatar(
            //backgroundColor: Color(0x00000000),
            //child: Image.asset('/workspaces/APP_ConveUntact_Yookhaehan/myapp/lib/icons/computer.png'),
          //),
          title: Text("${companys[index]}", style: TextStyle(color: Colors.pink.shade100, fontWeight: FontWeight.bold)),
          onTap: () {
            if(companys[index] == "1 중대") {
              _karaoke1COController.karaoke1COField.value =
                _karaoke1COController.karaoke1COFieldList[0];
              _karaoke1COController.stAbsTime.value = null;
              _karaoke1COController.endAbsTime.value = null;
              Get.to(Karaoke1CORezPage(DateTime.now()));
            } else if(companys[index] == "2 중대") {
              _karaoke2COController.karaoke2COField.value =
                _karaoke2COController.karaoke2COFieldList[0];
              _karaoke2COController.stAbsTime.value = null;
              _karaoke2COController.endAbsTime.value = null;
              Get.to(Karaoke2CORezPage(DateTime.now()));
            } else if(companys[index] == "3 중대") {
              _karaoke3COController.karaoke3COField.value =
                _karaoke3COController.karaoke3COFieldList[0];
              _karaoke3COController.stAbsTime.value = null;
              _karaoke3COController.endAbsTime.value = null;
              Get.to(Karaoke3CORezPage(DateTime.now()));
            }
          },
        ),
      ),
    );
  }
}