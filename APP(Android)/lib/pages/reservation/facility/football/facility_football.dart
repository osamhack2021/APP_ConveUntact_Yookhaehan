   
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:draggable_home/draggable_home.dart';

class ReservFootballScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DraggableHome(
      title: Text("족구장"),
      headerWidget: headerWidget(context),
      //headerBottomBar: headerBottomBarWidget(),
      body: [
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
              "족구장",
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
            '/workspaces/APP_ConveUntact_Yookhaehan/myapp/lib/icons/football.png',
            width: 100,
            height: 100,
          ),
        ),
      ],
    ),
  );
}