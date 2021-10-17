   
import 'dart:html';

import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:draggable_home/draggable_home.dart';
import 'package:get/get.dart';
import 'package:myapp/components/controller/computer_1co_controller.dart';
import 'package:myapp/components/controller/computer_2co_controller.dart';
import 'package:myapp/components/controller/computer_3co_controller.dart';
import 'package:myapp/components/custom_elevated_button.dart';
import 'package:myapp/components/pc_info.dart';
import 'package:myapp/pages/my_reservation/my_reservation_menu.dart';
import 'package:myapp/pages/reservation/facility/computer/computer_1co_rez_page.dart';
import 'package:myapp/pages/reservation/facility/computer/computer_2co_rez_page.dart';
import 'package:myapp/pages/reservation/facility/computer/computer_3co_rez_page.dart';

class RezComputerScreen extends StatelessWidget {
  Computer1COController _computer1COController = Get.put(Computer1COController());
  Computer2COController _computer2COController = Get.put(Computer2COController());
  Computer3COController _computer3COController = Get.put(Computer3COController());
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
              "사이버 지식 정보방",
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
                '/workspaces/APP_ConveUntact_Yookhaehan/myapp/lib/icons/computer.png',
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
      itemCount: 3,
      shrinkWrap: true,
      itemBuilder: (context, index) => Card(
        color: Colors.white,
        child: ListTile(
          //leading: CircleAvatar(
            //backgroundColor: Color(0x00000000),
            //child: Image.asset('/workspaces/APP_ConveUntact_Yookhaehan/myapp/lib/icons/computer.png'),
          //),
          title: Text("${index+1}중대", style: TextStyle(color: Colors.pink.shade100, fontWeight: FontWeight.bold)),
          onTap: () {
            if(index == 0) {
              _computer1COController.computer1COField.value =
                _computer1COController.computer1COFieldList[0];
              _computer1COController.stAbsTime.value = null;
              _computer1COController.endAbsTime.value = null;
              Get.to(Computer1CORezPage(DateTime.now()));
            } else if(index == 1) {
              _computer2COController.computer2COField.value =
                _computer2COController.computer2COFieldList[0];
              _computer2COController.stAbsTime.value = null;
              _computer2COController.endAbsTime.value = null;
              Get.to(Computer2CORezPage(DateTime.now()));
            } else if(index == 2) {
              _computer3COController.computer3COField.value =
                _computer3COController.computer3COFieldList[0];
              _computer3COController.stAbsTime.value = null;
              _computer3COController.endAbsTime.value = null;
              Get.to(Computer3CORezPage(DateTime.now()));
            }
          },
        ),
      ),
    );
  }
}