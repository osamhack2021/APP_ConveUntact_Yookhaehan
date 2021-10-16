   
import 'dart:html';

import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:draggable_home/draggable_home.dart';
import 'package:get/get.dart';
import 'package:myapp/components/pc_info.dart';
import 'package:myapp/pages/my_reservation/my_reservation_menu.dart';

class Reserv1ComputerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DraggableHome(
      title: Text("X 중대 사지방"),
      headerWidget: headerWidget(context),
      //headerBottomBar: headerBottomBarWidget(),
      body: [
        listView()
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
              "1CO 사지방",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                //letterSpacing: 0.5,
                fontSize: 40,
              )
            ),
          ],
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
  );

  ListView listView() {
    return ListView.builder(
      padding: EdgeInsets.only(top: 0),
      physics: NeverScrollableScrollPhysics(),
      itemCount: computer_1co.length,
      shrinkWrap: true,
      itemBuilder: (context, index) => Card(
        color: Colors.white,
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Color(0x00000000),
            child: Image.asset('/workspaces/APP_ConveUntact_Yookhaehan/myapp/lib/icons/computer.png'),
          ),
          title: Text("${computer_1co[index].id}번 PC / ${computer_1co[index].os}", style: TextStyle(color: Colors.pink.shade100, fontWeight: FontWeight.bold)),
          subtitle: Text(computer_1co[index].isuse ? "사용 불가" : "사용 가능"),
          onTap: (){
            if(computer_1co[index].isuse){
              CoolAlert.show(
                context: context,
                type: CoolAlertType.error,
                text: "현재 사용중인 좌석입니다.",
                confirmBtnColor: Colors.pink.shade200,
              );
            } else {
              CoolAlert.show(
                context: context,
                type: CoolAlertType.confirm,
                text: "사용 가능한 좌석입니다.",
                confirmBtnColor: Colors.pink.shade200,
                confirmBtnText: "예약하기",
                cancelBtnText: "다시선택",
                onConfirmBtnTap: () async {
                  CoolAlert.show(
                    context: context,
                    type: CoolAlertType.success,
                    text: "${computer_1co[index].id}번 PC\n정상적으로 예약이 완료되었습니다.",
                    confirmBtnColor: Colors.pink.shade200,
                    onConfirmBtnTap: () async {
                      Get.to(MyReservation());
                    }
                  );
                }
              );
            }
          },
        ),
      ),
    );
  }
}